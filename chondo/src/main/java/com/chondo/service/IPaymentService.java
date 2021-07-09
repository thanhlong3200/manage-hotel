package com.chondo.service;

import java.util.Date;
import java.util.List;

import com.chondo.dto.BookingDTO;
import com.chondo.dto.PaymentDTO;

public interface IPaymentService {

	PaymentDTO createPayment(BookingDTO booking, String paymentTypeCode);

	PaymentDTO findOneByBookingId(Long id);

	List<PaymentDTO> findByRangeDate(Date dateFrom, Date dateTo);

	List<PaymentDTO> findAll();
	
}
