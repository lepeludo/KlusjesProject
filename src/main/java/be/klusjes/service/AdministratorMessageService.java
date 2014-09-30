package be.klusjes.service;

import java.util.List;

import be.klusjes.entities.AdministratorMessage;

public interface AdministratorMessageService {
	void create(AdministratorMessage administratorMessage);

	AdministratorMessage read(Long id);

	void update(AdministratorMessage administratorMessage);

	void deleteAdministratorMessage(Long id);

	public List<AdministratorMessage> findUnreadMessages();
}
