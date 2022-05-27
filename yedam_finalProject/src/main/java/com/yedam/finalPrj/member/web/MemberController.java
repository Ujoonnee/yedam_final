package com.yedam.finalPrj.member.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	// 회원가입 처리
	@PostMapping("sign-up")
	@ResponseBody
	public int signUp(MemberVO member) {
		System.out.println(member.getEmail());
		return mservice.signUp(member);
	}
	
	// 이메일 중복체크
	@GetMapping("emailCheck")
	@ResponseBody
	public boolean emailCheck(MemberVO member) {
		return mservice.isValidEmail(member);
	}
	

	
	
}
