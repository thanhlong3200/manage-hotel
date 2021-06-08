package com.chondo.service;

import com.chondo.dto.CustomerDTO;
import com.chondo.entity.CustomerEntity;

public interface ICustomerService {
	CustomerDTO findOneByEmail(String email);
	CustomerDTO save(CustomerDTO customer);
}
