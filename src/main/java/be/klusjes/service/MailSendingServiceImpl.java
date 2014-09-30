package be.klusjes.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import be.klusjes.entities.User;

@Service
public class MailSendingServiceImpl {

	@Autowired
	private JavaMailSender mailSender;

	public MailSendingServiceImpl() {
	}

	public void sendMail(String from, String to, String subject, String msg)
			throws MessagingException {
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false,
				"utf-8");
		String htmlMsg = msg;
		mimeMessage.setContent(htmlMsg, "text/html");
		helper.setTo(to);
		helper.setSubject(subject);
		helper.setFrom(from);
		mailSender.send(mimeMessage);
	}

	public void sendConfirmationEmail(User user) throws MessagingException {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
				.currentRequestAttributes()).getRequest();
		String url = "<a href='http://bramdeveirman.brusselintec.cloudbees.net"
				+ request.getContextPath() + "/confirmation?confirm=";
		String url2 = "&username=" + user.getUsername();
		String end = "'>This link</a>";
		String msg = "Welcome to WorkersPoint!<br/>To confirm your registration please visit:<br/>"
				+ url + user.getRandomUUID() + url2 + end;
		sendMail("javaintec@gmail.com", user.getEmail(),
				"Welcome to WorkersPoint", msg);

	}

	public void sendResetMail(User user) throws MessagingException {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
				.currentRequestAttributes()).getRequest();

		String url = "<a href='http://bramdeveirman.brusselintec.cloudbees.net"
				+ request.getContextPath() + "/resetpassword?confirm=";
		String url2 = "&username=" + user.getUsername();
		String end = "'>reset password</a>";
		String msg = "To reset your password on WorkersPoint, please click the link:<br/>"
				+ url + user.getRandomUUID() + url2;
		sendMail("javaintec@gmail.com", user.getEmail(),
				"Reset password on WorkersPoint", msg + end);

	}

}
