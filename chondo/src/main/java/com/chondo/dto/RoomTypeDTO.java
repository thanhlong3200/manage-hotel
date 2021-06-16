package com.chondo.dto;

import java.util.ArrayList;
import java.util.List;

import com.chondo.entity.PromotionEntity;
import com.chondo.entity.RefundEntity;

public class RoomTypeDTO extends AbstractDTO<RoomTypeDTO>{
	private String code;
	
	private String name;
	
	private Integer capacity;
	
	private Integer acreage;
	
	private Long originalPrice;
	
	private Long sellPrice;
	
	private String image;
	
	private String review;
	
	private Integer prepayment;
	
	private PromotionDTO promotion;
	
	private List<FurnitureDTO> furnitures = new ArrayList<FurnitureDTO>();
	
	private List<ServiceDTO> services = new ArrayList<ServiceDTO>();

	private List<RateDTO> rates =  new ArrayList<RateDTO>();
	
	private List<ImageDTO> images =  new ArrayList<ImageDTO>();
	
	private List<RefundDTO> refunds = new ArrayList<RefundDTO>();
	
	
	private double averageBadge;
	
	private String rank;
	
	public List<FurnitureDTO> getFurnitures() {
		return furnitures;
	}

	public void setFurnitures(List<FurnitureDTO> furnitures) {
		this.furnitures = furnitures;
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

	public List<RateDTO> getRates() {
		return rates;
	}

	public void setRates(List<RateDTO> rates) {
		this.rates = rates;
	}

	public double getAverageBadge() {
		return averageBadge;
	}

	public void setAverageBadge(double averageBadge) {
		this.averageBadge = averageBadge;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public List<ServiceDTO> getServices() {
		return services;
	}

	public void setServices(List<ServiceDTO> services) {
		this.services = services;
	}

	public Integer getAcreage() {
		return acreage;
	}

	public void setAcreage(Integer acreage) {
		this.acreage = acreage;
	}

	public List<ImageDTO> getImages() {
		return images;
	}

	public void setImages(List<ImageDTO> images) {
		this.images = images;
	}

	public List<RefundDTO> getRefunds() {
		return refunds;
	}

	public void setRefunds(List<RefundDTO> refunds) {
		this.refunds = refunds;
	}

	public Integer getPrepayment() {
		return prepayment;
	}

	public void setPrepayment(Integer prepayment) {
		this.prepayment = prepayment;
	}

	public PromotionDTO getPromotion() {
		return promotion;
	}

	public void setPromotion(PromotionDTO promotion) {
		this.promotion = promotion;
	}

}
