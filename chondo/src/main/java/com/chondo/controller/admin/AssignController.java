package com.chondo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.StaffTaskDTO;
import com.chondo.service.IStaffTaskService;

@Controller(value = "assignControllerAdmin")
public class AssignController {
	
	@Autowired
	private IStaffTaskService staffTaskService;
	
	@RequestMapping(value = "/quan-tri/phan-cong", method = RequestMethod.GET)
	public ModelAndView homePage(@RequestParam(value = "page", required = false) Integer page,
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
}
