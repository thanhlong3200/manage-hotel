package com.chondo.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "bookings")
public class BookingEntity extends BaseEntity {
	
	@Column
	private String code;
	
	@Column(name = "date_from")
	private Date dateFrom;
	
	@Column (name = "date_to")
	private Date dateTo;
	
	@Column (name = "room_count")
	private Integer roomCount;
	
	@Column(name = "adult")
	private Integer adult;
	
	@Column(name = "children")
	private Integer children;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private UserEntity user;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "hotel_id")
	private HotelEntity hotel;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "status_id")
	private BookingStatusEntity status;
	
	
	@OneToOne
    @JoinColumn(name = "room_type_id")
    private RoomTypeEntity roomType;
	
	
	
	@OneToOne(mappedBy = "booking")
	private BookedRoomEntity bookedRoom;
	
	@OneToOne(mappedBy = "booking")
	private PaymentEntity payment;
	
	@OneToOne(mappedBy = "booking")
	private BillEntity bill;
	

		
}
