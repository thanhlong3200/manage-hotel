package com.chondo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.RoomTypeDTO;
import com.chondo.dto.UserDTO;
import com.chondo.service.IUserGroupService;
import com.chondo.service.IUserService;

@Controller(value = "userControllerAdmin")
public class UserController {
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IUserGroupService groupService;
	
	@GetMapping(value = "/quan-tri/nguoi-dung/danh-sach")
	public ModelAndView listUserPage(@RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView();
		if (id == null) {
			List<UserDTO> userDTOs = userService.findByStatus(1);
			
			mav.addObject("listUser",userDTOs);
			mav.setViewName("admin/user/list-user");
		}else {
			UserDTO userDTO = userService.findOne(id);
			
			mav.addObject("user",userDTO);
			mav.setViewName("admin/user/user-details");
		}
		
		
		return mav;
	}
	
	@GetMapping(value = "/quan-tri/nguoi-dung/chinh-sua")
	public ModelAndView editUserPage(@RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView("admin/user/edit-user");
		UserDTO dto = new UserDTO();
		if (id != null) {
			dto = userService.findOne(id);
		}
		
		mav.addObject("groups", groupService.findAll());
    	mav.addObject("model", dto);
		
		return mav;
	}
	
	@GetMapping(value = "/quan-tri/nguoi-dung/them-nguoi-dung")
	public ModelAndView addUserPage() {
		ModelAndView mav = new ModelAndView("admin/user/addUser");
		UserDTO dto = new UserDTO();
	
		mav.addObject("groups", groupService.findAll());
    	mav.addObject("model", dto);
		
		return mav;
	}
}
