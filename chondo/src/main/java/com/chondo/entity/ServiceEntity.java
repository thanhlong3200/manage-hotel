package com.chondo.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "services")
public class ServiceEntity extends BaseEntity{
	
	@Column
	private String code;
	
	@Column
	private String name;
	
	@Column
	private Long price;
	
	@Column
	private Integer used;
	
	@Column
	private Integer free;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "user_type_services", joinColumns = @JoinColumn(name = "service_id"), 
								  inverseJoinColumns = @JoinColumn(name = "user_type_id"))
	private List<UserTypeEntity> userTypes = new ArrayList<>();
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "room_type_services", joinColumns = @JoinColumn(name = "service_id"), 
								  inverseJoinColumns = @JoinColumn(name = "room_type_id"))
	private List<RoomTypeEntity> roomTypes = new ArrayList<>();
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "bookings_services", joinColumns = @JoinColumn(name = "service_id"), 
								  inverseJoinColumns = @JoinColumn(name = "booking_id"))
	private List<BookingEntity> bookings = new ArrayList<>();
	
}
