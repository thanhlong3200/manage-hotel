package com.chondo.service.impl;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.dto.CustomerDTO;
import com.chondo.entity.CustomerEntity;
import com.chondo.repository.CustomerRepository;
import com.chondo.service.ICustomerService;

@Service
public class CustomerService implements ICustomerService{
	@Autowired
	private CustomerRepository customerRepository;
	
	@Override
	public CustomerDTO findOneByEmail(String email) {
		CustomerEntity entity = customerRepository.findOneByEmail(email);
		if (entity==null) {
			return null;
		}
		ModelMapper modelMapper = new ModelMapper();
		return modelMapper.map(entity, CustomerDTO.class);
	}

	@Override
	public CustomerDTO save(CustomerDTO customer) {
		ModelMapper modelMapper = new ModelMapper();
		CustomerEntity entity = modelMapper.map(customer, CustomerEntity.class);
		entity = customerRepository.save(entity);
		return modelMapper.map(entity, CustomerDTO.class);
	}

	@Override
	public CustomerDTO changeStatus(CustomerDTO customer) {
		ModelMapper modelMapper = new ModelMapper();
		CustomerEntity entity = customerRepository.findOne(customer.getId());
		entity.setCheckIn(0);
		entity = customerRepository.save(entity);
		return modelMapper.map(entity, CustomerDTO.class);
	}
	
	
}
