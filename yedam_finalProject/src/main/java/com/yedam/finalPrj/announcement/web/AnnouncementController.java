package com.yedam.finalPrj.announcement.web;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.finalPrj.announcement.service.Announcement;
import com.yedam.finalPrj.announcement.service.AnnouncementPageMaker;
import com.yedam.finalPrj.announcement.service.AnnouncementPagingCriteria;
import com.yedam.finalPrj.announcement.service.AnnouncementService;

@Controller
public class AnnouncementController {

	@Autowired
	private AnnouncementService service;

	// 공지사항 목록
	@RequestMapping("/announcement")
	public String FindAll(AnnouncementPagingCriteria cri, Model model) {

		int total = service.totalCnt(cri);

		// 전체목록
		model.addAttribute("list", service.findAll(cri));
		// 상단고정목록
		model.addAttribute("topList", service.getTopList());
		// 페이징
		model.addAttribute("paging", new AnnouncementPageMaker(cri, total));

		return "announcement/list";
	}

	// 공지사항 등록
	@PostMapping(value = "/insert")
	public String insert(Announcement announcement) throws IOException {

//		service.insert(announcement);

		return "redirect:findAll";
	}

	// 공지사항 등록하는 페이지
	@RequestMapping("/insertPage")
	public String insertPage() {

		return "announcement/insertPage";
	}

	// 공지사항 상세페이지
	@RequestMapping("/findOne")
	public String findOne(Announcement announcement, Model model,
			@ModelAttribute("cri") AnnouncementPagingCriteria cri) {

		service.updateView(announcement);
		System.out.println("NUMBER : " + announcement.getAnnNo());

		model.addAttribute("announcement", service.findOne(announcement));

		return "announcement/findOne";

	}

	// 공지사항 수정
	@RequestMapping("/update")
	public String update(@ModelAttribute("announcement") Announcement announcement,
			@ModelAttribute AnnouncementPagingCriteria cri) {

		return "redirect:findAll";
	}

	// 공지사항 수정페이지
	@RequestMapping("/updatePage")
	public String updatePage() {

		return "announcement/updatePage";
	}

}
