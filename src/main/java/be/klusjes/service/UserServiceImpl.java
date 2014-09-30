package be.klusjes.service;

import java.util.Calendar;
import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import be.klusjes.dao.interfaces.UserDao;
import be.klusjes.entities.User;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	@Autowired
	MailSendingServiceImpl mailSendingService;
	private ShaPasswordEncoder shaPasswordEncoder = new ShaPasswordEncoder();

	@Autowired
	public UserServiceImpl(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public void delete(long id) {
		userDao.delete(id);

	}

	@Override
	public void update(User user) {
		userDao.update(user);
	}

	@Override
	public void create(User user) {
		userDao.create(user);

	}

	@Override
	public User read(String username) {
		User user = userDao.read(username);
		return user;
	}

	@Override
	public List<User> findAll() {
		return userDao.findAll();
	}

	@Override
	public List<String> findAllUsernames() {
		return userDao.findAllUsernames();
	}

	@Override
	public User readByEmail(String email) {
		return userDao.readByEmail(email);
	}
	@Override
	public void changePassword(User user, String password){
		String encodedPassword = shaPasswordEncoder.encodePassword(password, user.getUsername());
		user.setRandomUUID(null);
		user.setRandomUUIDDate(null);
		user.setPassword(encodedPassword);
		userDao.update(user);
	}
	
	@Override
	public void resetPassword(User user) throws MessagingException{
		user.setRandomUUID((java.util.UUID.randomUUID().toString()));
		user.setRandomUUIDDate(Calendar.getInstance().getTime());
		mailSendingService.sendResetMail(user);
		
	}
	
	@Override
	public void deactivateAccound(User user){
		user.setEnabled(false);
		userDao.update(user);
	}

}
