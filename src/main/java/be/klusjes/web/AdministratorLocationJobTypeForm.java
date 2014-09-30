package be.klusjes.web;

import java.util.List;

public class AdministratorLocationJobTypeForm {
	private List<Long> locationIds;
	private List<Long> jobTypeIds;
	private String jobType;

	public AdministratorLocationJobTypeForm() {
	}

	public List<Long> getLocationIds() {
		return locationIds;
	}

	public void setLocationIds(List<Long> locationIds) {
		this.locationIds = locationIds;
	}

	public List<Long> getJobTypeIds() {
		return jobTypeIds;
	}

	public void setJobTypeIds(List<Long> jobTypeIds) {
		this.jobTypeIds = jobTypeIds;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

}
