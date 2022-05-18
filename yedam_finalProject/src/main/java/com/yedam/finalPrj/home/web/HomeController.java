package com.yedam.finalPrj.home.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yedam.finalPrj.home.service.HomeService;
import com.yedam.finalPrj.member.service.MemberVO;

@Controller
@RequestMapping("/*")
public class HomeController {
	
	@Autowired HomeService service;
	
	@RequestMapping("")
	public String home(Model model) {
		ObjectMapper om = new ObjectMapper();
		try {
			om.writeValueAsString(service.getRecommendation());
			model.addAttribute("exhibitionList", om.writeValueAsString(service.getRecommendation().get("exhibitionList")));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return "main/home";
	}
	
	@GetMapping("login")
	public String login() {
		return "main/member/login";
	}
	
	@PostMapping("login")
	public String login(MemberVO member, HttpServletRequest request) {
		service.login(member, request);
		return "main/home";
	}
	
	@GetMapping("tempLogin")
	public String tempLogin(MemberVO member, HttpServletRequest request) {
		service.login(member, request);
		return "main/home";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("myPage")
	public String myPage() {
		return "main/member/myPageMain";
	}
	
}