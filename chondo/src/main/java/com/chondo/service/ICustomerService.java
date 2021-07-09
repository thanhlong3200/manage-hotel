package com.chondo.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.chondo.dto.CustomerDTO;

public interface ICustomerService {
	CustomerDTO findOneByEmail(String email);
	CustomerDTO save(CustomerDTO customer);
	CustomerDTO changeStatus(CustomerDTO customer);
	List<CustomerDTO> findAll(Pageable pageable);
	Integer count();
}
