package be.klusjes.web;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GenericControllerExceptionHandler {

	 @ExceptionHandler(DataIntegrityViolationException.class)
	    public String exception(Exception e) {
	 
	        return "error";
	    }
	 
	 @ExceptionHandler(javax.mail.MessagingException.class)
	 public String mailexception(javax.mail.MessagingException ex){
		 return "emailerror";
	 }
	 
	 @ExceptionHandler(org.springframework.mail.MailSendException.class)
	 public String springmailexception(org.springframework.mail.MailSendException ex){
		 return "emailerror";
	 }
	 
	 @ExceptionHandler(java.lang.NullPointerException.class)
	 public String springmailexception(java.lang.NullPointerException ex){
		 return "nullpointererror";
	 }
	 
	 @ExceptionHandler(java.lang.Exception.class)
	 public String generalException(java.lang.Exception ex){
		 return "generalexceptionerror";
	 }
}
