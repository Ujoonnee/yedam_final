package com.yedam.finalPrj.show.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.finalPrj.show.Show;
import com.yedam.finalPrj.show.service.ShowService;

@Controller

@RequestMapping("/show/*")
public class ShowController {
	
	@Autowired
	private ShowService showService;
	
	
	// 전체목록 조회
	/*
	 * @RequestMapping("/findAll") public String findAll(Model model) {
	 * model.addAttribute("show", showService.findAll()); return "show/findAll"; }
	 */	
	
	@GetMapping("/showFindAll")
	public String findAll(Model model) {
		List<Show> show = showService.showFindAll();
		model.addAttribute("show", show);
		return "show/showFindAll";
	}
}
