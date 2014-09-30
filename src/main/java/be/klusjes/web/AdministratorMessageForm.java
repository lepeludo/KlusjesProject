package be.klusjes.web;

import java.util.Date;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

public class AdministratorMessageForm {
	@NotBlank
	@Length(min=5, max=45)
	private String subject;
	@NotBlank
	@Length(min=5, max=500)
	private String text;
	private Date date;
	
	public AdministratorMessageForm() {
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text.trim();
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

}
