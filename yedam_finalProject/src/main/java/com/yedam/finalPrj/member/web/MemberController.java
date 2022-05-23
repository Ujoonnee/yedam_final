package com.yedam.finalPrj.member.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.finalPrj.home.service.HomeService;
import com.yedam.finalPrj.member.service.MemberVO;

@Controller
@RequestMapping("member/*")
public class MemberController {

	// 이홍제
	@Autowired HomeService service;

	// 로그인
	@GetMapping("login")
	public String login() {
		return "member/sign-in";
	}

	@PostMapping("login")
	@ResponseBody
	public String login(MemberVO member, HttpServletRequest request) {
		return service.login(member, request);
	}
}
