package com.chondo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "upgrades")
public class UpgradeEntity extends BaseEntity{
	
	@Column
	private Integer free;
	
	@ManyToOne
    @JoinColumn(name = "room_type_id")
    private RoomTypeEntity initRoomType;
	
	@OneToOne
    @JoinColumn(name = "booking_id")
    private BookingEntity booking;

	public Integer getFree() {
		return free;
	}

	public void setFree(Integer free) {
		this.free = free;
	}

	
	public BookingEntity getBooking() {
		return booking;
	}

	public void setBooking(BookingEntity booking) {
		this.booking = booking;
	}

	public RoomTypeEntity getInitRoomType() {
		return initRoomType;
	}

	public void setInitRoomType(RoomTypeEntity initRoomType) {
		this.initRoomType = initRoomType;
	}

	
	
}
