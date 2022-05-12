package com.yedam.finalPrj.announcement.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.finalPrj.announcement.service.Announcement;
import com.yedam.finalPrj.announcement.service.AnnouncementService;

@Controller
public class AnnouncementController {
	
	@Autowired
	private AnnouncementService announcementService;
	//전체조회
	@GetMapping("/findAll")
	public String FindAll(Model model) {
		
	model.addAttribute("announcements", announcementService.findAll());
		System.out.println("값 : " + announcementService.findAll().get(1).getAnnouncementDate());
		return "announcement/findAll";
	}
	// ajax 부분으로 검색 X 페이지가 넘어간다 생각하고 화면에 새로 뿌려주는거로 생각할 것
	//검색
	@GetMapping("/searchList")
	@ResponseBody
	private List<Announcement> searchList(@RequestParam("type") String type, @RequestParam("keyword") String keyword, Model model){
		Announcement announcement = new Announcement();
		announcement.setKeyword(keyword);
		announcement.setType(type);
		System.out.println(keyword);
		System.out.println(type);	
		return announcementService.searchList(announcement);
	}
}
