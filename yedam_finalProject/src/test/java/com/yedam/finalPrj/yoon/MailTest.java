package com.yedam.finalPrj.yoon;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.finalPrj.email.service.CongratulationMailSender;

@RunWith(SpringJUnit4ClassRunner.class)
public class MailTest {
	
	@Autowired
	CongratulationMailSender sender;

	private JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
	@Test
	public void congMailTest() {
		sender.authenticationSend("dbstjdghks221@gmail.com");
	}

}
