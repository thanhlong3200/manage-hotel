package com.chondo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "payments")
public class PaymentEntity extends BaseEntity{
	@Column(name = "total_original_price")
	private Long totalOriginalPrice;
	
	@Column(name = "total_sell_price")
	private Long totalSellPrice;
	
	
	@Column
	private String description;
	
	@ManyToOne
    @JoinColumn(name = "booking_id")
    private BookingEntity booking;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "payment_type_id")
	private PaymentTypeEntity paymentType;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "status_id")
	private PaymentStatusEntity status;

	public Long getTotalOriginalPrice() {
		return totalOriginalPrice;
	}

	public void setTotalOriginalPrice(Long totalOriginalPrice) {
		this.totalOriginalPrice = totalOriginalPrice;
	}

	public Long getTotalSellPrice() {
		return totalSellPrice;
	}

	public void setTotalSellPrice(Long totalSellPrice) {
		this.totalSellPrice = totalSellPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public BookingEntity getBooking() {
		return booking;
	}

	public void setBooking(BookingEntity booking) {
		this.booking = booking;
	}

	public PaymentTypeEntity getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(PaymentTypeEntity paymentType) {
		this.paymentType = paymentType;
	}

	public PaymentStatusEntity getStatus() {
		return status;
	}

	public void setStatus(PaymentStatusEntity status) {
		this.status = status;
	}

	
	
}
