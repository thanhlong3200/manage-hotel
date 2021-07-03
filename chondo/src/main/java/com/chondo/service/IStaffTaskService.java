package com.chondo.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.chondo.dto.StaffTaskDTO;

public interface IStaffTaskService {

	List<StaffTaskDTO> findAll(Pageable pageable);

	Long count();

	StaffTaskDTO assignTask(StaffTaskDTO dto);

}
