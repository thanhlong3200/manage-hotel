package com.chondo.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
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
	private String symbol;
	
	@Column
	private String image;
	
	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "user_type_services", joinColumns = @JoinColumn(name = "service_id"), 
								  inverseJoinColumns = @JoinColumn(name = "user_type_id"))
	private List<UserTypeEntity> userTypes = new ArrayList<UserTypeEntity>();
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "room_type_services", joinColumns = @JoinColumn(name = "service_id"), 
								  inverseJoinColumns = @JoinColumn(name = "room_type_id"))
	private List<RoomTypeEntity> roomTypes = new ArrayList<RoomTypeEntity>();

	@OneToMany(mappedBy = "service")
	private List<BookedServiceEntity> bookedServices = new ArrayList<BookedServiceEntity>();

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

	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}

	public String getSymbol() {
		return symbol;
	}

	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}

	public List<UserTypeEntity> getUserTypes() {
		return userTypes;
	}

	public void setUserTypes(List<UserTypeEntity> userTypes) {
		this.userTypes = userTypes;
	}

	public List<RoomTypeEntity> getRoomTypes() {
		return roomTypes;
	}

	public void setRoomTypes(List<RoomTypeEntity> roomTypes) {
		this.roomTypes = roomTypes;
	}

	public List<BookedServiceEntity> getBookedServices() {
		return bookedServices;
	}

	public void setBookedServices(List<BookedServiceEntity> bookedServices) {
		this.bookedServices = bookedServices;
	}
	
	
	
}
