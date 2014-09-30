package be.klusjes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import be.klusjes.dao.interfaces.AdministratorMessageDao;
import be.klusjes.entities.AdministratorMessage;

@Service
@Transactional
@PreAuthorize("isAuthenticated()")
public class AdmininistratorMessageServiceImpl implements
		AdministratorMessageService {

	private AdministratorMessageDao administratorMessageDao;

	@Autowired
	public AdmininistratorMessageServiceImpl(
			AdministratorMessageDao administratorMessageDao) {
		this.administratorMessageDao = administratorMessageDao;
	}

	@Override
	public void create(AdministratorMessage administratorMessage) {
		administratorMessageDao.create(administratorMessage);
	}

	@PreAuthorize("hasRole('administrator')")
	@Override
	public AdministratorMessage read(Long id) {
		return administratorMessageDao.read(id);
	}

	@Override
	public void update(AdministratorMessage administratorMessage) {
		administratorMessageDao.update(administratorMessage);
	}

	@Override
	public void deleteAdministratorMessage(Long id) {
		administratorMessageDao.deleteAdministratorMessage(id);
	}

	@Override
	public List<AdministratorMessage> findUnreadMessages() {
		return administratorMessageDao.findUnreadMessages();
	}

}