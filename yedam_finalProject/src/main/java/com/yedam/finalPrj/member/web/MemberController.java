package com.yedam.finalPrj.member.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.finalPrj.member.service.MemberService;
import com.yedam.finalPrj.member.service.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired MemberService service;

	// 로그인
	@GetMapping("sign-in")
	public String signIn() {
		return "member/sign-in";
	}
	
	@PostMapping("sign-in")
	@ResponseBody
	public String signIn(MemberVO member, HttpServletRequest request) {
		return service.signIn(member, request);
	}
	
	@GetMapping("tempLogin")
	public String tempLogin(MemberVO member, HttpServletRequest request) {
		service.signIn(member, request);
		return "redirect:" + request.getHeader("Referer");
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 회원가입 화면
	@GetMapping("sign-up")
	public String signUp() {
		return "member/sign-up";
	}
	
	// 이메일 중복체크
	@GetMapping("emailCheck")
	@ResponseBody
	public boolean emailCheck(MemberVO member) {
		return service.isValidEmail(member);
	}
	
	// 회원가입 처리 및 확인메일 발송
	@PostMapping("sign-up")
	@ResponseBody
	public String signUp(@RequestBody Map<String,String> member, Model model) {
		
		if (service.signUp(member).equals("success")) {
			Thread thread = new Thread() {
				@Override
				public void run() {
					service.sendConfirmationMail(member);
				}
			};
			thread.start();
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 회원가입 확인
	@GetMapping("confirm")
	public String confirm(String applicationNo, Model model) {
		// 회원상태 변경 후 홈 화면으로 이동 
		model.addAttribute("isExpired", service.confirm(applicationNo));
		return "member/confirm";
	}
	

	
	
}
