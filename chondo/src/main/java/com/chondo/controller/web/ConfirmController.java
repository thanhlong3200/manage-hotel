package com.chondo.controller.web;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.chondo.dto.UserDTO;
import com.chondo.util.SendMailUtil;

@RestController(value = "confirmAPI")
public class ConfirmController {
	
	@PostMapping(value = "/api/sendCode")
	public String sendCode (@RequestBody UserDTO dto) throws UnsupportedEncodingException, MessagingException {
		return SendMailUtil.sendCode(dto.getEmail());
	}
}
