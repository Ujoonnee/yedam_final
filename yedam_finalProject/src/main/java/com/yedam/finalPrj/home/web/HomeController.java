package com.yedam.finalPrj.home.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.finalPrj.home.service.HomeService;
import com.yedam.finalPrj.member.service.MemberVO;

@Controller
@RequestMapping("/*")
public class HomeController {
	
	@Autowired HomeService service;
	
	@RequestMapping("")
	public String home(Model model) {
		return "main/home";
	}
	
	

	
	@GetMapping("tempLogin")
	public String tempLogin(MemberVO member, HttpServletRequest request) {
		service.login(member, request);
		return "redirect:" + request.getHeader("Referer");
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("myPage")
	public String myPage() {
		return "layouts/myPage/myPageMain";
	}
	
}