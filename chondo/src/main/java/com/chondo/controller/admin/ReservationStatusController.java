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
import com.chondo.dto.BookingStatusDTO;
import com.chondo.service.IBookingService;
import com.chondo.service.IBookingStatusService;

@Controller(value = "reservationStatusAdmin")
public class ReservationStatusController {

	@Autowired
	private IBookingService bookingService;
	
	@Autowired
	private IBookingStatusService bookingStatusService;

	
	@RequestMapping(value = "/quan-tri/tinh-hinh-dat-phong", method = RequestMethod.GET)
	public ModelAndView reservationStatusPage(
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "limit", required = false) Integer limit,
			@RequestParam(value = "date", required = false) String date,
			@RequestParam(value = "status", required = false) String status) throws ParseException {
		ModelAndView mav = new ModelAndView("admin/room/reservation-status");
		List<BookingDTO> bookings = new ArrayList<BookingDTO>();
		Pageable pageable = new PageRequest(page - 1, limit);
		
		BookingDTO dto = new BookingDTO();
		dto.setLimit(limit);
		dto.setPage(page);	
		if (date != null) {
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			Date dateFilter = format.parse(date);
			if (status.equalsIgnoreCase("checkin")) {
				bookings = bookingService.findByDateFromAndStatusCode(dateFilter,"booked",pageable); 
				dto.setTotalPage((int) Math.round((double) bookingService.countByDateFromAndStatusCode(dateFilter,"booked") / dto.getLimit()));
			}else {
				bookings = bookingService.findByDateToAndStatusCode(dateFilter,"checkin",pageable); 		
				dto.setTotalPage((int) Math.round((double) bookingService.countByDateToAndStatusCode(dateFilter, "checkin") / dto.getLimit()));
			}
			
			dto.setListResult(bookings);
		
			mav.addObject("date",date);
		}else {		
		    Date dateFilter = new Date();  
			bookings = bookingService.findByDateFromAndStatusCode(dateFilter,"booked",pageable); 			
			dto.setListResult(bookings);
			dto.setTotalPage((int) Math.round((double) bookingService.countByDateFromAndStatusCode(dateFilter,"booked") / dto.getLimit()));
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");  
			  
			mav.addObject("date",format.format(dateFilter));
		}
		
		List<BookingStatusDTO> statusDTOs = bookingStatusService.findByActive(1);
		mav.addObject("statusCode",status);
		mav.addObject("listStatus",statusDTOs);
		mav.addObject("model",dto);
		return mav;
	}
}
