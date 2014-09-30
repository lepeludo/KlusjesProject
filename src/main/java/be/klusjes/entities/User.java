package be.klusjes.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "users")
public class User implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String username;
	@OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
	private Authority authority;
	@OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
	private Customer customer;
	@OneToOne(targetEntity = Administrator.class, mappedBy = "user", cascade = CascadeType.ALL)
	private Administrator administrator;
	@OneToOne(targetEntity = Worker.class, mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
	private Worker worker;
	private boolean enabled;
	private String password;
	private String randomUUID;
	@Temporal(TemporalType.TIMESTAMP)
	private Date randomUUIDDate;
	private String email;
	@OneToMany(mappedBy="user")
	private List<AdministratorMessage> administratorMessages;

	public User() {
	}

	public Worker getWorker() {
		return worker;
	}

	public void setWorker(Worker worker) {
		this.worker = worker;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Authority getAuthority() {
		return authority;
	}

	public void setAuthority(Authority authority) {
		this.authority = authority;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Administrator getAdministrator() {
		return administrator;
	}

	public void setAdministrator(Administrator administrator) {
		this.administrator = administrator;
	}

	public String getRandomUUID() {
		return randomUUID;
	}

	public void setRandomUUID(String randomUUID) {
		this.randomUUID = randomUUID;
	}
	
	public Date getRandomUUIDDate() {
		return randomUUIDDate;
	}

	public void setRandomUUIDDate(Date randomUUIDDate) {
		this.randomUUIDDate = randomUUIDDate;
	}

	public List<AdministratorMessage> getAdministratorMessages() {
		return administratorMessages;
	}

	public void setAdministratorMessages(
			List<AdministratorMessage> administratorMessages) {
		this.administratorMessages = administratorMessages;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (enabled ? 1231 : 1237);
		result = prime * result
				+ ((password == null) ? 0 : password.hashCode());
		result = prime * result
				+ ((username == null) ? 0 : username.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (enabled != other.enabled)
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		return true;
	}

	public void addAdministratorMessage(
			AdministratorMessage administratorMessage) {
			if (administratorMessages.contains(administratorMessage)){
				return;
			}
			administratorMessages.add(administratorMessage);
			administratorMessage.setUser(this);
		
	}

}
