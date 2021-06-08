package com.chondo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "payments")
public class PaymentEntity extends BaseEntity{
	@Column(name = "total_original_price")
	private Long totalOriginalPrice;
	
	@Column(name = "total_sell_price")
	private Long totalSellPrice;
	
	@Column(name = "total_price")
	private Long totalPrice;
	
	@Column
	private String description;
	
	@ManyToOne
    @JoinColumn(name = "booking_id")
    private BookingEntity booking;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "payment_type_id")
	private PaymentTypeEntity type;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "status_id")
	private PaymentStatusEntity status;
	
	
}
