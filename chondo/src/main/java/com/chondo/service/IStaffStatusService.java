package com.chondo.service;

import java.util.List;

import com.chondo.dto.StaffStatusDTO;

public interface IStaffStatusService {

	List<StaffStatusDTO> findByActive(int i);

}
