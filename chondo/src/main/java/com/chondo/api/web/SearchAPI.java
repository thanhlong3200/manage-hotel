package com.chondo.api.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.HotelDTO;
import com.chondo.dto.RoomTypeDTO;
import com.chondo.entity.HotelEntity;
import com.chondo.entity.RoomEntity;
import com.chondo.entity.RoomTypeEntity;
import com.chondo.repository.RoomRepository;
import com.chondo.repository.RoomTypeRepository;
import com.chondo.service.IHotelService;
import com.chondo.service.impl.RoomTypeService;

@RestController(value = "searchAPI")
public class SearchAPI {
	
	@Autowired
	private IHotelService hotelService;
	
	@Autowired
	private RoomRepository roomRepository;
	
	@Autowired
	private RoomTypeRepository roomTypeRepository;
	
	@Autowired 
	private RoomTypeService service; 
	
	

	@GetMapping(value = "/tim-kiem")
	public ModelAndView searchPage(
			@RequestParam("dateFrom") String dateFromStr,
			@RequestParam("dateTo") String dateToStr,
			@RequestParam("adult") Integer adult,
			@RequestParam("children") Integer children,
			@RequestParam("roomCount") Integer roomCount,
			@RequestParam("location") String location) throws ParseException {
		ModelAndView mav = new ModelAndView("web/searchRoom"); 		
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        Date dateFrom = format.parse(dateFromStr);
        Date dateTo = format.parse(dateToStr);
//        java.sql.Date dateFrom = new java.sql.Date(parsed.getTime());
        HotelDTO hotel = hotelService.findOneByLocation(location);
        Integer capacity = (int) Math.floor(((adult + children/2)/roomCount));
        List<RoomTypeDTO> list = service.findAvailable(hotel.getId(), roomCount, capacity, dateFrom, dateTo);
        return mav;
	}

}
