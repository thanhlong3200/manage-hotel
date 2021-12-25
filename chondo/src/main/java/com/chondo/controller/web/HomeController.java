	package com.chondo.controller.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController(value = "homeAPI")
public class HomeController {
	
	@GetMapping(value = "/trang-chu")
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("web/home");
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
