package com.chondo.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.BookingDTO;
import com.chondo.dto.RoomDTO;
import com.chondo.dto.RoomStatusDTO;
import com.chondo.dto.RoomTypeDTO;
import com.chondo.dto.StaffDTO;
import com.chondo.dto.StaffStatusDTO;
import com.chondo.dto.TaskDTO;
import com.chondo.service.IBookingService;
import com.chondo.service.IRoomService;
import com.chondo.service.IRoomStatusService;
import com.chondo.service.IRoomTypeService;
import com.chondo.service.IStaffService;
import com.chondo.service.IStaffStatusService;
import com.chondo.service.ITaskService;

@Controller(value = "roomControllerAdmin")
public class RoomController {

	@Autowired
	private IRoomStatusService roomStatusService;
	
	@Autowired
	private IRoomService roomService;
	
	@Autowired
	private IRoomTypeService roomTypeService;
	
	@Autowired
	private IStaffStatusService staffStatusService;
	
	@Autowired
	private IStaffService staffService;
	
	@Autowired
	private ITaskService taskService;

	@RequestMapping(value = "/quan-tri/phong", method = RequestMethod.GET)
	public ModelAndView homePage
			(@RequestParam(value = "roomTypeCode", required = false) String roomTypeCode,
			@RequestParam(value = "number", required = false) Integer number) {
		ModelAndView mav = new ModelAndView();	
		if (number != null) {
			
			List<StaffStatusDTO> listStatus = staffStatusService.findByActive(1);
			
			List<StaffDTO> availableStaff = staffService.findByStatusCode("available");
			
			List<TaskDTO> tasks = taskService.findAll();
			
			RoomDTO roomDTO = roomService.findOneByNumber(number);
			
			mav.addObject("listStatus", listStatus);
			mav.addObject("availableStaff", availableStaff);
			mav.addObject("tasks", tasks);
			mav.addObject("room", roomDTO);
			mav.setViewName("admin/room/room-details");
		} else {
			List<RoomDTO> allRoom = new ArrayList<RoomDTO>();
			
			if (roomTypeCode==null) {
				allRoom = roomService.findAll();
			}else {			
				allRoom = roomService.findByRoomTypeCode(roomTypeCode);				
			}
				
			List<RoomStatusDTO> listStatus = roomStatusService.findByActive(1);
			List<RoomTypeDTO> roomTypes = roomTypeService.findAll();
			
			mav.addObject("listStatus", listStatus);
			mav.addObject("allRoom", allRoom);
			mav.addObject("roomTypes", roomTypes);
			mav.addObject("roomTypeCode", roomTypeCode);
			
			mav.setViewName("admin/room/list-room");
		}
			
		return mav;
	}
}
