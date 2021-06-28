package com.chondo.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "rooms")
public class RoomEntity extends BaseEntity {
	
	@Column
	private Integer number;
	
	@Column
	private Integer floor;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "room_type_id")
	private RoomTypeEntity roomType;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "status_id")
	private RoomStatusEntity status;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "hotel_id")
	private HotelEntity hotel;
	
	
	
	@OneToMany(mappedBy = "room")
	private	List<BookedRoomEntity> bookeds = new ArrayList<BookedRoomEntity>();
	
	@OneToMany(mappedBy = "task")
	private List<StaffTaskEntity> staffTasks = new ArrayList<StaffTaskEntity>();

	public List<StaffTaskEntity> getStaffTasks() {
		return staffTasks;
	}

	public void setStaffTasks(List<StaffTaskEntity> staffTasks) {
		this.staffTasks = staffTasks;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Integer getFloor() {
		return floor;
	}

	public void setFloor(Integer floor) {
		this.floor = floor;
	}

	public RoomTypeEntity getRoomType() {
		return roomType;
	}

	public void setRoomType(RoomTypeEntity roomType) {
		this.roomType = roomType;
	}

	public List<BookedRoomEntity> getBookeds() {
		return bookeds;
	}

	public void setBookeds(List<BookedRoomEntity> bookeds) {
		this.bookeds = bookeds;
	}

	public RoomStatusEntity getStatus() {
		return status;
	}

	public void setStatus(RoomStatusEntity status) {
		this.status = status;
	}

	public HotelEntity getHotel() {
		return hotel;
	}

	public void setHotel(HotelEntity hotel) {
		this.hotel = hotel;
	}


	
	
	
}
