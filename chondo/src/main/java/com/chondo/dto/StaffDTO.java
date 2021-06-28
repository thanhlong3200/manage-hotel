package com.chondo.dto;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.chondo.entity.StaffStatusEntity;

public class StaffDTO extends AbstractDTO<StaffDTO>{

	private String fullname;
	
	private String phone;
	
	private String gender;

	private Integer active;
	
	private Date birthday;
	
	private StaffStatusDTO status;

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public StaffStatusDTO getStatus() {
		return status;
	}

	public void setStatus(StaffStatusDTO status) {
		this.status = status;
	}
	
	
}
