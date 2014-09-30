package be.klusjes.dao.interfaces;

import java.util.List;

import be.klusjes.entities.AdministratorMessage;

public interface AdministratorMessageDao {

	void create(AdministratorMessage administratorMessage);

	AdministratorMessage read(Long id);

	void update(AdministratorMessage administratorMessage);

	void deleteAdministratorMessage(Long id);

	public List<AdministratorMessage> findUnreadMessages();
}
