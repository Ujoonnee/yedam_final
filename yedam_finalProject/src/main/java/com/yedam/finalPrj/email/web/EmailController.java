package com.yedam.finalPrj.email.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.finalPrj.email.service.CongratulationMailSender;

@Controller
public class EmailController {
	
	
	@Autowired CongratulationMailSender sender;
	
	@RequestMapping("/email")
	public String email() {
		sender.authenticationSend("dbstjdghks221@gmail.com");
		
		return "email/email";
	}
}
