package com.chondo.controller.web;

import java.io.UnsupportedEncodingException;
import java.util.Base64;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.controller.web.request.SignatureRequest;
import com.chondo.dto.BookingDTO;
import com.chondo.service.IBookingService;
import com.chondo.util.DigitalSignature;
import com.chondo.util.HashAlgorithm;
import com.chondo.util.SendMailUtil;

@RestController("verifyAPI")
public class VerifyKeyController {

	@Autowired
	private IBookingService bookingService;

	@GetMapping("/kydonhang")
	public ModelAndView verifyPage(@RequestParam(required = false) String code) {
		ModelAndView mav = new ModelAndView("web/verify-key");

		BookingDTO booking = bookingService.findOneByCode(code);
		System.out.println(booking.toStringBooking());
		String hash = HashAlgorithm.doHashHex(booking.toStringBooking());
		System.out.println(hash);
		
		mav.addObject("code", code);

		return mav;
	}

	@PostMapping("/api/verify")
	public String verify(@RequestBody SignatureRequest signRq) throws UnsupportedEncodingException, MessagingException {

		System.out.println(signRq.toString());

		String code = signRq.getCode();
		String signature = signRq.getSignature();
		String publickey = signRq.getPublickey();

		BookingDTO booking = bookingService.findOneByCode(code);
		String hash = HashAlgorithm.doHashHex(booking.getInfo());
		
		
		boolean verify = DigitalSignature.verifyBase64(hash, signature, publickey);
		
		if(verify) {
			booking.setSigned(1);
		}else {
			booking.setSigned(2);
		}
		booking = bookingService.sign(booking);
		
		if(verify) {
			String bookingInfo = booking.toStringBooking();
			SendMailUtil.sendOrder(booking.getCustomer().getEmail(), booking, bookingInfo);
		}

		return "" + verify;
	}
}
