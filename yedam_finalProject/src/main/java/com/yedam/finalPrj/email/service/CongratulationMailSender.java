package com.yedam.finalPrj.email.service;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;

@Component
public class CongratulationMailSender {

	
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

	public void authenticationSend(final String email) {
		MimeMessagePreparator mimeMessagePreparator = new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage paramMimeMessage) throws Exception {
				MimeMessageHelper message = new MimeMessageHelper(paramMimeMessage, true, "UTF-8");

				message.setTo(email);
				message.setFrom("Daeakin");
				message.setSubject("회원가입 인증 메일입니다.");

				String content = "<!doctype html> " + "<html lang='ko'> " + " <head>" + "<title>이메일 인증</title>"
						+ "<meta charset=\"utf-8\">\n"
						+ "\n"
						+ "				  </head>\n" + "				  <body>\n"
						+ "				    <div class=\"jumbotron jumbotron-fluid\">\n"
						+ "				  <div align=\"center\" class=\"container\">\n"
						+ "				    <h1 class=\"display-3\">홍제형님</h1><br>\n"
						+ "				    <p class=\"lead\">안녕하세요. <font size=\"5\" color=\"red\"><b>OOOO</b></font> 입니다.\n"
						+ "				        <br>\n" + "				        인증번호는 다음과 같습니다.<br><font size=\"7\"> [ "
						+ random.nextInt(100000) +
						" ] </font>\n" + "				      </p>\n"
						+ "				         <p class=\"lead\">\n"
						+ "				    <a class=\"btn btn-success btn-lg\" href=\"\" role=\"button\">홈페이지 바로가기</a>\n"
						+ "				  </p>\n" + "				  </div>\n" + "				</div>\n" + "\n"
						+ "				  </body>\n" + "				</html>";

				//true로 해줘야 HTML을 사용한다고 알림! 
				message.setText(content, true);

			}
				
		};
		mailSender.send(mimeMessagePreparator);
	}

}
