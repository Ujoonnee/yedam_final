package com.yedam.finalPrj.common;

import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;

@Component
public class EmailSender {

	@Autowired JavaMailSender mailSender;
	
	//랜덤 값 생성을 위한 Random
	Random random = new Random();

	public void sendCongratulationMail(String email) {
		SimpleMailMessage message = new SimpleMailMessage();

		message.setSubject("회원가입을 진심으로 축하합니다.");
		message.setText("환영합니다!!");
		message.setFrom("DaeAkin");
		message.setTo(email);

		
		mailSender.send(message);
	}

	public void authenticationSend(final String email, Map<String,String> map) {
		MimeMessagePreparator mimeMessagePreparator = new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage paramMimeMessage) throws Exception {
				MimeMessageHelper message = new MimeMessageHelper(paramMimeMessage, true, "UTF-8");

				message.setTo(email);
				message.setFrom("Yedam4TeamFinal");
				message.setSubject("회원가입 인증 메일입니다.");

				String content = "<h1><strong>"+ map.get("name") +"</strong> 님 안녕하세요!</h1>\r\n"
						+ "<h3>아래 링크를 클릭해 회원가입을 완료하세요.</h3>\r\n"
						+ "<p>&nbsp;</p>\r\n"
						+ "<p><a href=\"http://localhost:80/finalPrj/member/confirm?applicationNo="+ map.get("applicationNo") +"\">회원가입 완료</a></p>";

				//true로 해줘야 HTML을 사용한다고 알림! 
				message.setText(content, true);

			}
				
		};
		mailSender.send(mimeMessagePreparator);
	}

}
