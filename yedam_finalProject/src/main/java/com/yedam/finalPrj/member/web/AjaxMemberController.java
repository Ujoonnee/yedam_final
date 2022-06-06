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
@ResponseBody
public class AjaxMemberController {

	@Autowired MemberService service;

	// 로그인 전 확인
	@PostMapping("sign-in")
	public String signIn(MemberVO member, HttpServletRequest request) {
		return service.signIn(member, request);
	}
	
	// 이메일 중복체크
	@GetMapping("emailCheck")
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
	
	// 회원정보 수정 처리
	@PostMapping("update")
	@ResponseBody
	public String update(@RequestBody MemberVO member, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		member.setMemNo(user.getMemNo());
		
		return service.update(member);
	}
}
