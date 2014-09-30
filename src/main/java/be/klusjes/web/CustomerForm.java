package be.klusjes.web;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import be.klusjes.constraints.CustomerEmailExistsChecker;
import be.klusjes.constraints.UsernameExistsChecker;

public class CustomerForm implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Size(min=1, max=25)
	@NotBlank
	@Pattern(regexp="[A-Z][a-z]*", message="First letter should be capitalized, others lower cased")
	private String firstName;
	@Size(min=1, max=25)
	@NotBlank
	@Pattern(regexp="[a-zA-Z][A-Za-z ]*", message="only letters allowed")
	private String lastName;
	@CustomerEmailExistsChecker
	@Email 
	@NotBlank
	private String email;
	@NotBlank
	@Size(min=5, max=25)
	@UsernameExistsChecker
	@Pattern(regexp="[a-z]*", message="can only contain lower case letters")
	private String username;
	@NotBlank
	@Size(min=5, max=25)
	@Pattern(regexp="^\\S+$")
	private String password;
	private final String authority = "customer";
	private final boolean enabled = true;
	private Date dateAccount;
	
	
	public CustomerForm() {
		Calendar cal = Calendar.getInstance();
		dateAccount = cal.getTime();
	}
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName.trim();
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName.trim();
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email.trim();
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username.trim();
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password.trim();
	}
	public String getAuthority() {
		return authority;
	}
	public boolean isEnabled() {
		return enabled;
	}

	public Date getDateAccount() {
		return dateAccount;
	}

	public void setDateAccount(Date dateAccount) {
		this.dateAccount = dateAccount;
	}
	
}
