package be.klusjes.web;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import be.klusjes.entities.Customer;
import be.klusjes.entities.JobType;
import be.klusjes.entities.Location;
import be.klusjes.entities.Reviews;
import be.klusjes.entities.Worker;
import be.klusjes.service.CustomerService;
import be.klusjes.service.JobTypeService;
import be.klusjes.service.LocationService;
import be.klusjes.service.ReviewService;
import be.klusjes.service.WorkerService;

@Controller
@RequestMapping("/jobs")
public class JobsController {
	/*
	 * This Controller allows customers to handle everything workerrelated
	 */

	@Autowired
	CustomerService customerService;
	@Autowired
	JobTypeService jobTypeService;
	@Autowired
	LocationService locationService;
	@Autowired
	WorkerService workerService;
	@Autowired
	ReviewService reviewService;

	private List<JobType> jobTypes = new ArrayList<>();
	private List<Location> locations = new ArrayList<>();
	private List<String> allProvinces = new ArrayList<>();

	// allows finding workers by keyword and by jobtype/location
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String showStartSearch(Model model,
			@ModelAttribute("workersForm") WorkersForm workersForm) {

		jobTypes = jobTypeService.findAll();
		locations = locationService.findAll();
		allProvinces = locationService.findProvinces();
		model.addAttribute("jobTypes", jobTypes);
		model.addAttribute("locations", locations);
		model.addAttribute("allProvinces", allProvinces);
		return "jobs/search";
	}

	@RequestMapping(value = "/dosearch", method = RequestMethod.POST, params = "locationtype")
	public String doSearch(Model model,
			@Valid @ModelAttribute("workersForm") WorkersForm workersForm,
			BindingResult result) {
		model.addAttribute("jobTypes", jobTypes);
		model.addAttribute("locations", locations);
		model.addAttribute("allProvinces", allProvinces);
		if (result.hasErrors()) {
			return "jobs/search";
		}
		List<Worker> relevantWorkers = workerService
				.findWorkersByJobTypeAndLocation(workersForm.getJobTypesLong(),
						workersForm.getLocationLong());

		List<Worker> shownWorkers = new ArrayList<Worker>();
		for (Worker worker : relevantWorkers) {
			if (worker.getUser().isEnabled()) {
				shownWorkers.add(worker);
			}
		}

		model.addAttribute("workers", shownWorkers);
		return "jobs/search";
	}

	// search workers by keywords
	@RequestMapping(value = "/dosearch", method = RequestMethod.POST, params = "keyword")
	public String doSearchWorkersByName(Model model,
			@RequestParam String keyword,
			@ModelAttribute("workersForm") WorkersForm workersForm) {
		System.out.println("hey");
		List<Worker> relevantWorkers = workerService
				.findCustomersByText(keyword);
		List<Worker> shownWorkers = new ArrayList<Worker>();
		for (Worker worker : relevantWorkers) {
			if (worker.getUser().isEnabled()) {
				shownWorkers.add(worker);
			}
		}
		model.addAttribute("jobTypes", jobTypes);
		model.addAttribute("locations", locations);
		model.addAttribute("allProvinces", allProvinces);
		model.addAttribute("workers", shownWorkers);
		return "jobs/search";

	}

	// show worker details
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String showDetails(Model model, @RequestParam Long id) {
		Worker worker = workerService.readById(id);
		model.addAttribute("worker", worker);
		return "jobs/workerdetail";
	}

	// let customer create a review
	@RequestMapping(value = "/writereview", method = RequestMethod.GET)
	public String showReviews(Model model,
			@ModelAttribute("reviewForm") ReviewForm reviewForm,
			@RequestParam Long id) {
		Worker worker = workerService.readById(id);
		model.addAttribute("worker", worker);
		return "jobs/writereview";
	}

	@RequestMapping(value = "/reviews", method = RequestMethod.POST)
	public String showReviews(Model model,
			@RequestParam(required = false) Integer rating,
			@ModelAttribute("reviewForm") ReviewForm reviewForm,
			BindingResult result) {

		Worker worker = workerService.readById(reviewForm.getWorkerId());
		if (result.hasErrors()) {
			return "jobs/reviews";
		}

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		Customer customer = customerService.read(auth.getName());
		Reviews review = reviewForm.convertReviewFormToReview(customer, worker);
		review.setCustomer(customer);
		if (rating != null) {
			worker.addReviewStars(rating);
		}
		review.setWorker(worker);
		reviewService.create(review);
		customer.setNumberOfReviewsPosted(customer.getNumberOfReviewsPosted() + 1);
		customerService.update(customer);
		worker.addReviewStars(rating);
		workerService.update(worker);

		model.addAttribute("review", review);
		return "jobs/reviewwritten";
	}

	// handles reviews for worker users
	@RequestMapping(value = "/reviews", method = RequestMethod.GET)
	public String showReviewOfWorker(Model model, @RequestParam Long id) {
		Worker worker = workerService.readById(id);
		List<Reviews> reviews = reviewService.readByWorkerId(worker.getId());
		model.addAttribute("worker", worker);
		model.addAttribute("reviews", reviews);
		return "jobs/reviews";
	}

}
