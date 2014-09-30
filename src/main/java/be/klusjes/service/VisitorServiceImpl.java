package be.klusjes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import be.klusjes.dao.interfaces.VisitorDao;
import be.klusjes.entities.Visitor;

@Service
@Transactional
public class VisitorServiceImpl implements VisitorService {

	private VisitorDao visitorDao;

	@Autowired
	public VisitorServiceImpl(VisitorDao visitorDao) {
		this.visitorDao = visitorDao;
	}

	@Override
	public void create(Visitor visitor) {
		visitorDao.create(visitor);
	}

	@PreAuthorize("hasRole('administrator')")
	@Override
	public Visitor read(Long id) {
		return visitorDao.read(id);
	}

	@Override
	@PreAuthorize("hasRole('administrator')")
	public List<Visitor> findAll() {
		return visitorDao.findAll();
	}

	@Override
	public List<Visitor> findAllPaged(int fromRow, int numberOfRow) {
		return visitorDao.findAllPaged(fromRow, numberOfRow);
	}
}