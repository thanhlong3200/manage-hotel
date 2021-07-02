package com.chondo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.BookingDTO;
import com.chondo.dto.RoomDTO;
import com.chondo.dto.RoomStatusDTO;
import com.chondo.service.IBookedRoomService;
import com.chondo.service.IBookingService;
import com.chondo.service.IRoomService;
import com.chondo.service.IRoomStatusService;
import com.chondo.service.IServiceService;

@Controller(value = "checkOutController")
public class CheckOutController {

	@Autowired
	private IBookingService bookingService;
	
	@Autowired
	private IBookedRoomService bookedRoomService;
	
	@Autowired
	private IServiceService service;
	
	@Autowired
	private IRoomStatusService roomStatusService;

	@Autowired
	private IRoomService roomService;
	
	@RequestMapping(value = "/quan-tri/check-out", method = RequestMethod.GET)
	public ModelAndView checkInPage(@RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView();
	
		if (id==null) {
			List<RoomDTO> listRooms = roomService.findAll();

			List<RoomStatusDTO> listStatus = roomStatusService.findByActive(1);

			mav.addObject("listStatus", listStatus);
			mav.addObject("listRooms", listRooms);	
			mav.setViewName("admin/booking/checkOut");
		}else {
			BookedRoomDTO bookedRoomDTO = bookedRoomService.findOneByRoomId(id);
			BookingDTO bookingDTO = bookingService.findOneByBookedRoomsId(bookedRoomDTO.getId());
			return new ModelAndView("redirect:/quan-tri/booking?id="+bookingDTO.getId());
			
		}
		
		return mav;
	}
}
