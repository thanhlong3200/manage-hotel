package com.chondo.api.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.HotelDTO;
import com.chondo.dto.RoomTypeDTO;
import com.chondo.dto.SearchDTO;
import com.chondo.service.IFurnitureService;
import com.chondo.service.IHotelService;
import com.chondo.service.IRateService;
import com.chondo.service.IRoomTypeService;

@RestController(value = "searchAPI")
public class SearchAPI {
	
	@Autowired
	private IHotelService hotelService;
	
	@Autowired 
	private IRoomTypeService service; 
	
	@Autowired
	private IFurnitureService furnitureService;
	
	@Autowired 
	private IRateService rateService;

	@GetMapping(value = "/tim-kiem")
	public ModelAndView searchPage(
			@RequestParam("dateFrom") String dateFromStr,
			@RequestParam("dateTo") String dateToStr,
			@RequestParam("adult") Integer adult,
			@RequestParam("children") Integer children,
			@RequestParam("roomCount") Integer roomCount,
			@RequestParam("location") String location,
			@RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) throws ParseException {
		ModelAndView mav = new ModelAndView("web/searchRoom"); 		
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        Date dateFrom = format.parse(dateFromStr);
        Date dateTo = format.parse(dateToStr);
        HotelDTO hotel = hotelService.findOneByLocation(location);
        Integer capacity = (int) Math.floor(((adult + children/2)/roomCount));
        Pageable pageable = new PageRequest(page-1, limit);
        List<RoomTypeDTO> list = service.findAvailable(hotel.getId(), roomCount, capacity, dateFrom, dateTo,pageable);
        Pageable pageable_all = new PageRequest(0, 1000);
        List<RoomTypeDTO> listAll = service.findAvailable(hotel.getId(), roomCount, capacity, dateFrom, dateTo,pageable_all);
        RoomTypeDTO dto = new RoomTypeDTO();
        dto.setListResult(list);
        furnitureService.setFurnitures(list);
        rateService.setRates(list);
        SearchDTO search = new SearchDTO(dateFromStr, dateToStr, adult, children, roomCount, location);
        search.setLimit(limit);
        search.setPage(page);
        search.setTotalPage((int) Math.round((double) listAll.size() / search.getLimit()));
        search.setTotalItem(listAll.size());
        mav.addObject("model", dto);
        mav.addObject("search", search);
        return mav;
	}

}
