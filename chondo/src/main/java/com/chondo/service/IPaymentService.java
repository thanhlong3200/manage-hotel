package com.chondo.service;

import java.util.List;

import com.chondo.dto.BookingDTO;
import com.chondo.dto.PaymentDTO;

public interface IPaymentService {

	PaymentDTO createPayment(BookingDTO booking, String paymentTypeCode);

	PaymentDTO findOneByBookingId(Long id);
	
}
