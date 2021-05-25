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
	
	@Column
	private Integer capacity;
	
	@Column(name = "original_price")
	private Long originalPrice;
	
	@Column(name = "sell_price")
	private Long sellPrice;
	
	@Column
	private String image;
	
	@Column(columnDefinition = "TEXT")
	private String review;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "hotel_id")
	private HotelEntity hotel;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "room_type_id")
	private RoomTypeEntity roomType;
	
	@OneToMany(mappedBy = "room")
	private List<RateEntity> rates = new ArrayList<RateEntity>();
	
	@OneToOne(mappedBy = "room")
	private BookingEntity booking;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "status_id")
	private RoomStatusEntity status;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "promotion_id")
	private PromotionEntity promotion;
	
}
