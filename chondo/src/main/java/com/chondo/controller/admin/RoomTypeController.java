package com.chondo.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.BookingDTO;
import com.chondo.dto.CustomerDTO;
import com.chondo.dto.HotelDTO;
import com.chondo.dto.RoomTypeDTO;
import com.chondo.service.IFurnitureService;
import com.chondo.service.IHotelService;
import com.chondo.service.IImageService;
import com.chondo.service.IRateService;
import com.chondo.service.IRoomTypeService;
import com.chondo.service.IServiceService;
import com.chondo.service.impl.RoomTypeService;

@RestController(value = "roomTypeAPI")
public class RoomTypeController {
	
	@Autowired
	private RoomTypeService roomTypeService;

	@Autowired 
	private IRateService rateService;

	@Autowired
	private IImageService imageService;
	
	@GetMapping(value = "/quan-tri/loai-phong/danh-sach")
	public ModelAndView roomTypePage(
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "limit", required = false) Integer limit,
			@RequestParam(value = "roomTypeId", required = false) Long roomTypeId) {
		ModelAndView mav = new ModelAndView("admin/room/list-room-type");
		
		RoomTypeDTO dto = new RoomTypeDTO();
		
		if (roomTypeId == null) {
			Pageable pageable = new PageRequest(page-1, limit);          
		 
	        dto.setListResult(roomTypeService.findByStatus(1,pageable));
	        rateService.setRates(dto.getListResult());
	        
	        dto.setLimit(limit);
	        dto.setPage(page);
	        dto.setTotalPage((int) Math.round((double) roomTypeService.countByStatus(1) / dto.getLimit()));
	        dto.setTotalItem(dto.getListResult().size());
		}else {
			RoomTypeDTO viewRoom = roomTypeService.findOneById(roomTypeId);
	    	List<RoomTypeDTO> list = new ArrayList<RoomTypeDTO>();
	    	list.add(viewRoom);
	    	imageService.setImages(list);
	    	dto.setListResult(list);
	    	 rateService.setRates(dto.getListResult());
	    	mav.setViewName("admin/room/room-type-details");
		}
    	
		mav.addObject("model", dto);
        
		return mav;
	}
	
	@GetMapping(value = "/quan-tri/loai-phong/chinh-sua")
	public ModelAndView editRoomTypePage(@RequestParam(value = "roomTypeId", required = false) Long roomTypeId) {
		ModelAndView mav = new ModelAndView("admin/room/edit-room-type");
		RoomTypeDTO dto = new RoomTypeDTO();
		if (roomTypeId != null) {
			dto = roomTypeService.findOneById(roomTypeId);
		}
    	mav.addObject("model", dto);
		
		return mav;
	}

	
	
	@PostMapping(value = "/api/roomType")
	@Transactional
	public RoomTypeDTO save(@RequestBody RoomTypeDTO dto){
		return roomTypeService.save(dto);
	}
	
	@PutMapping(value = "/api/roomType")
	@Transactional
	public RoomTypeDTO update(@RequestBody RoomTypeDTO dto){
		return roomTypeService.save(dto);
	}
	
	
}

