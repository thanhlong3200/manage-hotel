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
import com.chondo.dto.BookingDTO;
import com.chondo.dto.RoomDTO;
import com.chondo.dto.RoomStatusDTO;
import com.chondo.service.IBookedRoomService;
import com.chondo.service.IBookingService;
import com.chondo.service.IRoomService;
import com.chondo.service.IRoomStatusService;

@RestController(value = "changeRoomAPI")
public class ChangeRoomController {
	@Autowired
	private IBookingService bookingService;
	
	@Autowired
	private IBookedRoomService bookedRoomService;
	

	@Autowired
	private IRoomStatusService roomStatusService;

	@Autowired
	private IRoomService roomService;


	@GetMapping(value = "/quan-tri/doi-phong")
	public ModelAndView changeRoomPage(@RequestParam(value = "bookingCode", required = false) String bookingCode) {
		ModelAndView mav = new ModelAndView("admin/booking/change-room");
		if (bookingCode != null) {
			BookingDTO booking = bookingService.findOneByCode(bookingCode);

			if (booking != null) {
				List<RoomDTO> availableRoom = roomService.findAvailable(booking.getHotel().getId(),
						booking.getRoomType().getId(), booking.getDateFrom(), booking.getDateTo());

				List<RoomStatusDTO> listStatus = roomStatusService.findByActive(1);
				List<BookedRoomDTO> bookedRooms = bookedRoomService.findByBookingId(booking.getId());
				
				mav.addObject("bookedRooms", bookedRooms);
				mav.addObject("listStatus", listStatus);
				mav.addObject("availableRoom", availableRoom);
				
				mav.addObject("bookingCode", bookingCode);
				mav.addObject("booking", booking);
			}else {
				mav.addObject("error", "Không tìm thấy mã booking này !");
			}
			
		}

		return mav;
	}

	
	@PostMapping(value = "/api/change-room")
	@Transactional
	public BookingDTO changeRoom(@RequestBody BookingDTO booking){	
		
		
		bookedRoomService.changeRoom(booking);
		
		return bookingService.findOneByCode(booking.getCode());
	}
}
