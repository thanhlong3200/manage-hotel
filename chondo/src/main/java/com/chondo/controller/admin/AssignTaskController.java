package com.chondo.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.StaffTaskDTO;
import com.chondo.service.IStaffTaskService;

@RestController(value = "assignTaskAPI")
public class AssignTaskController {
	
	@Autowired
	private IStaffTaskService staffTaskService;
	
	@GetMapping(value = "/quan-tri/phan-cong")
	public ModelAndView assignTaskPage(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "limit", required = false) Integer limit) {
		ModelAndView mav = new ModelAndView("admin/assign/list-assign");
		
		StaffTaskDTO dto = new StaffTaskDTO();
		
		Pageable pageable = new PageRequest(page-1, limit);          
		 
        dto.setListResult(staffTaskService.findAll(pageable));
       
        dto.setLimit(limit);
        dto.setPage(page);
        dto.setTotalPage((int) Math.round((double) staffTaskService.count() / dto.getLimit()));
        dto.setTotalItem(dto.getListResult().size());
		
		
		mav.addObject("model", dto);
		return mav;
	}
	
	@PostMapping(value = "/api/assign")
	@Transactional
	public StaffTaskDTO assignTask(@RequestBody StaffTaskDTO dto){	
	
		return staffTaskService.assignTask(dto);
	}
}
