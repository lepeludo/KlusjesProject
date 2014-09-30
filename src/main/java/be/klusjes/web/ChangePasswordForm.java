package be.klusjes.web;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

public class ChangePasswordForm {
	@Length(min=5, max=45)
	@NotBlank
	@NotEmpty
	private String password;

	public ChangePasswordForm() {
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
	
	
}
