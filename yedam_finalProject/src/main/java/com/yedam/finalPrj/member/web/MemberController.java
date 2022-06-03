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
	
	@GetMapping("tempLogin")
	public String tempLogin(MemberVO member, HttpServletRequest request) {
		service.signIn(member, request);
		return "redirect:" + request.getHeader("Referer");
	}
	
	// 로그아웃
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
	
	// 회원가입 확인
	@GetMapping("confirm")
	public String confirm(String applicationNo, Model model) {
		// 회원상태 변경 후 홈 화면으로 이동 
		model.addAttribute("isExpired", service.confirm(applicationNo));
		return "member/confirm";
	}
	
	@GetMapping("myPage")
	public String myPage() {
		return "member/myPage/update";
	}
	
	// 회원정보 수정 페이지
	@PostMapping("updateInfo")
	public String updateInfo() {
		return "member/updateInfo";
	}
}
