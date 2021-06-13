package com.chondo.dto;

public class RoomDTO extends AbstractDTO<RoomDTO>{
	private Integer number;

	private Integer floor;

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

	
}
