package com.chondo.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.chondo.dto.StaffTaskDTO;
import com.chondo.service.IStaffTaskService;

@RestController(value = "assignTaskAPI")
public class AssignTaskAPI {
	
	@Autowired
	private IStaffTaskService staffTaskService;
	
	@PostMapping(value = "/api/assign")
	@Transactional
	public StaffTaskDTO assignGuideGuest(@RequestBody StaffTaskDTO dto){	
	
		return staffTaskService.assignTask(dto);
	}
}
