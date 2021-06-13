package com.chondo.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.UserDTO;
import com.chondo.repository.UserRepository;

@Controller(value = "register")
public class RegisterController {
	 
	@RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
	public ModelAndView registerPage() {
		ModelAndView mav = new ModelAndView("web/register");
		UserDTO userDTO = new UserDTO();
		mav.addObject("model", userDTO);
		return mav;
	}
	
}


