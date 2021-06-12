package com.chondo.dto;

public class PaymentDTO extends AbstractDTO<PaymentDTO>{
	private Long totalOriginalPrice;
	
	private Long totalSellPrice;
	
	private String description;
	
    private BookingDTO booking;

	private PaymentTypeDTO paymentType;

	private PaymentStatusDTO status;

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

	
	
}
