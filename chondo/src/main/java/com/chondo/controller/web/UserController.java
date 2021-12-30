package com.chondo.controller.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.BookingDTO;
import com.chondo.dto.CustomerDTO;
import com.chondo.dto.UserDTO;
import com.chondo.response.MessageResponse;
import com.chondo.service.IBookedRoomService;
import com.chondo.service.IBookingService;
import com.chondo.service.ICustomerService;
import com.chondo.service.IUserService;

@RestController(value = "userAPI")
public class UserController {
	@Autowired
	private IUserService userService;

	@Autowired
	private IBookingService bookingService;

	@Autowired
	private ICustomerService customerService;

	@Autowired
	private IBookedRoomService bookedRoomService;

	@GetMapping(value = "lich-su-dat-phong")
	public ModelAndView historyBookingPage(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "limit", required = false) Integer limit,
			@RequestParam(value = "bookingCode", required = false) String bookingCode,
			@RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView();

		UserDTO userDTO = userService.findOne(id);
		String email = userDTO.getEmail();
		Pageable pageable = new PageRequest(page - 1, limit);
		System.out.println(email);

		CustomerDTO customerDTO = customerService.findOneByEmail(email);
		Long customerID = customerDTO.getId();

		BookingDTO dto = new BookingDTO();

		System.out.println("customer id" + customerID);
		List<BookingDTO> list = bookingService.findByCustomerId(customerID, pageable);

		System.out.println(list);

		dto.setListResult(list);

		dto.setLimit(limit);
		dto.setPage(page);

		dto.setTotalPage((int) Math.round((double) bookingService.count() / dto.getLimit()));

		mav.addObject("model", dto);
		mav.setViewName("web/historyBooking");
		return mav;
	}

	@GetMapping(value = "chi-tiet-dat-phong")
	public ModelAndView detailBooking(@RequestParam(value = "id", required = true) Long id) {
		ModelAndView mav = new ModelAndView();
		BookingDTO bookingDTO = bookingService.findOne(id);


		List<BookedRoomDTO> bookedRooms = bookedRoomService.findByBookingId(bookingDTO.getId());
		
		System.out.println("booking" + bookingDTO.getCode());

		mav.addObject("booking", bookingDTO);
		mav.addObject("bookedRooms", bookedRooms);
		
		mav.setViewName("web/detailBooking");
		return mav;
	}
	
	@RequestMapping(value = {"/danh-gia"}, method = RequestMethod.GET)
	public ModelAndView ratingPage(@RequestParam(value = "roomTypeId", required = false) Long roomTypeId,
			@RequestParam(value = "rating", required = false) Integer vote,
			@RequestParam(value = "comment", required = false) String comment) {
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("web/tim-kiem");
		return mav;
	}
	
}
