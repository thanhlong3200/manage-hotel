package com.chondo.dto;

public class BookedServiceDTO extends AbstractDTO<BookedServiceDTO> {
   
    private BookedRoomDTO booked;

    private ServiceDTO service;
	
	private Integer used;

	private Integer free;

	public BookedRoomDTO getBooked() {
		return booked;
	}

	public void setBooked(BookedRoomDTO booked) {
		this.booked = booked;
	}

	public ServiceDTO getService() {
		return service;
	}

	public void setService(ServiceDTO service) {
		this.service = service;
	}

	public Integer getUsed() {
		return used;
	}

	public void setUsed(Integer used) {
		this.used = used;
	}

	public Integer getFree() {
		return free;
	}

	public void setFree(Integer free) {
		this.free = free;
	}
	
	
}
