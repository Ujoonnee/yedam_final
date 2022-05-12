package com.yedam.finalPrj.exhibition.web;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.finalPrj.announcement.service.Announcement;
import com.yedam.finalPrj.announcement.service.AnnouncementPagingCriteria;
import com.yedam.finalPrj.exhibition.service.Exhibition;
import com.yedam.finalPrj.exhibition.service.ExhibitionService;

@Controller
public class ExhibitionController {
	
	@Autowired
	private ExhibitionService exhibitionService;
	
	//목록
	@GetMapping("/findAll")
	public String FindAll(Exhibition exhibition, Model model) {
	//model에 정보 저장.

	//전체조회
	model.addAttribute("exhibitions", exhibition);
	
		return "exhibition/findAll";
	}
	
	//등록
	@PostMapping(value="/insert")
	public String insert(Exhibition exhibition) throws IOException {
			
		exhibitionService.insert(exhibition);
		
			return "redirect:findAll";
	}
	
	//등록하는 페이지
	@RequestMapping("/insertPage")
	public String insertPage() {
			
		return "exhibition/insertPage";
	}
	
	//상세페이지
	@RequestMapping("/findOne")
	public String findOne(Exhibition exhibition, Model model, @ModelAttribute("cri") AnnouncementPagingCriteria cri/*, @RequestParam("ren") String ren*/){
		
		
		
		
		model.addAttribute("exhibitions", exhibitionService.findOne(exhibition));
		
		return "exhibition/findOne";
		
	}
	//수정
	@RequestMapping("/update")
	public String update(@ModelAttribute("announcement") Announcement announcement, @ModelAttribute AnnouncementPagingCriteria cri) {
		
		return "redirect:findAll";
}	
	//수정페이지 
	@RequestMapping("/updatePage")
	public String updatePage() {
			
		return "exhibition/updatePage";
}	


		
}



