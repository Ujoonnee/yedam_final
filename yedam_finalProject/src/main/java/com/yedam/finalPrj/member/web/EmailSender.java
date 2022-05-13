package com.yedam.finalPrj.member.web;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

import com.yedam.finalPrj.member.service.MemberEmail;

public class EmailSender {
	
	@Autowired protected JavaMailSender mailSender;
	
	public void SendEamil(MemberEmail email) throws Exception{
		
		MimeMessage msg = mailSender.createMimeMessage();
		try {
			msg.setSubject(email.getSubject());
			msg.setText(email.getContent());
			msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email.getReceiver()));
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		try {
			mailSender.send(msg);
		} catch (MailException e) {
			e.printStackTrace();
		}
	}
}
