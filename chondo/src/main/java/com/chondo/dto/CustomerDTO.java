package com.chondo.dto;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.ManyToMany;

import com.chondo.entity.BookedRoomEntity;

public class CustomerDTO extends AbstractDTO<CustomerDTO>{
	private String firstName;
	
	private String lastName;
	
	private String email;

	private String phone;
	
	private String gender;
	
	private String cmnd;
	
	private Integer checkIn;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getCmnd() {
		return cmnd;
	}

	public void setCmnd(String cmnd) {
		this.cmnd = cmnd;
	}

	public Integer getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(Integer checkIn) {
		this.checkIn = checkIn;
	}
	
	
}
