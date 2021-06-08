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
@Table(name = "refunds")
public class RefundEntity extends BaseEntity{
	@Column(name = "pre_day_check_in")
	private Integer preDayCheckIn;
	
	@Column
	private Integer percent;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "room_type_refunds", joinColumns = @JoinColumn(name = "refund_id"), 
								  inverseJoinColumns = @JoinColumn(name = "room_type_id"))
	private List<RoomTypeEntity> roomTypes = new ArrayList<>();

	public Integer getPreDayCheckIn() {
		return preDayCheckIn;
	}

	public void setPreDayCheckIn(Integer preDayCheckIn) {
		this.preDayCheckIn = preDayCheckIn;
	}

	public Integer getPercent() {
		return percent;
	}

	public void setPercent(Integer percent) {
		this.percent = percent;
	}

	public List<RoomTypeEntity> getRoomTypes() {
		return roomTypes;
	}

	public void setRoomTypes(List<RoomTypeEntity> roomTypes) {
		this.roomTypes = roomTypes;
	}
	
	
}
