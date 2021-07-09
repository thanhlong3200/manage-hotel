package com.chondo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.BookedServiceDTO;
import com.chondo.dto.RoomDTO;
import com.chondo.dto.RoomStatusDTO;
import com.chondo.dto.ServiceDTO;
import com.chondo.service.IBookedRoomService;
import com.chondo.service.IRoomService;
import com.chondo.service.IRoomStatusService;
import com.chondo.service.IServiceService;

@RestController(value = "serviceAPI")
public class ServiceController {
	@Autowired
	private IServiceService service;
	
	@Autowired
	private IBookedRoomService bookedRoomService;
	
	@Autowired
	private IRoomStatusService roomStatusService;

	@Autowired
	private IRoomService roomService;

	
	@GetMapping(value = "/quan-tri/dich-vu")
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
	
	@PostMapping(value = "/api/service")
	@Transactional
	public ServiceDTO saveCustomerCheckIn(@RequestBody ServiceDTO dto){
		
		BookedRoomDTO bookedRoomDTO = bookedRoomService.findOneByRoomId(dto.getId());
		
		BookedServiceDTO bookedServiceDTO = service.createBookedService(bookedRoomDTO,dto.getCode());

		return dto;
	}
}
