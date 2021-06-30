package com.chondo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.RoomDTO;
import com.chondo.dto.RoomStatusDTO;
import com.chondo.dto.ServiceDTO;
import com.chondo.service.IBookedRoomService;
import com.chondo.service.IRoomService;
import com.chondo.service.IRoomStatusService;
import com.chondo.service.IServiceService;

@Controller(value = "serviceControllerAdmin")
public class ServiceController {
	
	@Autowired
	private IServiceService service;
	
	@Autowired
	private IRoomStatusService roomStatusService;

	@Autowired
	private IBookedRoomService bookedRoomService;

	@Autowired
	private IRoomService roomService;

	
	@RequestMapping(value = "/quan-tri/dich-vu", method = RequestMethod.GET)
	public ModelAndView editPage(@RequestParam(value = "code", required = false) String code) {
		ModelAndView mav = new ModelAndView();
		
		if (code !=null) {
			ServiceDTO serviceDTO = service.findOneByCode(code);
			List<RoomDTO> listRooms = roomService.findAll();

			List<RoomStatusDTO> listStatus = roomStatusService.findByActive(1);

			mav.addObject("listStatus", listStatus);
			mav.addObject("listRooms", listRooms);	
			mav.addObject("service", serviceDTO);
			mav.setViewName("admin/service/serviceDetails");
		}else{
			List<ServiceDTO> services = service.findAll();

	    	mav.addObject("services", services);
	    	mav.setViewName("admin/service/list-service");
		}
		
		
		return mav;
	}

}
