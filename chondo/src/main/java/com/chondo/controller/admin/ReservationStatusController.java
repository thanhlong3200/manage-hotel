package com.chondo.controller.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.BookingDTO;
import com.chondo.dto.RoomDTO;
import com.chondo.dto.StaffTaskDTO;
import com.chondo.entity.RoomEntity;
import com.chondo.service.IBookingService;
import com.chondo.service.IRoomService;
import com.chondo.service.IRoomStatusService;
import com.chondo.service.IRoomTypeService;

@Controller(value = "reservationStatusAdmin")
public class ReservationStatusController {
	@Autowired
	private IRoomStatusService roomStatusService;
	
	@Autowired
	private IRoomService roomService;
	
	@Autowired
	private IRoomTypeService roomTypeService;
	
	@Autowired
	private IBookingService bookingService;

	
	@RequestMapping(value = "/quan-tri/tinh-hinh-dat-phong", method = RequestMethod.GET)
	public ModelAndView reservationStatusPage(
			@RequestParam(value = "date", required = false) String date) throws ParseException {
		ModelAndView mav = new ModelAndView("admin/room/reservation-status");
		List<RoomDTO> listRooms = new ArrayList<RoomDTO>();
		if (date != null) {
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			Date dateFilter = format.parse(date);
			listRooms = roomService.findByBookedRoom(dateFilter); 
			mav.addObject("date",date);
		}else {
			listRooms = roomService.findAll();
		}
		 
		
		mav.addObject("listRooms",listRooms);
		return mav;
	}
}
