package com.chondo.dto;

import com.chondo.entity.RoomEntity;

public class RoomDTO extends AbstractDTO<RoomDTO>{
	private Integer number;
	private Integer floor;
	private Integer capacity;
	private Long originalPrice;
	private Long sellPrice;
	private String image;
	private HotelDTO hotel;
	
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public Integer getFloor() {
		return floor;
	}
	public void setFloor(Integer floor) {
		this.floor = floor;
	}
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
	public HotelDTO getHotel() {
		return hotel;
	}
	public void setHotel(HotelDTO hotel) {
		this.hotel = hotel;
	}
	
}
