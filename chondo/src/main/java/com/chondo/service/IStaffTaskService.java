package com.chondo.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.chondo.dto.StaffTaskDTO;

public interface IStaffTaskService {

	List<StaffTaskDTO> assignTask(long[] ids, String code);

	List<StaffTaskDTO> findAll(Pageable pageable);

	Long count();

}
