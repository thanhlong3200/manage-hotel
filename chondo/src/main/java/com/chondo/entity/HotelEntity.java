package com.chondo.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "hotels")
public class HotelEntity extends BaseEntity {
	

	@Column
	private String code;
	
	@Column
	private String name;
	
	@Column
	private String address;
	
	@Column
	private String location;
	
	@Column
	private String email;
	
	@Column
	private String phone;
	
	@Column
	private Integer status;
	
	@OneToMany(mappedBy = "hotel")
	private List<RoomEntity> rooms = new ArrayList<RoomEntity>();
	
	@OneToMany(mappedBy = "hotel")
	private List<BookingEntity> bookings =  new ArrayList<BookingEntity>();

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}


	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public List<BookingEntity> getBookings() {
		return bookings;
	}

	public void setBookings(List<BookingEntity> bookings) {
		this.bookings = bookings;
	}
	
	
}
