package com.chondo.service.impl;

import java.util.Date;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.dto.BookingDTO;
import com.chondo.dto.PaymentDTO;
import com.chondo.dto.PaymentTypeDTO;
import com.chondo.entity.BookingEntity;
import com.chondo.entity.PaymentEntity;
import com.chondo.entity.PaymentTypeEntity;
import com.chondo.repository.BookingRepository;
import com.chondo.repository.PaymentRepository;
import com.chondo.repository.PaymentTypeRepository;
import com.chondo.service.IPaymentService;
import com.chondo.util.LogUtil;

@Service
public class PaymentService implements IPaymentService{
	
	@Autowired
	private PaymentRepository paymentRepository;

	@Autowired
	private BookingRepository bookingRepository;
	
	
	@Autowired
	private PaymentTypeRepository paymentTypeRepository;
	
	@Override
	public PaymentDTO createPayment(BookingDTO booking, String paymentTypeCode) {
		PaymentEntity paymentEntity = new PaymentEntity();
		
		PaymentTypeEntity paymentTypeEntity = paymentTypeRepository.findOneByCode(paymentTypeCode);
		paymentEntity.setPaymentType(paymentTypeEntity);
		
		BookingEntity bookingEntity = bookingRepository.findOne(booking.getId());
		paymentEntity.setBooking(bookingEntity);
		
		bookingEntity.setLogs(bookingEntity.getLogs() + LogUtil.createLog("check-out") +"</br>");
		bookingRepository.save(bookingEntity);
		
		if (booking.isRefund()) {
			paymentEntity.setRefund(1);
		}

		paymentEntity = paymentRepository.save(paymentEntity);
	
		ModelMapper modelMapper = new ModelMapper();
		return modelMapper.map(paymentEntity, PaymentDTO.class);
	}

	@Override
	public PaymentDTO findOneByBookingId(Long id) {
		ModelMapper modelMapper = new ModelMapper();
		PaymentEntity paymentEntity = paymentRepository.findOneByBookingId(id);
		return modelMapper.map(paymentEntity, PaymentDTO.class);
	}

	@Override
	public List<PaymentDTO> findByRangeDate(Date dateFrom, Date dateTo) {
		List<PaymentEntity> entities = paymentRepository.findByRangeDate(dateFrom,dateTo);
		ModelMapper modelMapper = new ModelMapper();
		List<PaymentDTO> dtos = modelMapper.map(entities, new TypeToken<List<PaymentDTO>>(){}.getType());
		return dtos;
	}

	@Override
	public List<PaymentDTO> findAll() {
		List<PaymentEntity> entities = paymentRepository.findAll();
		ModelMapper modelMapper = new ModelMapper();
		List<PaymentDTO> dtos = modelMapper.map(entities, new TypeToken<List<PaymentDTO>>(){}.getType());
		return dtos;
	}



	
}
