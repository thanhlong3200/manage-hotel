package com.chondo.service.impl;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.dto.BookingDTO;
import com.chondo.dto.ImageDTO;
import com.chondo.dto.PaymentDTO;
import com.chondo.entity.BookingEntity;
import com.chondo.entity.ImageEntity;
import com.chondo.entity.PaymentEntity;
import com.chondo.entity.PaymentStatusEntity;
import com.chondo.entity.PaymentTypeEntity;
import com.chondo.repository.BookingRepository;
import com.chondo.repository.PaymentRepository;
import com.chondo.repository.PaymentStatusRepository;
import com.chondo.repository.PaymentTypeRepository;
import com.chondo.service.IPaymentService;
import com.chondo.util.CalculateUtil;

@Service
public class PaymentService implements IPaymentService{
	
	@Autowired
	private PaymentRepository paymentRepository;

	@Autowired
	private BookingRepository bookingRepository;
	
	@Autowired
	private PaymentStatusRepository paymentStatusRepository;
	
	@Autowired
	private PaymentTypeRepository paymentTypeRepository;
	
	@Override
	public PaymentDTO createPayment(BookingDTO booking) {
		PaymentEntity paymentEntity = new PaymentEntity();
		
		PaymentStatusEntity paymentStatusEntity = paymentStatusRepository.findOneByCode("unpaid");
		paymentEntity.setStatus(paymentStatusEntity);
		
		PaymentTypeEntity paymentTypeEntity = paymentTypeRepository.findOneByCode("cash");
		paymentEntity.setPaymentType(paymentTypeEntity);
		
		BookingEntity bookingEntity = bookingRepository.findOne(booking.getId());
		paymentEntity.setBooking(bookingEntity);
		
		Long countNight = CalculateUtil.countNight(bookingEntity.getDateFrom(), bookingEntity.getDateTo());
		Long originalPrice = bookingEntity.getRoomType().getOriginalPrice();
		Integer roomCount = bookingEntity.getRoomCount();
		paymentEntity.setTotalOriginalPrice(CalculateUtil.totalPrice(roomCount, originalPrice, countNight));
		
		Long sellPrice = bookingEntity.getRoomType().getSellPrice();
		paymentEntity.setTotalSellPrice(CalculateUtil.totalPrice(roomCount, sellPrice, countNight));
		
		
		paymentEntity = paymentRepository.save(paymentEntity);
		
		
		ModelMapper modelMapper = new ModelMapper();
		return modelMapper.map(paymentEntity, PaymentDTO.class);
	}

	@Override
	public List<PaymentDTO> findByBookingId(Long id) {
		List<PaymentEntity> entities = paymentRepository.findByBookingId(id);
		ModelMapper modelMapper = new ModelMapper();
		List<PaymentDTO> dtos = modelMapper.map(entities, new TypeToken<List<PaymentDTO>>(){}.getType());
		return dtos;
	}
	
	
}
