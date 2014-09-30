package be.klusjes.web;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

public class LocationJobTypeForm {
	@NotBlank
	@Length(min = 5, max = 30)
	private String jobType;

	public LocationJobTypeForm() {
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType.trim();
	}

	

}
