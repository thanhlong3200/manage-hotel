//package com.chondo.api.web;
//
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.PageRequest;
//import org.springframework.data.domain.Pageable;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.chondo.dto.HotelDTO;
//import com.chondo.dto.RoomTypeDTO;
//import com.chondo.dto.SearchDTO;
//import com.chondo.service.IFurnitureService;
//import com.chondo.service.IHotelService;
//import com.chondo.service.IRateService;
//import com.chondo.service.IRoomTypeService;
//import com.chondo.service.IServiceService;
//
//@RestController(value = "roomAPI")
//public class RoomAPI {
//	@Autowired
//	private IHotelService hotelService;
//	
//	@Autowired 
//	private IRoomTypeService roomTypeService; 
//	
//	@Autowired
//	private IFurnitureService furnitureService;
//	
//	@Autowired 
//	private IRateService rateService;
//	
//	@Autowired
//	private IServiceService service;
//	@GetMapping(value = "/xem-phong")
//	public ModelAndView roomDetailsPage(
//			@RequestParam("dateFrom") String dateFromStr,
//			@RequestParam("dateTo") String dateToStr,
//			@RequestParam("adult") Integer adult,
//			@RequestParam("children") Integer children,
//			@RequestParam("roomCount") Integer roomCount,
//			@RequestParam("location") String location,
//			@RequestParam("page") Integer page,
//			@RequestParam("limit") Integer limit,
//			@RequestParam("roomTypeId") Long roomTypeId) throws ParseException {
//		ModelAndView mav = new ModelAndView("web/searchRoom"); 		
//		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
//        Date dateFrom = format.parse(dateFromStr);
//        Date dateTo = format.parse(dateToStr);
//       
//        HotelDTO hotel = hotelService.findOneByLocation(location);
//        
//        Integer capacity = (int) Math.round((adult + (double) children/2)/roomCount);
//        Pageable pageable = new PageRequest(page-1, limit);
//        List<RoomTypeDTO> list = roomTypeService.findAvailable(hotel.getId(), roomCount, capacity, dateFrom, dateTo,pageable);
//        Pageable pageable_all = new PageRequest(0, 1000);
//        List<RoomTypeDTO> listAll = roomTypeService.findAvailable(hotel.getId(), roomCount, capacity, dateFrom, dateTo,pageable_all);
//       
//        RoomTypeDTO dto = new RoomTypeDTO();
//        furnitureService.setFurnitures(list);
//        service.setServices(list);
//        rateService.setRates(list);
//        dto.setListResult(list);
//       
//        SearchDTO search = new SearchDTO(dateFromStr, dateToStr, adult, children, roomCount, location);
//        search.setLimit(limit);
//        search.setPage(page);
//        search.setTotalPage((int) Math.round((double) listAll.size() / search.getLimit()));
//        search.setTotalItem(listAll.size());
//        
//        mav.addObject("model", dto);
//        mav.addObject("search", search);
//        return mav;
//		
//		
//		
//		
//		
//		
//		
//		
//		
//		return null;
//	}
//}
