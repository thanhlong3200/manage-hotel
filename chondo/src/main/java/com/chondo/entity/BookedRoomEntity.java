package com.chondo.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "booked_rooms")
public class BookedRoomEntity extends BaseEntity {
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "booking_id")
    private BookingEntity booking;
		
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "room_id")
    private RoomEntity room;
	

	@OneToMany(mappedBy = "booked")
	private List<BookedServiceEntity> bookedServices = new ArrayList<BookedServiceEntity>();
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "booked_room_customers", joinColumns = @JoinColumn(name = "booked_room_id"), 
								  inverseJoinColumns = @JoinColumn(name = "customer_id"))
	private List<CustomerEntity> customers = new ArrayList<CustomerEntity>();

	

	public BookingEntity getBooking() {
		return booking;
	}

	public void setBooking(BookingEntity booking) {
		this.booking = booking;
	}

	public RoomEntity getRoom() {
		return room;
	}

	public void setRoom(RoomEntity room) {
		this.room = room;
	}

	public List<BookedServiceEntity> getBookedServices() {
		return bookedServices;
	}

	public void setBookedServices(List<BookedServiceEntity> bookedServices) {
		this.bookedServices = bookedServices;
	}

	public List<CustomerEntity> getCustomers() {
		return customers;
	}

	public void setCustomers(List<CustomerEntity> customers) {
		this.customers = customers;
	}
	
	
}
