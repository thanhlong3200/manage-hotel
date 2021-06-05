package com.chondo.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SearchDTO extends AbstractDTO<SearchDTO>{
	private String dateFrom;
	private String dateTo;
	private Integer adult;
	private Integer children;
	private Integer roomCount;
	private long nightCount;
	private String location;
	

	public SearchDTO(String dateFromStr, String dateToStr, Integer adult, Integer children, Integer roomCount, String location) {
		this.dateFrom = dateFromStr;
		this.dateTo = dateToStr;
		this.adult = adult;
		this.children = children;
		this.roomCount = roomCount;
		this.nightCount = nightCount();
		this.location = location;
	}
	
	private long nightCount() {
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		 Date from;
		 Date to;
		try {
			from = format.parse(this.dateFrom);
		    to = format.parse(this.dateTo);
		} catch (ParseException e) {
			return 0;
		}
		 long diff = to.getTime() - from.getTime();
		 return diff / (1000 * 60 * 60 * 24);
	}

	
	public String getDateFrom() {
		return dateFrom;
	}

	public void setDateFrom(String dateFrom) {
		this.dateFrom = dateFrom;
	}

	public String getDateTo() {
		return dateTo;
	}

	public void setDateTo(String dateTo) {
		this.dateTo = dateTo;
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

	public Integer getRoomCount() {
		return roomCount;
	}

	public void setRoomCount(Integer roomCount) {
		this.roomCount = roomCount;
	}

	public long getNightCount() {
		return nightCount;
	}

	public void setNightCount(long nightCount) {
		this.nightCount = nightCount;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	
		
}
