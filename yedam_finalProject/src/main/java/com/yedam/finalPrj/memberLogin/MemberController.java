package com.yedam.finalPrj.memberLogin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.finalPrj.memberLogin.service.MemberService;
import com.yedam.finalPrj.memberLogin.vo.Member;

@Controller //컨트롤러 빈으로 등록
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	MemberService memberService ;

	
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
