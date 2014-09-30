package be.klusjes.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import be.klusjes.dao.interfaces.AdministratorMessageDao;
import be.klusjes.entities.AdministratorMessage;

@Repository
public class AdministratorMessageDaoImpl implements AdministratorMessageDao{

	private EntityManager entityManager;

	@PersistenceContext
	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	@Override
	public void create(AdministratorMessage administratorMessage) {
		try {
			entityManager.persist(administratorMessage);
		} catch (RuntimeException ex) {
			entityManager.clear();
			throw ex;
		}
	}

	@Override
	public AdministratorMessage read(Long id) {
		return entityManager.find(AdministratorMessage.class, id);
	}

	@Override
	public void update(AdministratorMessage administratorMessage) {
			try {
				entityManager.merge(administratorMessage);
				entityManager.flush();
			} catch (RuntimeException ex) {
				entityManager.clear();
				throw ex;
			}
		}

	@Override
	public void deleteAdministratorMessage(Long id) {
		AdministratorMessage administratorMessage = entityManager.find(AdministratorMessage.class, id);
		if (administratorMessage != null) {
			entityManager.remove(administratorMessage);
			entityManager.flush();
		}
	}

	@Override
	public List<AdministratorMessage> findUnreadMessages() {
		TypedQuery<AdministratorMessage> query = entityManager.createNamedQuery(
				"findUnreadMessages", AdministratorMessage.class);
		return query.getResultList();
	}




}
