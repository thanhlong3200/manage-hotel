package com.chondo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.BookingDTO;
import com.chondo.dto.CustomerDTO;
import com.chondo.service.IBookingService;
import com.chondo.service.ICustomerService;

@Controller(value = "customerAdmin")
public class CustomerController {
	@Autowired
	private ICustomerService customerService;
	
	@Autowired
	private IBookingService bookingService;
	
	@GetMapping(value = "/quan-tri/khach-hang")
	public ModelAndView customerPage(
			@RequestParam(value = "cmnd", required = false) String cmnd,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "limit", required = false) Integer limit) {
		ModelAndView mav = new ModelAndView();
		CustomerDTO dto = new CustomerDTO();
		if (cmnd==null) {
			Pageable pageable = new PageRequest(page-1, limit);          
			 
	        dto.setListResult(customerService.findAll(pageable));
	        
	        dto.setLimit(limit);
	        dto.setPage(page);
	        dto.setTotalPage((int) Math.round((double) customerService.count() / dto.getLimit()));
	        dto.setTotalItem(dto.getListResult().size());
	        mav.setViewName("admin/customer/list-customer");
		}else {
			
			List<BookingDTO> bookingDTOs = bookingService.findByBookedRoomsCustomersCmnd(cmnd);
			
			mav.addObject("bookings", bookingDTOs);
			mav.addObject("cmnd", cmnd);
			mav.setViewName("admin/customer/customer-activity");
		}
		mav.addObject("model", dto);
		return mav;
	}
	
	
}
