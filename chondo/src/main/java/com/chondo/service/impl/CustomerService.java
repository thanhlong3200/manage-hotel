package com.chondo.service.impl;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.chondo.dto.CustomerDTO;
import com.chondo.dto.PaymentTypeDTO;
import com.chondo.entity.CustomerEntity;
import com.chondo.entity.PaymentTypeEntity;
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

	@Override
	public List<CustomerDTO> findAll(Pageable pageable) {
		List<CustomerEntity> entities = customerRepository.findAll(pageable).getContent();
		ModelMapper modelMapper = new ModelMapper();
		List<CustomerDTO> dtos = modelMapper.map(entities, new TypeToken<List<CustomerDTO>>(){}.getType());
		return dtos;
	}

	@Override
	public Integer count() {
		return (int) customerRepository.count();
	}
	
	
}
