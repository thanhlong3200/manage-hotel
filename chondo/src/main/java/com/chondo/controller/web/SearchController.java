package com.chondo.controller.web;

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
import com.chondo.dto.RoomTypeDTO;
import com.chondo.dto.SearchDTO;
import com.chondo.service.IHotelService;
import com.chondo.service.IImageService;
import com.chondo.service.IRateService;
import com.chondo.service.IRoomTypeService;

@Controller(value = "searchController")
public class SearchController {

	@Autowired
	private IHotelService hotelService;

	@Autowired
	private IRoomTypeService roomTypeService;

	@Autowired
	private IRateService rateService;

	@Autowired
	private IImageService imageService;

	@RequestMapping(value = { "/tim-kiem", "/dat-phong"}, method = RequestMethod.GET)
	public ModelAndView searchPage(@RequestParam("dateFrom") String dateFromStr,
			@RequestParam("dateTo") String dateToStr, @RequestParam("adult") Integer adult,
			@RequestParam("children") Integer children, @RequestParam("roomCount") Integer roomCount,
			@RequestParam("location") String location, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "limit", required = false) Integer limit,
			@RequestParam(value = "roomTypeId", required = false) Long roomTypeId, HttpServletRequest request)
			throws ParseException {
		ModelAndView mav = new ModelAndView();
		String url = request.getServletPath();

		SearchDTO search = new SearchDTO(dateFromStr, dateToStr, adult, children, roomCount, location);
		List<RoomTypeDTO> list = new ArrayList<RoomTypeDTO>();

		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		Date dateFrom = format.parse(dateFromStr);
		Date dateTo = format.parse(dateToStr);
		if (roomTypeId == null && url.equalsIgnoreCase("/tim-kiem")) {

			HotelDTO hotel = hotelService.findOneByLocation(location);

			Integer capacity = (int) Math.round((adult + (double) children / 2) / roomCount);
			Pageable pageable = new PageRequest(page - 1, limit);
			list = roomTypeService.findAvailable(hotel.getId(), roomCount, capacity, dateFrom, dateTo, pageable);
			Pageable pageable_all = new PageRequest(0, 1000);
			List<RoomTypeDTO> listAll = roomTypeService.findAvailable(hotel.getId(), roomCount, capacity, dateFrom,
					dateTo, pageable_all);

			search.setLimit(limit);
			search.setPage(page);
			search.setTotalPage((int) Math.round((double) listAll.size() / search.getLimit()));
			search.setTotalItem(listAll.size());

			mav.setViewName("web/searchRoom");
		} else {
			RoomTypeDTO viewRoom = roomTypeService.findOneById(roomTypeId);
			list.clear();
			list.add(viewRoom);
			imageService.setImages(list);
			mav.setViewName("web/room-details");
		}

		RoomTypeDTO dto = new RoomTypeDTO();
		rateService.setRates(list);
		dto.setListResult(list);

		if (url.equalsIgnoreCase("/dat-phong")) {
			mav.setViewName("web/bookingRoom");
			format = new SimpleDateFormat("yyyy-MM-dd");
			String dateFromBooking = format.format(dateFrom);
			String dateToBooking = format.format(dateTo);
			mav.addObject("dateFromBooking", dateFromBooking);
			mav.addObject("dateToBooking", dateToBooking);
		}


		mav.addObject("model", dto);
		mav.addObject("search", search);

		return mav;
	}

}
