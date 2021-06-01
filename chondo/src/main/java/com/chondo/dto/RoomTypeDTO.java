package com.chondo.dto;

public class RoomTypeDTO extends AbstractDTO<RoomTypeDTO>{
	private String code;
	
	private String name;
	
	private Integer capacity;
	
	private Long originalPrice;
	
	private Long sellPrice;
	
	private String image;
	
	private String review;

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
	
}
