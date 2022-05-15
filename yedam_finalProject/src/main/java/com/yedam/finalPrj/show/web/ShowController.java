package com.yedam.finalPrj.show.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.finalPrj.show.service.ShowService;

@Controller
@RequestMapping("/show/*")
public class ShowController {
	
	@Autowired
	private ShowService showService;
	
	
	// 전체목록 조회
	@RequestMapping("/findAll")
	public String FindAll(Model model) {
		model.addAttribute("show", showService.findAll());
		return "show/findAll";
	}
}
