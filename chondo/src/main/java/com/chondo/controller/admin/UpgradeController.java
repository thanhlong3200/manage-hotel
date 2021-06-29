package com.chondo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.BookingDTO;
import com.chondo.dto.RoomTypeDTO;
import com.chondo.service.IBookingService;
import com.chondo.service.IRoomTypeService;

@Controller(value = "upgradeControllerAdmin")
public class UpgradeController {


	@Autowired
	private IRoomTypeService roomTypeService;

	@Autowired
	private IBookingService bookingService;

	@RequestMapping(value = "/quan-tri/nang-cap-booking", method = RequestMethod.GET)
	public ModelAndView changeRoomPage(@RequestParam(value = "bookingCode", required = false) String code) {
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
}
