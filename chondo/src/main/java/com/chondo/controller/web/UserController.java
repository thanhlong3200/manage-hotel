package com.chondo.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.UserDTO;
import com.chondo.service.IUserService;

@Controller(value = "userControllerWeb")
public class UserController {
	@Autowired
	private IUserService userService;
	
	@RequestMapping(value = "/thay-doi-thong-tin", method = RequestMethod.GET)
	public ModelAndView updatePage(@RequestParam("id") Long id) {
		ModelAndView mav = new ModelAndView("web/change-information");
		UserDTO userDTO = userService.findOne(id);
		mav.addObject("model", userDTO);
		return mav;
	}
	
	
}
