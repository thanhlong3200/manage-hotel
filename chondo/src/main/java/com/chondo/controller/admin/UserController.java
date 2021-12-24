package com.chondo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.RoomTypeDTO;
import com.chondo.dto.UserDTO;
import com.chondo.response.MessageResponse;
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
	
	@GetMapping(value = "/thay-doi-thong-tin")
	public ModelAndView updatePage(@RequestParam("id") Long id) {
		ModelAndView mav = new ModelAndView("web/change-information");
		UserDTO userDTO = userService.findOne(id);
		mav.addObject("model", userDTO);
		return mav;
	}
	
	@GetMapping(value = "/thay-doi-mat-khau")
	public ModelAndView updatePasswordPage(@RequestParam("id") Long id) {
		ModelAndView mav = new ModelAndView("web/change-password");
		UserDTO userDTO = userService.findOne(id);
		mav.addObject("model", userDTO);
		return mav;
	}
	
	@GetMapping(value = "/dang-ky")
	public ModelAndView registerPage() {
		ModelAndView mav = new ModelAndView("web/register");
		UserDTO userDTO = new UserDTO();
		mav.addObject("model", userDTO);
		return mav;
	}
		
	
	@PostMapping(value = "/api/user")
	@Transactional
	public ResponseEntity<?> register(@RequestBody UserDTO userDTO) {
		if (userService.existEmail(userDTO.getEmail())) {
			return ResponseEntity.badRequest().body(new MessageResponse("Lá»—i: Email Ä‘Ã£ Ä‘Æ°á»£c Ä‘Äƒng kÃ½!"));
		}
		if (userService.existUsername(userDTO.getUsername())) {
			return ResponseEntity.badRequest().body(new MessageResponse("Lá»—i: Username Ä‘Ã£ Ä‘Æ°á»£c Ä‘Äƒng kÃ½!"));
		}
		userService.save(userDTO);
		return ResponseEntity.ok(new MessageResponse("Ä�Äƒng kÃ½ thÃ nh cÃ´ng!"));
	}
	

	
	@PutMapping(value = "/api/user")
	@Transactional
	public ResponseEntity<?> update(@RequestBody UserDTO userDTO) {
		if (!userService.checkPassword(userDTO.getUsername(), userDTO.getPassword())) {
			return ResponseEntity.badRequest().body(new MessageResponse("Lá»—i: Máº­t kháº©u khÃ´ng Ä‘Ãºng!"));
		}
		
		if (userService.save(userDTO) == null) {
			return ResponseEntity.badRequest().body(new MessageResponse("Lá»—i: Lá»—i há»‡ thá»‘ng!"));
		}
		return ResponseEntity.ok(new MessageResponse("Cáº­p nháº­t thÃ nh cÃ´ng!"));
	}
	
}
