package com.chondo.api.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.UserDTO;

@RestController(value = "searchAPI")
public class SearchAPI {
	
	@GetMapping(value = "/tim-kiem")
	public ModelAndView updatePage(@RequestParam("id") Long id) {
		ModelAndView mav = new ModelAndView("web/search");
		return mav;
	}

}
