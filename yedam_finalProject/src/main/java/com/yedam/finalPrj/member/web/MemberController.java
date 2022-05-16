package com.yedam.finalPrj.member.web;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.finalPrj.member.service.Member;
import com.yedam.finalPrj.member.service.MemberEmail;
import com.yedam.finalPrj.member.service.MemberService;
import com.yedam.finalPrj.member.serviceImpl.MemberServiceImpl;



@Controller
//@RequestMapping("/user/*")
public class MemberController {
	
	// 이홍제
	@Autowired MemberService memberService;
	
	
	// @Autowired private EmailSender emailSender;
	
	@RequestMapping("/memberJoinForm")
	public String memberJoinForm() {
		return "member/memberJoinForm";
	}
	
	
	@PostMapping("/memberJoin.do")
	public String memberJoin(@ModelAttribute("Member") Member vo) {
//		memberService.insert(vo);
		
		return "home/home";
	}
	
	// 이메일 인증
	/*
	 * @RequestMapping("/memberJoinCheck") public void sendEmailAction() throws
	 * Exception{ MemberEmail email = new MemberEmail();
	 * email.setReceiver("dlghdwp2297@gmail.com"); email.setContent("내용");
	 * email.setSubject("제목");
	 * 
	 * emailSender.sendEamil(email);
	 * 
	 * }
	 */
	
	
	/*
	 * public String memberJoinCheck(String email, HttpServletRequest request,
	 * HttpServletResponse response) {
	 * 
	 * //String recipient = request().get
	 * 
	 * final String user = "ydteam4@gmail.com"; final String password = "1q2w3e!!";
	 * 
	 * Properties prop = new Properties(); prop.put("mail.smtp.host",
	 * "stmp.gmail.com"); prop.put("mail.smtp.port", 465);
	 * prop.put("mail.smtp.auth", "true"); prop.put("mail.smtp.ssl.enable", "true");
	 * prop.put("mail.smtp,ssl.trust", "smtp.gmail.com");
	 * 
	 * 
	 * Session session = Session.getDefaultInstance(prop, new
	 * javax.mail.Authenticator() { protected MemberController getMemberController()
	 * { return new MemberController(); } });
	 * 
	 * 
	 * MimeMessage mail = new MimeMessage(session); try {
	 * mail.setSubject("[본인인증] MS : 본인인증 확인 메일입니다.", "UTF-8");
	 * mail.setText("본인인증 확인메일입니다. 링크를 눌러 회원가입을 완료하세요.");
	 * mail.addRecipient(RecipientType.TO, new InternetAddress(email));
	 * 
	 * Transport.send(mail); } catch (MessagingException e) { e.printStackTrace(); }
	 * Member member = new Member();
	 * 
	 * String result = member.getEmail();
	 * 
	 * return result; }
	 */
	
	// 조준우
	@RequestMapping("login.do")
	public String login() {
		return "member/login";
	}
	//회원 로그인 체크
	@RequestMapping("login_check.do")
	public ModelAndView login_check(@ModelAttribute Member vo, HttpSession session) {

		String name = memberService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if(name != null) { 
			//로그인 성공 시
			mav.setViewName("home/home");
		}else {
			//로그인 실패시
			mav.setViewName("member/login");
			mav.addObject("message", "error");
		}
		return mav;
	}
	
	
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		memberService.logout(session);
			mav.setViewName("member/login");
			mav.addObject("message", "logout");
			return mav;
		
	}
}
