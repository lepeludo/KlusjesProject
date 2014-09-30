package be.klusjes.dao.interfaces;

import java.util.List;

import be.klusjes.entities.Visitor;

public interface VisitorDao {
	void create(Visitor visitor);

	Visitor read(Long id);

	List<Visitor> findAll();

	List<Visitor> findAllPaged(int fromRow, int numberOfRow);

}
