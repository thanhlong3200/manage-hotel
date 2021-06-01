package com.chondo.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "rooms")
public class RoomEntity extends BaseEntity {
	
	@Column
	private Integer number;
	
	@Column
	private Integer floor;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "room_type_id")
	private RoomTypeEntity roomType;
	
	@OneToOne(mappedBy = "room")
	private BookedRoomEntity bookedRoom;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "status_id")
	private RoomStatusEntity status;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "hotel_id")
	private HotelEntity hotel;
	
	@ManyToMany(mappedBy = "rooms")
	private List<ServiceEntity> services = new ArrayList<ServiceEntity>();
	
}
