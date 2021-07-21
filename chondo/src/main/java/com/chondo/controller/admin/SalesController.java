package com.chondo.controller.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.BookedServiceDTO;
import com.chondo.dto.PaymentDTO;
import com.chondo.dto.RoomTypeDTO;
import com.chondo.service.IBookedServiceService;
import com.chondo.service.IBookingService;
import com.chondo.service.IPaymentService;

@Controller(value = "salesController")
public class SalesController {
	
	@Autowired
	private IPaymentService paymentService;
	
	@Autowired
	private IBookingService bookingService;
	
	@Autowired
	private IBookedServiceService bookedServiceService;
	
	@GetMapping(value = {"/quan-tri/doanh-so/hoa-don","/quan-tri/doanh-so/tien-phong"})
	public ModelAndView salesPaymentPage(@RequestParam(value = "dateFrom", required = false) String dateFromStr,
			@RequestParam(value = "dateTo", required = false) String dateToStr,
			HttpServletRequest request) throws ParseException {
		ModelAndView mav = new ModelAndView("admin/sales/salesPayment");
		
		String url =  request.getServletPath();
		if (url.equalsIgnoreCase("/quan-tri/doanh-so/tien-phong")) {
			mav.setViewName("admin/sales/salesRoom");
		}
		
		Date dateFrom =null;
		Date dateTo=null;
		List<PaymentDTO> paymentDTOs = new ArrayList<PaymentDTO>();
		if (dateFromStr != null && dateToStr !=null) {
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			dateFrom = format.parse(dateFromStr);
			dateTo = format.parse(dateToStr);
			paymentDTOs = paymentService.findByRangeDate(dateFrom,dateTo);
			
			mav.addObject("dateFrom", dateFromStr);
			mav.addObject("dateTo", dateToStr);
		}else {
			paymentDTOs = paymentService.findAll();
		}
		
		PaymentDTO totalDTO = new PaymentDTO();
		setPrice(totalDTO,paymentDTOs);
		
		
		
		mav.addObject("total", totalDTO);
    	mav.addObject("model", paymentDTOs);
		
		return mav;
	}
	
	private void setPrice(PaymentDTO totalDTO, List<PaymentDTO> paymentDTOs) {
		Long totalPriceBooked = 0L;
		Long totalPriceService = 0L;
		Long totalSales = 0L;
		Long totalRefund = 0L;
		for (PaymentDTO paymentDTO : paymentDTOs) {
			bookingService.setPrice(paymentDTO.getBooking());
			totalPriceBooked += paymentDTO.getBooking().getSellPriceBooked();
			totalPriceService += paymentDTO.getBooking().getPriceService();
			totalSales += paymentDTO.getBooking().getTotalPrice();
			if (paymentDTO.getBooking().isRefund()) {
				totalRefund += paymentDTO.getBooking().getTotalPrice()/2;
			}
		}
		
		totalDTO.setTotalPriceBooked(totalPriceBooked);
		totalDTO.setTotalPriceService(totalPriceService);
		totalDTO.setTotalSales(totalSales);
		totalDTO.setTotalRefund(totalRefund);
	}

	@GetMapping(value = "/quan-tri/doanh-so/dich-vu")
	public ModelAndView salesServicePage(@RequestParam(value = "dateFrom", required = false) String dateFromStr,
			@RequestParam(value = "dateTo", required = false) String dateToStr) throws ParseException {
		ModelAndView mav = new ModelAndView("admin/sales/salesService");
		
		Date dateFrom =null;
		Date dateTo=null;
		List<BookedServiceDTO> bookedServiceDTOs = new ArrayList<BookedServiceDTO>();
		if (dateFromStr != null && dateToStr !=null) {
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			dateFrom = format.parse(dateFromStr);
			dateTo = format.parse(dateToStr);
			bookedServiceDTOs = bookedServiceService.findByRangeDate(dateFrom,dateTo,"checkout");
			
			mav.addObject("dateFrom", dateFromStr);
			mav.addObject("dateTo", dateToStr);
		}else {
			bookedServiceDTOs = bookedServiceService.getAllService("checkout");
		}
		
		
		
		PaymentDTO totalDTO = new PaymentDTO();

		Long totalPriceService = 0L;
		Long totalPriceServiceFree = 0L;
		
		for (BookedServiceDTO bookedServiceDTO : bookedServiceDTOs) {
			if (bookedServiceDTO.getFree()==1) {
				totalPriceServiceFree += bookedServiceDTO.getService().getPrice();
			}else {
				totalPriceService += bookedServiceDTO.getService().getPrice();
			}
		}
		
		totalDTO.setTotalPriceService(totalPriceService);
		totalDTO.setTotalPriceServiceFree(totalPriceServiceFree);		
		
		mav.addObject("total", totalDTO);
		
    	mav.addObject("model", bookedServiceDTOs);
		
		return mav;
	}
}
