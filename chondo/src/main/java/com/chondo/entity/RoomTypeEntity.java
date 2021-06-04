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
import javax.persistence.Table;

@Entity
@Table(name = "room_types")
public class RoomTypeEntity extends BaseEntity {
	@Column
	private String code;
	
	@Column
	private String name;
	
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
	
	@OneToMany(mappedBy = "roomType")
	private List<RateEntity> rates = new ArrayList<RateEntity>();

	@OneToMany(mappedBy = "roomType")
	private List<RoomEntity> rooms = new ArrayList<RoomEntity>();
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "promotion_id")
	private PromotionEntity promotion;
	
	@ManyToMany(mappedBy = "roomTypes")
	private List<ServiceEntity> services = new ArrayList<ServiceEntity>();
	
	@OneToMany(mappedBy = "roomType")
	private List<BookingEntity> bookings = new ArrayList<BookingEntity>();
	
	@ManyToMany(mappedBy = "roomTypes")
	private List<FurnitureEntity> furnitures = new ArrayList<FurnitureEntity>();
	
	public Integer getCapacity() {
		return capacity;
	}

	public void setCapacity(Integer capacity) {
		this.capacity = capacity;
	}

	public Long getOriginalPrice() {
		return originalPrice;
	}

	public void setOriginalPrice(Long originalPrice) {
		this.originalPrice = originalPrice;
	}

	public Long getSellPrice() {
		return sellPrice;
	}

	public void setSellPrice(Long sellPrice) {
		this.sellPrice = sellPrice;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public List<RateEntity> getRates() {
		return rates;
	}

	public void setRates(List<RateEntity> rates) {
		this.rates = rates;
	}

	public PromotionEntity getPromotion() {
		return promotion;
	}

	public void setPromotion(PromotionEntity promotion) {
		this.promotion = promotion;
	}

	public List<ServiceEntity> getServices() {
		return services;
	}

	public void setServices(List<ServiceEntity> services) {
		this.services = services;
	}

	public List<BookingEntity> getBookings() {
		return bookings;
	}

	public void setBookings(List<BookingEntity> bookings) {
		this.bookings = bookings;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<RoomEntity> getRooms() {
		return rooms;
	}

	public void setRooms(List<RoomEntity> rooms) {
		this.rooms = rooms;
	}

	
	
}
