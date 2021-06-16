package com.chondo.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "customers")
public class CustomerEntity extends BaseEntity{
	
	@Column(name = "first_name", nullable = false)
	private String firstName;
	
	@Column(name = "last_name", nullable = false)
	private String lastName;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "check_in")
	private Integer checkIn;

	@Column(name = "phone")
	private String phone;
	
	@Column(name = "gender")
	private String gender;
	
	@Column(name = "cmnd")
	private String cmnd;
	
	@ManyToMany(mappedBy = "customers")
	private List<BookedRoomEntity> bookeds = new ArrayList<BookedRoomEntity>();
	
	@OneToMany(mappedBy = "customer")
	private List<BookingEntity> bookings = new ArrayList<>();

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

	public List<BookedRoomEntity> getBookeds() {
		return bookeds;
	}

	public void setBookeds(List<BookedRoomEntity> bookeds) {
		this.bookeds = bookeds;
	}

	public Integer getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(Integer checkIn) {
		this.checkIn = checkIn;
	}

	public List<BookingEntity> getBookings() {
		return bookings;
	}

	public void setBookings(List<BookingEntity> bookings) {
		this.bookings = bookings;
	}
	
	
	
}
