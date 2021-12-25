	package com.chondo.controller.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.RoomTypeDTO;
import com.chondo.service.IRoomTypeService;
import com.chondo.service.impl.RoomTypeService;

@RestController(value = "homeAPI")
public class HomeController {
	
	@Autowired
	private IRoomTypeService roomTypeService;
	
	@GetMapping(value = "/trang-chu")
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("web/home");
		List<RoomTypeDTO> listBestSeller = roomTypeService.findBestSeller();
		List<RoomTypeDTO> listRoomType = roomTypeService.findAll();
		mav.addObject("listBestSeller", listBestSeller);
		mav.addObject("listRoomType", listRoomType);
		return mav;
	}

	@GetMapping(value = "/dang-nhap")
	public ModelAndView loginPage() {
		ModelAndView mav = new ModelAndView("web/login");
		return mav;
	}
	
	@GetMapping(value = "/thoat")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/dang-nhap");
	}
	
	@GetMapping(value = "/accessDenied")
	public ModelAndView accessDenied() {
		return new ModelAndView("redirect:/dang-nhap?accessDenied");
	}
	

}
