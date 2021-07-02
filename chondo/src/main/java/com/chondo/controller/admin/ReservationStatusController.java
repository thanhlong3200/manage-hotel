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
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "limit", required = false) Integer limit,
			@RequestParam(value = "date", required = false) String date) throws ParseException {
		ModelAndView mav = new ModelAndView("admin/room/reservation-status");
		List<BookingDTO> bookings = new ArrayList<BookingDTO>();
		Pageable pageable = new PageRequest(page - 1, limit);
		
		BookingDTO dto = new BookingDTO();
		dto.setLimit(limit);
		dto.setPage(page);
		
		if (date != null) {
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			Date dateFilter = format.parse(date);
			bookings = bookingService.findByDateFrom(dateFilter,pageable); 			
			dto.setListResult(bookings);
			dto.setTotalPage((int) Math.round((double) bookingService.countByDateFrom(dateFilter) / dto.getLimit()));
			mav.addObject("date",date);
		}else {		
			bookings = bookingService.findByStatusCode("booked",pageable);
			dto.setListResult(bookings);
			dto.setTotalPage((int) Math.round((double) bookingService.countByStatusCode("booked") / dto.getLimit()));
		
		}
		

		mav.addObject("model",dto);
		return mav;
	}
}
