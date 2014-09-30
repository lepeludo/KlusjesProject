package be.klusjes.service;

import java.util.List;

import javax.mail.MessagingException;

import org.springframework.stereotype.Service;

import be.klusjes.entities.User;

@Service
public interface UserService {

	User read(String username);

	List<User> findAll();

	void create(User user);

	void delete(long id);

	void update(User user);
	
	List<String>findAllUsernames();
	
	User readByEmail(String email);

	void resetPassword(User user) throws MessagingException;

	void changePassword(User user, String password);

	void deactivateAccound(User user);


}
