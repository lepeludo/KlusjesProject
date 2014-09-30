package be.klusjes.web;

import java.util.Arrays;
import java.util.List;

import javax.mail.MessagingException;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
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
import be.klusjes.entities.User;
import be.klusjes.entities.Visitor;
import be.klusjes.entities.Worker;
import be.klusjes.service.AdministratorService;
import be.klusjes.service.CustomerService;
import be.klusjes.service.JobTypeService;
import be.klusjes.service.LocationService;
import be.klusjes.service.MailSendingServiceImpl;
import be.klusjes.service.ReviewService;
import be.klusjes.service.UserService;
import be.klusjes.service.VisitorService;
import be.klusjes.service.WorkerService;

@Controller
@RequestMapping("/administrator")
public class AdminController {

	@Autowired
	AdministratorService administratorService;
	@Autowired
	JobTypeService jobTypeService;
	@Autowired
	LocationService locationService;
	@Autowired
	WorkerService workerService;
	@Autowired
	UserService userService;
	@Autowired
	CustomerService customerService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	MailSendingServiceImpl mailSendingService;
	@Autowired
	VisitorService visitorService;

	private ShaPasswordEncoder shaPasswordEncoder = new ShaPasswordEncoder();
	private List<Location> locations;
	private List<JobType> jobTypes;
	private List<String> allProvinces;

	@RequestMapping(method = RequestMethod.GET)
	public String showIndex() {
		return "administrator/administratorindex";
	}

	// create new administrator
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String showCreateCustomer(Model model,
			@ModelAttribute AdministratorForm administratorForm) {
		return "administrator/create";
	}

	@RequestMapping(value = "/docreate", method = RequestMethod.POST)
	public String doCreate(Model model,
			@Valid AdministratorForm administratorForm, BindingResult result) {
		if (result.hasErrors()) {
			return "administrator/create";
		}
		administratorForm.setPassword(shaPasswordEncoder.encodePassword(
				administratorForm.getPassword(),
				administratorForm.getUsername()));
		administratorService.create(administratorForm);
		model.addAttribute("administrator",
				administratorService.read(administratorForm.getUsername()));
		return "administrator/created";
	}

	// administrator workers
	// load search windows
	@RequestMapping(value = "/searchworkerslocationtype", method = RequestMethod.GET)
	public String showStartSearchWorkers(Model model,
			@ModelAttribute("workersForm") WorkersForm workersForm) {
		jobTypes = jobTypeService.findAll();
		locations = locationService.findAll();
		allProvinces = locationService.findProvinces();

		model.addAttribute("jobTypes", jobTypes);
		model.addAttribute("locations", locations);
		model.addAttribute("allProvinces", allProvinces);
		return "administrator/searchworkerslocationtype";
	}

	// search workers by location and type of job
	@RequestMapping(value = "/searchworkerslocationtype", method = RequestMethod.POST)
	public String doSearchWorkers(Model model,
			@Valid @ModelAttribute("workersForm") WorkersForm workersForm,
			BindingResult result) {
		model.addAttribute("jobTypes", jobTypes);
		model.addAttribute("locations", locations);
		model.addAttribute("allProvinces", allProvinces);
		if (result.hasErrors()) {
			return "administrator/searchworkerslocationtype";
		}
		List<Worker> relevantWorkers = workerService
				.findWorkersByJobTypeAndLocation(workersForm.getJobTypesLong(),
						workersForm.getLocationLong());
		model.addAttribute("workers", relevantWorkers);
		return "administrator/searchworkerslocationtype";
	}

	// search workers by keywords
	@RequestMapping(value = "/searchworkerslocationtype", method = RequestMethod.GET, params = "keyword")
	public String doSearchWorkersByName(Model model,
			@RequestParam String keyword,
			@ModelAttribute("workersForm") WorkersForm workersForm) {
		List<Worker> workers = workerService.findCustomersByText(keyword);
		model.addAttribute("jobTypes", jobTypes);
		model.addAttribute("locations", locations);
		model.addAttribute("allProvinces", allProvinces);
		model.addAttribute("workers", workers);
		return "administrator/searchworkerslocationtype";

	}

	// enable or disable workers
	@RequestMapping(value = "/enabledisableworkers", method = RequestMethod.POST, params = "allWorkerIds")
	public String showWorkers(Model model,
			@RequestParam(required = false) Long[] workerIds,
			@RequestParam Long[] allWorkerIds) {
		if (workerIds == null) {
			for (Long idAll : allWorkerIds) {
				User user = workerService.readById(idAll).getUser();
				user.setEnabled(false);
				userService.update(user);
			}
			return "redirect:/administrator/";
		}
		List<Long> workerIdList = Arrays.asList(workerIds);
		List<Long> allWorkerIdList = Arrays.asList(allWorkerIds);

		for (Long idAll : allWorkerIdList) {
			if (!workerIdList.contains(idAll)) {
				User user = workerService.readById(idAll).getUser();
				user.setEnabled(false);
				userService.update(user);
			} else {
				Worker worker = workerService.readById(idAll);
				if (worker.getUser().isEnabled() == false) {
					User user = worker.getUser();
					user.setEnabled(true);
					userService.update(user);
				}
			}
		}
		return "administrator/administratorindex";
	}

	// administrator customer
	// load search windows
	@RequestMapping(value = "/searchcustomers", method = RequestMethod.GET)
	public String showStartSearchCustomers(Model model) {
		return "administrator/searchcustomers";
	}

	// do customersearch
	@RequestMapping(value = "/searchcustomers", method = RequestMethod.GET, params = "keyword")
	public String doSearchCustomers(Model model, @RequestParam String keyword,
			@RequestParam(required = false, defaultValue = "0") int fromRow) {
		// List<Customer> customers =
		// customerService.findCustomersByText(keyword);
		int numberOfRows = 3;
		List<Customer> customers = customerService.findCustomersByTextPaged(
				keyword, fromRow, numberOfRows);
		model.addAttribute("customers", customers);
		model.addAttribute("fromRow",fromRow);
		model.addAttribute("numberOfRow", numberOfRows);
		model.addAttribute("keyword",keyword);
		return "administrator/searchcustomers";
	}

	// enable or disable customers
	@RequestMapping(value = "/enablecustomers", method = RequestMethod.POST, params = "allCustomerIds")
	public String alterCustomers(Model model,
			@RequestParam(required = false) Long[] customerIds,
			@RequestParam Long[] allCustomerIds) {
		if (customerIds == null) {
			for (Long idAll : allCustomerIds) {
				User user = customerService.readById(idAll).getUser();
				user.setEnabled(false);
				userService.update(user);
			}
			return "redirect:searchcustomers";
		}
		List<Long> customerIdList = Arrays.asList(customerIds);
		List<Long> allCustomerIdList = Arrays.asList(allCustomerIds);

		for (Long idAll : allCustomerIdList) {
			if (!customerIdList.contains(idAll)) {
				User user = customerService.readById(idAll).getUser();
				user.setEnabled(false);
				userService.update(user);
			} else {
				Customer customer = customerService.readById(idAll);
				if (customer.getUser().isEnabled() == false) {
					User user = customer.getUser();
					user.setEnabled(true);
					userService.update(user);
				}
			}
		}
		return "redirect:searchcustomers";
	}

	// adminside review handling

	@RequestMapping(value = "/reviews", method = RequestMethod.GET)
	public String showReviews(Model model) {
		List<Reviews> reviews = reviewService.findUnreadReportedReviews();
		model.addAttribute("reviews", reviews);
		return "administrator/reviews";
	}

	@RequestMapping(value = "/reviews", method = RequestMethod.POST)
	public String reportReviews(Model model,
			@RequestParam(required = false) Long[] deletes,
			@RequestParam(required = false) Long[] readByAdmins) {

		if (deletes == null && readByAdmins == null) {
			return "redirect:reviews";
		}
		if (deletes != null) {
			List<Long> deletesList = Arrays.asList(deletes);
			for (Long idReview : deletesList) {
				Reviews review = reviewService.read(idReview);
				Customer customer = review.getCustomer();
				long addOne = customer.getNumberOfDeleteReviews() + 1;
				customer.setNumberOfDeleteReviews(addOne);
				customerService.update(customer);
				review.setWorker(null);
				review.setCustomer(null);
				reviewService.update(review);
				reviewService.deleteReview(idReview);
			}
		}
		if (readByAdmins != null) {
			List<Long> readByAdminList = Arrays.asList(readByAdmins);
			for (Long idReview : readByAdminList) {
				Reviews review = reviewService.read(idReview);
				review.setReadByAdmin(true);
				reviewService.update(review);
			}
		}

		return "redirect:reviews";
	}

	// enable locations and add jobtypes

	@RequestMapping(value = "/addlocationsandjobtypes", method = RequestMethod.GET)
	public String showLocationsAndJobTypes(
			Model model,
			@ModelAttribute("locationJobTypeForm") LocationJobTypeForm locationJobTypeForm) {
		locations = locationService.findAll();
		jobTypes = jobTypeService.findAll();
		allProvinces = locationService.findProvinces();
		model.addAttribute("locations", locations);
		model.addAttribute("jobTypes", jobTypes);
		model.addAttribute("allProvinces", allProvinces);
		return "administrator/addlocationsandjobtypes";
	}

	@RequestMapping(value = "/addlocationsandjobtypes", method = RequestMethod.POST, params = "jobType")
	public String addNewJobType(
			Model model,
			@Valid @ModelAttribute("locationJobTypeForm") LocationJobTypeForm locationJobTypeForm,
			BindingResult result) {
		if (result.hasErrors()) {
			model.addAttribute("locations", locations);
			model.addAttribute("jobTypes", jobTypes);
			model.addAttribute("allProvinces", allProvinces);
			return "administrator/addlocationsandjobtypes";
		}
		JobType newJobType = new JobType();
		String job = locationJobTypeForm.getJobType();
		String jobBuild = job;
		if (job.charAt(job.length() - 1) == ',') {
			jobBuild = job.substring(0, job.length() - 1);
		}
		newJobType.setJobDescription(jobBuild);

		jobTypeService.create(newJobType);
		jobTypes = jobTypeService.findAll();
		model.addAttribute("jobTypes", jobTypes);
		model.addAttribute("locations", locations);
		return "redirect:addlocationsandjobtypes";
	}

	@RequestMapping(value = "/updatejobtypes", method = RequestMethod.GET)
	public String updateJobType(
			Model model,
			@RequestParam long id,
			@ModelAttribute("locationJobTypeForm") LocationJobTypeForm locationJobTypeForm) {
		model.addAttribute("jobType", jobTypeService.read(id));
		return "administrator/updatejobtypes";
	}

	@RequestMapping(value = "/updatejobtypes", method = RequestMethod.POST)
	public String doUpdateJobType(
			Model model,
			@RequestParam long id,
			@Valid @ModelAttribute("locationJobTypeForm") LocationJobTypeForm locationJobTypeForm,
			BindingResult result) {
		if (result.hasErrors()) {
			model.addAttribute("jobType", jobTypeService.read(id));
			return "administrator/updatejobtypes";
		}
		JobType jobType = jobTypeService.read(id);
		jobType.setJobDescription(locationJobTypeForm.getJobType());
		jobTypeService.update(jobType);
		return "redirect:addlocationsandjobtypes";
	}

	// TODO
	/*
	 * @RequestMapping(value = "/addlocationsandjobtypes", method =
	 * RequestMethod.POST, params = "location") public String addLocation( Model
	 * model, @ModelAttribute("adminForm") AdministratorLocationJobTypeForm
	 * adminForm, BindingResult result){ if(result.hasErrors()){
	 * model.addAttribute("locations", locations);
	 * model.addAttribute("jobTypes", jobTypes);
	 * model.addAttribute("allProvinces",allProvinces); return
	 * "administrator/addlocationsandjobtypes"; }
	 * 
	 * for (Location location : locations) {
	 * 
	 * 
	 * if (!adminForm.getLocationIds().contains(location.getId())) {
	 * location.setEnabled(false);
	 * 
	 * } else { Customer customer = customerService.readById(idAll); if
	 * (customer.getUser().isEnabled() == false) { User user =
	 * customer.getUser(); user.setEnabled(true); userService.update(user); } }
	 * }
	 * 
	 * 
	 * Location newLocation = new Location();
	 * newLocation.setMunicipality("Belgium");
	 * newLocation.setProvince(province); locationService.create(newLocation);
	 * locations = locationService.findAll(); model.addAttribute("jobTypes",
	 * jobTypes); model.addAttribute("locations", locations); return
	 * "redirect:addlocationsandjobtypes"; }
	 */
	@RequestMapping(value = "/email", method = RequestMethod.GET)
	public String emailToUser(Model model, @RequestParam String email) {
		model.addAttribute("email", email);
		return "administrator/email";
	}

	@RequestMapping(value = "/email", method = RequestMethod.POST)
	public String doEmailToUser(Model model, @RequestParam String email,
			@RequestParam String message) throws MessagingException {
		mailSendingService.sendMail("workerforum", email,
				"Important message form WorkerPoint", message);
		return "redirect:/administrator";

	}

	@RequestMapping(value = "/visitors", method = RequestMethod.GET)
	public String showVisitors(Model model,
			@RequestParam(required = false, defaultValue = "0") int fromRow) {
		int numberOfRow = 30;
		System.out.println(fromRow);
		// List<Visitor> visitors = visitorService.findAll();
		List<Visitor> visitors = visitorService.findAllPaged(fromRow,
				numberOfRow + 1);
		model.addAttribute("fromRow", fromRow);
		model.addAttribute("visitors", visitors);
		model.addAttribute("numberOfRow", numberOfRow);
		return "administrator/visitors";
	}
}
