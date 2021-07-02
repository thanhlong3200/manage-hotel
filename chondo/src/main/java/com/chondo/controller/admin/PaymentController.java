package com.chondo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.BookingDTO;
import com.chondo.dto.PaymentDTO;
import com.chondo.dto.PaymentStatusDTO;
import com.chondo.dto.PaymentTypeDTO;
import com.chondo.dto.UpgradeDTO;
import com.chondo.service.IBookingService;
import com.chondo.service.IPaymentService;
import com.chondo.service.IPaymentTypeService;
import com.chondo.service.IUpgradeService;

@Controller(value = "paymentControllerAdmin")
public class PaymentController {


	@Autowired
	private IBookingService bookingService;
	
	@Autowired
	private IUpgradeService upgradeService;
	
	@Autowired
	private IPaymentTypeService paymentTypeService;
	
	@Autowired
	private IPaymentService paymnetService;

	@RequestMapping(value = "/quan-tri/thanh-toan", method = RequestMethod.GET)
	public ModelAndView changeRoomPage(@RequestParam("code") String code) {
		ModelAndView mav = new ModelAndView("admin/booking/paymentDetails");
			
		BookingDTO booking = bookingService.findOneByCode(code);
		
		bookingService.setPrice(booking);
		
		UpgradeDTO upgradeDTO = upgradeService.findOneByBookingId(booking.getId());
		if (upgradeDTO!=null) {
			mav.addObject("upgrade", upgradeDTO);
		}
		if (booking.getStatus().getCode().equalsIgnoreCase("checkout")) {
			PaymentDTO payment = paymnetService.findOneByBookingId(booking.getId());
			mav.addObject("payment", payment);
		}else {
			List<PaymentTypeDTO> types = paymentTypeService.findByActive(1);
			
			mav.addObject("types", types);
		}
		
		mav.addObject("booking", booking);
		
			
		

		return mav;
	}
}
