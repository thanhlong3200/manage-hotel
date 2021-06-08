package com.chondo.dto;

import java.util.ArrayList;
import java.util.List;

public class BookedRoomDTO extends AbstractDTO<BookedRoomDTO> {
	
	private BookingDTO booking;

	private RoomDTO room;

	private List<BookedServiceDTO> bookedServices = new ArrayList<BookedServiceDTO>();

	private List<CustomerDTO> customers = new ArrayList<CustomerDTO>();

	public BookingDTO getBooking() {
		return booking;
	}

	public void setBooking(BookingDTO booking) {
		this.booking = booking;
	}

	public RoomDTO getRoom() {
		return room;
	}

	public void setRoom(RoomDTO room) {
		this.room = room;
	}

	public List<BookedServiceDTO> getBookedServices() {
		return bookedServices;
	}

	public void setBookedServices(List<BookedServiceDTO> bookedServices) {
		this.bookedServices = bookedServices;
	}

	public List<CustomerDTO> getCustomers() {
		return customers;
	}

	public void setCustomers(List<CustomerDTO> customers) {
		this.customers = customers;
	}

	
}
