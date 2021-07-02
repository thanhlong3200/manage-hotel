package com.chondo.dto;

public class PaymentDTO extends AbstractDTO<PaymentDTO>{
	
	
    private BookingDTO booking;

	private PaymentTypeDTO paymentType;

	private PaymentStatusDTO status;
	private Integer refund;


	public BookingDTO getBooking() {
		return booking;
	}

	public void setBooking(BookingDTO booking) {
		this.booking = booking;
	}

	

	public PaymentStatusDTO getStatus() {
		return status;
	}

	public void setStatus(PaymentStatusDTO status) {
		this.status = status;
	}

	public PaymentTypeDTO getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(PaymentTypeDTO paymentType) {
		this.paymentType = paymentType;
	}

	public Integer getRefund() {
		return refund;
	}

	public void setRefund(Integer refund) {
		this.refund = refund;
	}

	
	
}
