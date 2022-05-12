package com.yedam.finalPrj.member.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.finalPrj.member.service.Member;
import com.yedam.finalPrj.member.service.MemberService;
import com.yedam.finalPrj.member.serviceImpl.MemberServiceImpl;



@Controller
//@RequestMapping("/user/*")
public class MemberController {
	
	@Autowired
	MemberService userService;
	@Autowired MemberServiceImpl dao;
	
	@RequestMapping("/memberJoinForm")
	public String memberJoinForm() {
		return "member/memberJoinForm";
	}
	
	
	@PostMapping("/memberJoin.do")
	public String memberJoin(@ModelAttribute("Member") Member vo) {
		System.out.println("check"+vo.getName());
		dao.insert(vo);
		return "home/home";
	}
	
}
