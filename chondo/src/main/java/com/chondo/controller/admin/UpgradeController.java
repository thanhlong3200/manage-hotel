package com.chondo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.BookingDTO;
import com.chondo.dto.RoomTypeDTO;
import com.chondo.dto.UpgradeDTO;
import com.chondo.service.IBookingService;
import com.chondo.service.IRoomTypeService;
import com.chondo.service.IUpgradeService;

@RestController(value = "upgradeAPI")
public class UpgradeController {
	
	@Autowired
	private IUpgradeService upgradeService;
	
	@Autowired
	private IRoomTypeService roomTypeService;

	@Autowired
	private IBookingService bookingService;

	@GetMapping(value = "/quan-tri/nang-cap-booking")
	public ModelAndView upgradePage(@RequestParam(value = "bookingCode", required = false) String code) {
		ModelAndView mav = new ModelAndView("admin/booking/upgradeBooking");
		if (code != null) {
			BookingDTO booking = bookingService.findOneByCode(code);

			if (booking != null) {
				List<RoomTypeDTO> roomTypes = roomTypeService.findAvailableUpgrade(booking);
				
				
				mav.addObject("roomTypes", roomTypes);
				mav.addObject("booking", booking);
				mav.addObject("code", code);
			}else {
				mav.addObject("error", "Không tìm thấy mã booking này !");
			}
			
		}

		return mav;
	}
	
	@PostMapping(value = "/api/upgrade")
	@Transactional
	public UpgradeDTO upgrade(@RequestBody UpgradeDTO dto){	
		
		upgradeService.upgrade(dto);
		
		return dto;
	}
	
}
