package com.chondo.dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.chondo.entity.BookedRoomEntity;

public class BookingDTO extends AbstractDTO<BookingDTO>{
	private String code;
	
	private Date dateFrom;
	
	private Date dateTo;
	
	private Integer roomCount;
	
	private Integer adult;
	
	private Integer children;
	
	private String logs;
	
	private HotelDTO hotel;
	
	private RoomTypeDTO roomType;
	
	private Long userId;
	
	private CustomerDTO customer;
	
	private BookingStatusDTO status;
	
	private Long sellPriceBooked;
	
	private Long sellPriceUpgrade;
	
	private Long originalPriceBooked;
	
	private Long originalPriceUpgrade;
	
	private Long priceService;
	
	private Long totalPrice;
	
	private Long nightCount;
	private boolean refund;

	private List<BookedRoomDTO> bookedRooms = new ArrayList<BookedRoomDTO>();

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Date getDateFrom() {
		return dateFrom;
	}

	public void setDateFrom(Date dateFrom) {
		this.dateFrom = dateFrom;
	}

	public Date getDateTo() {
		return dateTo;
	}

	public void setDateTo(Date dateTo) {
		this.dateTo = dateTo;
	}

	public Integer getRoomCount() {
		return roomCount;
	}

	public void setRoomCount(Integer roomCount) {
		this.roomCount = roomCount;
	}

	public Integer getAdult() {
		return adult;
	}

	public void setAdult(Integer adult) {
		this.adult = adult;
	}

	public Integer getChildren() {
		return children;
	}

	public void setChildren(Integer children) {
		this.children = children;
	}

	public HotelDTO getHotel() {
		return hotel;
	}

	public void setHotel(HotelDTO hotel) {
		this.hotel = hotel;
	}

	public RoomTypeDTO getRoomType() {
		return roomType;
	}

	public void setRoomType(RoomTypeDTO roomType) {
		this.roomType = roomType;
	}

	

	public CustomerDTO getCustomer() {
		return customer;
	}

	public void setCustomer(CustomerDTO customer) {
		this.customer = customer;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public BookingStatusDTO getStatus() {
		return status;
	}

	public void setStatus(BookingStatusDTO status) {
		this.status = status;
	}

	public List<BookedRoomDTO> getBookedRooms() {
		return bookedRooms;
	}

	public void setBookedRooms(List<BookedRoomDTO> bookedRooms) {
		this.bookedRooms = bookedRooms;
	}

	public String getLogs() {
		return logs;
	}

	public void setLogs(String logs) {
		this.logs = logs;
	}

	public Long getSellPriceBooked() {
		return sellPriceBooked;
	}

	public void setSellPriceBooked(Long sellPriceBooked) {
		this.sellPriceBooked = sellPriceBooked;
	}

	public Long getSellPriceUpgrade() {
		return sellPriceUpgrade;
	}

	public void setSellPriceUpgrade(Long sellPriceUpgrade) {
		this.sellPriceUpgrade = sellPriceUpgrade;
	}

	public Long getOriginalPriceBooked() {
		return originalPriceBooked;
	}

	public void setOriginalPriceBooked(Long originalPriceBooked) {
		this.originalPriceBooked = originalPriceBooked;
	}

	public Long getOriginalPriceUpgrade() {
		return originalPriceUpgrade;
	}

	public void setOriginalPriceUpgrade(Long originalPriceUpgrade) {
		this.originalPriceUpgrade = originalPriceUpgrade;
	}

	public Long getPriceService() {
		return priceService;
	}

	public void setPriceService(Long priceService) {
		this.priceService = priceService;
	}

	public Long getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Long totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Long getNightCount() {
		return nightCount;
	}

	public void setNightCount(Long nightCount) {
		this.nightCount = nightCount;
	}

	public String toStringBooking() {
		StringBuilder toString = new StringBuilder();
		toString.append("Ma booking: " + getCode() + "\n");
		toString.append("Khach hang: " + getCustomer().getFirstName() + " " + getCustomer().getLastName() + "\n");
		toString.append("Loai phong: " + getRoomType().getName() + "\n");
		toString.append("Ngay nhan phong: " + getDateFrom() + "\n");
		toString.append("Ngay tra phong: " + getDateTo() + "\n");
		toString.append("So phong: " + getRoomCount() + "\n");
		toString.append("So khach: " + getAdult() + " nguoi lon, " + getChildren() + " tre em" +"\n");
		toString.append("Gio dat: " + getCreatedDate() + "\n");
		return toString.toString();
	}

	public boolean isRefund() {
		return refund;
	}

	public void setRefund(boolean refund) {
		this.refund = refund;
	}

	
}
