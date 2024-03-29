package be.klusjes.web;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

public class MessageThreadForm {

	private long workerId;
	private long customerId;
	private String username;
	@NotBlank
	@Length(min = 5, max = 45)
	private String subject;
	@NotBlank
	@Length(min = 5, max = 500)
	private String text;
	private boolean worker = false;

	public MessageThreadForm() {
	}

	public long getWorkerId() {
		return workerId;
	}

	public void setWorkerId(long workerId) {
		this.workerId = workerId;
	}

	public long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(long customerId) {
		this.customerId = customerId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject.trim();
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text.trim();
	}

	public boolean isWorker() {
		return worker;
	}

	public void setWorker(boolean worker) {
		this.worker = worker;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "MessageThreadForm [workerId=" + workerId + ", customerId="
				+ customerId + ", subject=" + subject + ", text=" + text
				+ ", worker=" + worker + "]";
	}

}
