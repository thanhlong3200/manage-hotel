package com.chondo.dto;

import java.util.ArrayList;
import java.util.List;

import com.chondo.entity.HotelEntity;

public class RoomDTO extends AbstractDTO<RoomDTO>{
	private Integer number;

	private Integer floor;

	private RoomTypeDTO roomType;
	
	private RoomStatusDTO status;

	private HotelDTO hotel;

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

	public RoomTypeDTO getRoomType() {
		return roomType;
	}

	public void setRoomType(RoomTypeDTO roomType) {
		this.roomType = roomType;
	}


	public RoomStatusDTO getStatus() {
		return status;
	}

	public void setStatus(RoomStatusDTO status) {
		this.status = status;
	}

	public HotelDTO getHotel() {
		return hotel;
	}

	public void setHotel(HotelDTO hotel) {
		this.hotel = hotel;
	}
	
	
	
}
