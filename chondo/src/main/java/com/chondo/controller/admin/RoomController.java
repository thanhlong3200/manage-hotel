package com.chondo.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.HotelDTO;
import com.chondo.dto.RoomDTO;
import com.chondo.dto.RoomStatusDTO;
import com.chondo.dto.RoomTypeDTO;
import com.chondo.service.IHotelService;
import com.chondo.service.IRateService;
import com.chondo.service.IRoomService;
import com.chondo.service.IRoomStatusService;
import com.chondo.service.IRoomTypeService;

@Controller(value = "roomControllerAdmin")
public class RoomController {

	@Autowired
	private IRoomStatusService roomStatusService;
	
	@Autowired
	private IRoomService roomService;
	
	@Autowired
	private IRoomTypeService roomTypeService;


	@RequestMapping(value = "/quan-tri/phong", method = RequestMethod.GET)
	public ModelAndView homePage(@RequestParam(value = "roomTypeCode", required = false) String roomTypeCode) {
		ModelAndView mav = new ModelAndView("admin/room/list-room");	

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
		return mav;
	}
}
