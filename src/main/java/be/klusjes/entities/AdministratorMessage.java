package be.klusjes.entities;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "administratorMessage")
public class AdministratorMessage {
	@Id
	@GeneratedValue
	public long id;
	private String text;
	private String subject;

	@Temporal(TemporalType.TIMESTAMP)
	private Date date;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "userId")
	private User user;
	private boolean readBool;

	public AdministratorMessage() {
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		// prevent endless loop
				if (user.equals(this.user))
					return;
				// set new worker
				this.user = user;
				// set myself into new worker
				if (user != null)
					user.addAdministratorMessage(this);
			
	}

	public boolean isReadBool() {
		return readBool;
	}

	public void setReadBool(boolean readBool) {
		this.readBool = readBool;
	}

	public long getId() {
		return id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

}
