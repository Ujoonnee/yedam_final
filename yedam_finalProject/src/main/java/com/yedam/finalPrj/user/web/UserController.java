package com.yedam.finalPrj.user.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.finalPrj.user.service.UserService;
import com.yedam.finalPrj.user.service.UserVO;
import com.yedam.finalPrj.user.serviceImpl.UserServiceImpl;



@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	@Autowired UserServiceImpl dao;
	
	@RequestMapping("/userJoinForm")
	public String userJoinForm() {
		return "user/userJoinForm";
	}
	
	
	@PostMapping("/userJoin.do")
	public String userJoin(@ModelAttribute("UserVO") UserVO vo) {
		System.out.println("check"+vo.getUserName());
		dao.insert(vo);
		return "home/home";
	}
	
}
