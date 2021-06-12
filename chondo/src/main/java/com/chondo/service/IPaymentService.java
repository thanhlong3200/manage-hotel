package com.chondo.service;

import com.chondo.dto.BookingDTO;
import com.chondo.dto.PaymentDTO;

public interface IPaymentService {

	PaymentDTO createPayment(BookingDTO booking);
	
}
