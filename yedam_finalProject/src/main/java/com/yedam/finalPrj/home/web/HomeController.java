package com.yedam.finalPrj.home.web;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yedam.finalPrj.home.service.HomeService;

@Controller
public class HomeController {
	
	@Autowired HomeService homeService;
	
	@RequestMapping("/")
	public String home(Locale locale, Model model) {
		ObjectMapper om = new ObjectMapper();
		try {
			om.writeValueAsString(homeService.getRecommendation());
			model.addAttribute("exhibitionList", om.writeValueAsString(homeService.getRecommendation().get("exhibitionList")));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return "home/home";
	}
	
	@RequestMapping(value ="/login", method = RequestMethod.GET)
	public String goLogin() {
		return "login";
	}
	@RequestMapping(value ="/review", method = RequestMethod.GET)
	public String review() {
		return "review/review";
	}
	
}