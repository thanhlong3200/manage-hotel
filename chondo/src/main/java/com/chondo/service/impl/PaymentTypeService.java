package com.chondo.service.impl;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.chondo.dto.PaymentTypeDTO;
import com.chondo.entity.PaymentTypeEntity;
import com.chondo.repository.PaymentTypeRepository;
import com.chondo.service.IPaymentTypeService;

@Controller
public class PaymentTypeService implements IPaymentTypeService{
	
	@Autowired
	private PaymentTypeRepository paymentTypeRepository;

	@Override
	public List<PaymentTypeDTO> findByActive(int i) {
		List<PaymentTypeEntity> entities = paymentTypeRepository.findByActive(i);
		ModelMapper modelMapper = new ModelMapper();
		List<PaymentTypeDTO> dtos = modelMapper.map(entities, new TypeToken<List<PaymentTypeDTO>>(){}.getType());
		return dtos;
	}
	
}
