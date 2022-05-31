package com.yedam.finalPrj.member.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.finalPrj.home.service.HomeService;
import com.yedam.finalPrj.member.service.MemberService;
import com.yedam.finalPrj.member.service.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired HomeService service;
	@Autowired MemberService mservice;

	// 로그인
	@GetMapping("sign-in")
	public String login() {
		return "member/sign-in";
	}
	
	@PostMapping("login")
	@ResponseBody
	public String login(MemberVO member, HttpServletRequest request) {
		return service.login(member, request);
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
		return mservice.isValidEmail(member);
	}
	
	// 회원가입 처리 및 확인메일 발송
	@PostMapping("sign-up")
	@ResponseBody
	public String signUp(@RequestBody Map<String,String> member, Model model) {
		
		if (mservice.signUp(member).equals("success")) {
			Thread thread = new Thread() {
				@Override
				public void run() {
					mservice.sendConfirmationMail(member);
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
	public String confirm(String applicationNo) {
		// 회원상태 변경 후 홈 화면으로 이동 
		
		return "member/confirm";
	}
	

	
	
}
