package com.chondo.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "booked_rooms")
public class BookedRoomEntity extends BaseEntity {
	
	@OneToOne
    @JoinColumn(name = "booking_id")
    private BookingEntity booking;
		
	@OneToOne
    @JoinColumn(name = "room_id")
    private RoomEntity room;
		
	
}
