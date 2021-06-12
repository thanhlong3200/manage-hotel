package com.chondo.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "bills")
public class BillEntity extends BaseEntity{
	@Column
	private String code;
	
	@Column(name = "total_original_price")
	private Long totalOriginalPrice;
	
	@Column(name = "total_sell_price")
	private Long totalSellPrice;

	
	@OneToOne
    @JoinColumn(name = "booking_id")
    private BookingEntity booking;
}
