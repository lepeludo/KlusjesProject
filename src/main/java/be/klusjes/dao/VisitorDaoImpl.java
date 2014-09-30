package be.klusjes.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import be.klusjes.dao.interfaces.VisitorDao;
import be.klusjes.entities.Visitor;

@Repository
public class VisitorDaoImpl implements VisitorDao {

	private EntityManager entityManager;

	@PersistenceContext
	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	@Override
	public Visitor read(Long id) {
		return entityManager.find(Visitor.class, id);
	}

	@Override
	public List<Visitor> findAll() {
		TypedQuery<Visitor> query = entityManager.createNamedQuery(
				"findAllVisitors", Visitor.class);
		return query.getResultList();
	}
	
	@Override
	public List<Visitor> findAllPaged(int fromRow, int numberOfRows) {
		TypedQuery<Visitor> query = entityManager.createNamedQuery(
				"findAllVisitors", Visitor.class);
		query.setFirstResult(fromRow);
		query.setMaxResults(numberOfRows);
		return query.getResultList();
	}

	@Override
	public void create(Visitor visitor) {
		try {
			entityManager.persist(visitor);
		} catch (RuntimeException ex) {
			entityManager.clear();
			throw ex;
		}
	}
}
