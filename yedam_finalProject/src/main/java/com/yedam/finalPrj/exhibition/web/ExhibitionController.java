package com.yedam.finalPrj.exhibition.web;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.finalPrj.announcement.service.Announcement;
import com.yedam.finalPrj.exhibition.service.Exhibition;
import com.yedam.finalPrj.exhibition.service.ExhibitionService;

@Controller
public class ExhibitionController {
	
	@Autowired
	private ExhibitionService exhibitionService;
	
	//목록
	@GetMapping("/exFindAll")
	public String FindAll(Model model) {
	List<Exhibition> exhibition = exhibitionService.exFindAll();
	//model에 정보 저장.

	//전체조회
	model.addAttribute("exhibitions", exhibition);
	
		return "exhibition/exFindAll";
	}
	
	//등록
	@PostMapping(value="/exInsert")
	public String insert(Exhibition exhibition) throws IOException {
			
		exhibitionService.exInsert(exhibition);
		
			return "redirect:exFindAll";
	}
	
	//등록하는 페이지
	@RequestMapping("/exInsertPage")
	public String insertPage() {
			
		return "exhibition/exInsertPage";
	}
	
	//상세페이지
	@RequestMapping("/exFindOne")
	public String findOne(Exhibition exhibition, Model model){
		
		
		
		
		model.addAttribute("exhibitions", exhibitionService.exFindOne(exhibition));
		
		return "exhibition/exFindOne";
		
	}
	//수정
	/*
	 * @RequestMapping("/update") public String
	 * update(@ModelAttribute("exhibitions") Exhibition exhibition) {
	 * 
	 * return "redirect:findAll"; }
	 */
	//수정페이지 
	/*
	 * @RequestMapping("/updatePage") public String updatePage() {
	 * 
	 * return "exhibition/updatePage"; }
	 */

		
}



