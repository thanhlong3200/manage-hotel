//package com.chondo.controller.web;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.chondo.dto.UserDTO;
//import com.chondo.repository.UserRepository;
//
//@Controller(value = "register")
//public class RegisterController {
//	@Autowired
//	private UserRepository userRepository;
//	 
//	@RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
//	public ModelAndView register() {
//		ModelAndView mav = new ModelAndView("web/register");
//		UserDTO userDTO = new UserDTO();
//		mav.addObject("model", userDTO);
//		return mav;
//	}
//	
//	@RequestMapping(value = "/dang-ky", method = RequestMethod.POST)
//	public ModelAndView checkPassword() {
//		ModelAndView mav = new ModelAndView("web/register");
//		UserDTO userDTO = new UserDTO();
//		if (userRepository.findOneByUsername(userDTO.getUsername()) == null) {
//			mav.addObject("usernameExist", userDTO);
//		}
//		if (userRepository.findOneByUsername(userDTO.getUsername()) == null) {
//			mav.addObject("emailExist", userDTO);
//		}
//
//		return mav;
//	}
//}
//
//
