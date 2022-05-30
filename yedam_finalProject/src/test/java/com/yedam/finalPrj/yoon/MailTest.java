package com.yedam.finalPrj.yoon;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.finalPrj.common.MailSender;

@RunWith(SpringJUnit4ClassRunner.class)
public class MailTest {
	
	
	MailSender sender = new MailSender();

	@Test
	public void congMailTest() {
		sender.authenticationSend("dbstjdghks221@gmail.com");
	}

}
