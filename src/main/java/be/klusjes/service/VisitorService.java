package be.klusjes.service;

import java.util.List;

import be.klusjes.entities.Visitor;

public interface VisitorService {
	void create(Visitor visitor);

	Visitor read(Long id);

	List<Visitor> findAll();

	List<Visitor> findAllPaged(int fromRow, int numberOfRow);
}
