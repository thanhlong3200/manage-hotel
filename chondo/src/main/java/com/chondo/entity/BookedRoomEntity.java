package com.chondo.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "booked_rooms")
public class BookedRoomEntity extends BaseEntity {
	
	@ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @JoinColumn(name = "booking_id")
    private BookingEntity booking;
		
	@OneToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @JoinColumn(name = "room_id")
    private RoomEntity room;
		
	@OneToMany(mappedBy = "booked")
	private List<BookedServiceEntity> bookedServices = new ArrayList<BookedServiceEntity>();
}
