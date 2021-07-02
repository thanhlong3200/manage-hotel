package com.chondo.service;

import java.util.List;

import com.chondo.dto.PaymentStatusDTO;
import com.chondo.dto.PaymentTypeDTO;

public interface IPaymentTypeService {

	List<PaymentTypeDTO> findByActive(int i);

}
