package com.chondo.api.admin;

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
public class RoomTypeAPI {
	
	@Autowired
	private RoomTypeService roomTypeService;
	
	
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

