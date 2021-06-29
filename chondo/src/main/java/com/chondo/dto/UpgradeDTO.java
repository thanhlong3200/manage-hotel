package com.chondo.dto;

public class UpgradeDTO extends AbstractDTO<UpgradeDTO>{

	private Integer free;
	
    private RoomTypeDTO initRoomType;
	
    private BookingDTO booking;

	public Integer getFree() {
		return free;
	}

	public void setFree(Integer free) {
		this.free = free;
	}

	public RoomTypeDTO getInitRoomType() {
		return initRoomType;
	}

	public void setInitRoomType(RoomTypeDTO initRoomType) {
		this.initRoomType = initRoomType;
	}

	public BookingDTO getBooking() {
		return booking;
	}

	public void setBooking(BookingDTO booking) {
		this.booking = booking;
	}
    
}
