package com.chondo.service;

import java.util.List;

import com.chondo.dto.StaffDTO;

public interface IStaffService {

	List<StaffDTO> findByStatusCode(String code);

}
