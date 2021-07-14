package com.chondo.controller.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.HotelDTO;
import com.chondo.dto.RoomDTO;
import com.chondo.dto.RoomStatusDTO;
import com.chondo.dto.RoomTypeDTO;
import com.chondo.dto.SearchDTO;
import com.chondo.service.IFurnitureService;
import com.chondo.service.IHotelService;
import com.chondo.service.IImageService;
import com.chondo.service.IRateService;
import com.chondo.service.IRoomService;
import com.chondo.service.IRoomStatusService;
import com.chondo.service.IRoomTypeService;
import com.chondo.service.IServiceService;
import com.chondo.service.impl.RoomService;

@Controller(value = "searchControllerAdmin")
public class SearchController {

	@Autowired
	private IHotelService hotelService;

	@Autowired
	private IRoomTypeService roomTypeService;
	
	@Autowired
	private IRoomStatusService roomStatusService;
	
	@Autowired
	private IRoomService roomService;

	@Autowired
	private IRateService rateService;


	@RequestMapping(value = { "/quan-tri/tim-kiem" }, method = RequestMethod.GET)
	public ModelAndView searchPage(@RequestParam("dateFrom") String dateFromStr,
			@RequestParam("dateTo") String dateToStr, @RequestParam("adult") Integer adult,
			@RequestParam("children") Integer children, @RequestParam("roomCount") Integer roomCount,
			@RequestParam("location") String location, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "limit", required = false) Integer limit,
			@RequestParam(value = "roomTypeId", required = false) Long roomTypeId, HttpServletRequest request)
			throws ParseException {
		ModelAndView mav = new ModelAndView("admin/booking/searchRoom");

		SearchDTO search = new SearchDTO(dateFromStr, dateToStr, adult, children, roomCount, location);
		List<RoomTypeDTO> list = new ArrayList<RoomTypeDTO>();

		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		Date dateFrom = format.parse(dateFromStr);
		Date dateTo = format.parse(dateToStr);
		HotelDTO hotel = hotelService.findOneByLocation(location);

		Integer capacity = (int) Math.round((adult + (double) children / 2) / roomCount);
		Pageable pageable = new PageRequest(page - 1, limit);
		list = roomTypeService.findAvailable(hotel.getId(), roomCount, capacity, dateFrom, dateTo, pageable);
		Pageable pageable_all = new PageRequest(0, 1000);
		List<RoomTypeDTO> listAll = roomTypeService.findAvailable(hotel.getId(), roomCount, capacity, dateFrom, dateTo,
				pageable_all);

		search.setLimit(limit);
		search.setPage(page);
		search.setTotalPage((int) Math.round((double) listAll.size() / search.getLimit()));
		search.setTotalItem(listAll.size());

		RoomTypeDTO dto = new RoomTypeDTO();
		rateService.setRates(list);
		dto.setListResult(list);

		mav.addObject("model", dto);
		mav.addObject("search", search);

		return mav;
	}

	@RequestMapping(value = { "/quan-tri/tim-kiem/phong-trong" }, method = RequestMethod.GET)
	public ModelAndView availableRoomPage(@RequestParam("dateFrom") String dateFromStr,
			@RequestParam("dateTo") String dateToStr, @RequestParam("adult") Integer adult,
			@RequestParam("children") Integer children, @RequestParam("roomCount") Integer roomCount,
			@RequestParam("location") String location, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "roomTypeId", required = false) Long roomTypeId, HttpServletRequest request)
			throws ParseException {
		ModelAndView mav = new ModelAndView();
		
		if (roomTypeId != null) {
			SearchDTO search = new SearchDTO(dateFromStr, dateToStr, adult, children, roomCount, location);
			List<RoomTypeDTO> list = new ArrayList<RoomTypeDTO>();
			
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			Date dateFrom = format.parse(dateFromStr);
			Date dateTo = format.parse(dateToStr);
			
			HotelDTO hotel = hotelService.findOneByLocation(location);
			
			List<RoomDTO> availableRoom = roomService.findAvailable(hotel.getId(), roomTypeId, dateFrom, dateTo);
			
			List<RoomDTO> allRoom = roomService.findByRoomTypeId(roomTypeId);
			
			List<RoomStatusDTO> listStatus = roomStatusService.findByActive(1);
			
			RoomTypeDTO roomtype = roomTypeService.findOneById(roomTypeId);
			
			rateService.setRates(roomtype);
			
			format = new SimpleDateFormat("yyyy-MM-dd");
			String dateFromBooking = format.format(dateFrom);
			String dateToBooking = format.format(dateTo);
			mav.addObject("dateFromBooking", dateFromBooking);
			mav.addObject("dateToBooking", dateToBooking);
			
			mav.addObject("listStatus", listStatus);
			mav.addObject("allRoom", allRoom);
			mav.addObject("availableRoom", availableRoom);
			mav.addObject("search", search);
			mav.addObject("roomType", roomtype);
			mav.setViewName("admin/booking/roomAvailable");
		}

		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/tim-phong", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("admin/booking/formSearch");
		return mav;
	}
}
