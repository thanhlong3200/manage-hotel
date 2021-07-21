package com.chondo.controller.admin;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.BookingDTO;
import com.chondo.dto.RoomDTO;
import com.chondo.dto.RoomStatusDTO;
import com.chondo.service.IBookingService;
import com.chondo.service.IRoomService;
import com.chondo.service.IRoomStatusService;

@RestController(value = "extendBookingAPI")
public class ExtendBookingController {
	
	@Autowired
	private IBookingService bookingService;
	
	
	@Autowired 
	private IRoomService roomService;

	@Autowired
	private IRoomStatusService roomStatusService;
	
	@PostMapping(value = "/api/extend-booking")
	@Transactional
	public BookingDTO extend(@RequestBody BookingDTO dto){	
		
		BookingDTO bookingDTO = bookingService.extend(dto);
		
		return bookingDTO;
	}
	
	@GetMapping(value = "/quan-tri/gia-han-booking")
	public ModelAndView extendPage(@RequestParam(value = "code", required = false) String code,
			@RequestParam(value = "dateNumber", required = false) Integer dateNumber) {
		ModelAndView mav = new ModelAndView("admin/booking/extendBooking");

		if (code != null) {
			BookingDTO booking = bookingService.findOneByCode(code);
			if (booking != null) {
				if (dateNumber !=null) {
					Calendar c = Calendar.getInstance();
				    c.setTime(booking.getDateTo());
				    c.add(Calendar.DATE, dateNumber);

					List<RoomDTO> availableRoom = roomService.findAvailable(booking.getHotel().getId(), 
								booking.getRoomType().getId(), booking.getDateTo(), c.getTime());
						
					List<RoomStatusDTO> listStatus = roomStatusService.findByActive(1);
					
					mav.addObject("listStatus", listStatus);

					mav.addObject("availableRoom", availableRoom);
					mav.addObject("dateNumber", dateNumber);
				}
				
				
				mav.addObject("booking", booking);
				
			} else {
				mav.addObject("error", "Không tìm thấy mã booking này !");
			}
			
		}
		mav.addObject("code", code);
		return mav;
	}
	
}
