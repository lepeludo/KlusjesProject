package be.klusjes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import be.klusjes.dao.interfaces.CustomerDao;
import be.klusjes.dao.interfaces.ReviewDao;
import be.klusjes.dao.interfaces.WorkersDao;
import be.klusjes.entities.Reviews;

@Service
@Transactional
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private CustomerDao customerDao;
	@Autowired
	private WorkersDao workerDao;
	

	@Override
	public void create(Reviews review) {
		reviewDao.create(review);
		customerDao.update(review.getCustomer());
		workerDao.update(review.getWorker());
	}

	@Override
	public  List<Reviews> readByWorkerId(Long workerId) {
		return reviewDao.readByWorkerId(workerId);
	}

	@Override
	public  List<Reviews> readByCustomerId(Long CustomerId) {
		return reviewDao.readByCustomerId(CustomerId);
	}

	@Override
	public Reviews read(Long id) {
		return reviewDao.read(id);
	}

	@Override
	public void update(Reviews review) {
		reviewDao.update(review);
		
	}

	@Override
	public List<Reviews> findUnreadReportedReviews() {
		return reviewDao.findUnreadReportedReviews();
	}

	@Override
	public void deleteReview(Long id) {
		reviewDao.deleteReview(id);
		
	}



}
