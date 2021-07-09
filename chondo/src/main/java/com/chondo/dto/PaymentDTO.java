package com.chondo.dto;

public class PaymentDTO extends AbstractDTO<PaymentDTO>{
	
	
    private BookingDTO booking;

	private PaymentTypeDTO paymentType;

	private PaymentStatusDTO status;
	private Integer refund;
	
	private Long totalRefund;
	
	private Long totalPriceService;
	
	private Long totalPriceBooked;
	
	private Long totalSales;

	private Long totalPriceServiceFree;
	
	public Long getTotalRefund() {
		return totalRefund;
	}

	public void setTotalRefund(Long totalRefund) {
		this.totalRefund = totalRefund;
	}

	public Long getTotalPriceService() {
		return totalPriceService;
	}

	public void setTotalPriceService(Long totalPriceService) {
		this.totalPriceService = totalPriceService;
	}

	public Long getTotalPriceBooked() {
		return totalPriceBooked;
	}

	public void setTotalPriceBooked(Long totalPriceBooked) {
		this.totalPriceBooked = totalPriceBooked;
	}

	public Long getTotalSales() {
		return totalSales;
	}

	public void setTotalSales(Long totalSales) {
		this.totalSales = totalSales;
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

	public Integer getRefund() {
		return refund;
	}

	public void setRefund(Integer refund) {
		this.refund = refund;
	}

	public Long getTotalPriceServiceFree() {
		return totalPriceServiceFree;
	}

	public void setTotalPriceServiceFree(Long totalPriceServiceFree) {
		this.totalPriceServiceFree = totalPriceServiceFree;
	}


	
	
}
