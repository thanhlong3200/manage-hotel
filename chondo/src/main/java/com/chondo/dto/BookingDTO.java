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
	
	private HotelDTO hotel;
	
	private RoomTypeDTO roomType;
	
	private Long userId;
	
	private CustomerDTO customer;
	
	private BookingStatusDTO status;
	
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

	
}
