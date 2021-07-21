package com.chondo.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.RateDTO;
import com.chondo.dto.RoomTypeDTO;
import com.chondo.service.IRateService;
import com.chondo.service.IRoomTypeService;

@Controller(value = "rateController")
public class RateController {
	@Autowired
	private IRoomTypeService roomTypeService;
	
	@Autowired
	private IRateService rateService;
	
	@RequestMapping(value = {"/quan-tri/danh-gia"}, method = RequestMethod.GET)
	public ModelAndView ratePage
			(@RequestParam(value = "roomTypeId", required = false) Long roomTypeId) {
		ModelAndView mav = new ModelAndView();	
	
	    List<RateDTO> listResult = new ArrayList<RateDTO>();
		
		if (roomTypeId!=null) {
			RoomTypeDTO roomtype = roomTypeService.findOneById(roomTypeId);
			rateService.setRates(roomtype);
			listResult = roomtype.getRates();
			
			mav.addObject("type", roomtype);
		}else {			
			listResult = rateService.findAll();				
		}
		List<RoomTypeDTO> roomTypes = roomTypeService.findAll();
		
		
		mav.addObject("listResult", listResult);
		mav.addObject("roomTypes", roomTypes);
		
		mav.setViewName("admin/rate/list-rate");
		return mav;
	}
	@RequestMapping(value = {"/quan-tri/them-danh-gia"}, method = RequestMethod.GET)
	public ModelAndView addRate
			(@RequestParam(value = "roomTypeId", required = false) Long roomTypeId,
			@RequestParam(value = "bookingId", required = false) Long bookingId) {
		ModelAndView mav = new ModelAndView("admin/rate/add-rate");	
		mav.addObject("bookingId", bookingId);
		mav.addObject("roomTypeId", roomTypeId);
		return mav;
	}
	
	@PostMapping(value = "/api/rate")
	@Transactional
	public RateDTO save(@RequestBody RateDTO dto){
		return rateService.save(dto);
	}
}
