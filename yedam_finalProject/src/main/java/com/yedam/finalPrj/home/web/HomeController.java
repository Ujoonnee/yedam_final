package com.yedam.finalPrj.home.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.finalPrj.home.service.HomeService;

@Controller
public class HomeController {
	
	@Autowired HomeService service;
	
	@RequestMapping("/")
	public String home(Model model) {
		return "main/home";
	}
	
	@RequestMapping("/error404")
	public String error404() {
		return "main/error/404";
	}

	@RequestMapping("/error500")
	public String error500() {
		return "main/error/500";
	}
	
	
	@GetMapping("myPage")
	public String myPage() {
		return "layouts/myPage/myPageMain";
	}
	
}