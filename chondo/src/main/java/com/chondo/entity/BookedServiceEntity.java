package com.chondo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name= "bookeds_services")
public class BookedServiceEntity extends BaseEntity{
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "booked_id")
    private BookedRoomEntity booked;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "service_id")
    private ServiceEntity service;

	
	@Column
	private Integer free;

	public BookedRoomEntity getBooked() {
		return booked;
	}

	public void setBooked(BookedRoomEntity booked) {
		this.booked = booked;
	}

	public ServiceEntity getService() {
		return service;
	}

	public void setService(ServiceEntity service) {
		this.service = service;
	}

	public Integer getFree() {
		return free;
	}

	public void setFree(Integer free) {
		this.free = free;
	}

	
}
