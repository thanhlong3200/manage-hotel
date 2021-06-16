package com.chondo.dto;

public class RoomDTO extends AbstractDTO<RoomDTO>{
	private Integer number;

	private Integer floor;
	
	private RoomStatusDTO status;

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

	public RoomStatusDTO getStatus() {
		return status;
	}

	public void setStatus(RoomStatusDTO status) {
		this.status = status;
	}

	
}
