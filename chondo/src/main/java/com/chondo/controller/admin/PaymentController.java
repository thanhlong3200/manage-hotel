package com.chondo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.BookingDTO;
import com.chondo.dto.PaymentDTO;
import com.chondo.dto.PaymentStatusDTO;
import com.chondo.dto.PaymentTypeDTO;
import com.chondo.dto.UpgradeDTO;
import com.chondo.service.IBookingService;
import com.chondo.service.IPaymentService;
import com.chondo.service.IPaymentTypeService;
import com.chondo.service.IUpgradeService;

@Controller(value = "paymentControllerAdmin")
public class PaymentController {

	
}
