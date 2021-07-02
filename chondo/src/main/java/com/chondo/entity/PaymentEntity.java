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
	
	@Column
	private Integer refund;
	
	@OneToOne
    @JoinColumn(name = "booking_id")
    private BookingEntity booking;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "payment_type_id")
	private PaymentTypeEntity paymentType;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "status_id")
	private PaymentStatusEntity status;

	
	public Integer getRefund() {
		return refund;
	}

	public void setRefund(Integer refund) {
		this.refund = refund;
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
