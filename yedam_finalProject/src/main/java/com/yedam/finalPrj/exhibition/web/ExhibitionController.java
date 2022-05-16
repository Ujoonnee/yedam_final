package com.yedam.finalPrj.exhibition.web;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.finalPrj.exhibition.service.ExResMem;
import com.yedam.finalPrj.exhibition.service.Exhibition;
import com.yedam.finalPrj.exhibition.service.ExhibitionReservation;
import com.yedam.finalPrj.exhibition.service.ExhibitionService;

@Controller
//디렉토리 찾아주는거 아직까진 필요하진 않고 정확하게 몰라서 막아둠 
//@RequestMapping("/exhibition/*")
public class ExhibitionController {

	@Autowired
	private ExhibitionService exhibitionService;

	// 목록
	@GetMapping("/exFindAll")
	public String FindAll(Model model) {
		List<Exhibition> exhibition = exhibitionService.exFindAll();
		// model에 정보 저장.

		// 전체조회
		model.addAttribute("exhibitions", exhibition);

		return "exhibition/exFindAll";
	}

	// 등록
	@PostMapping(value = "/exInsert")
	public String insert(Exhibition exhibition) throws IOException {

		exhibitionService.exInsert(exhibition);

		return "redirect:exFindAll";
	}

	// 등록하는 페이지
	@RequestMapping("/exInsertPage")
	public String insertPage() {

		return "exhibition/exInsertPage";
	}

	// 상세페이지
	@RequestMapping("/exFindOne")
	public String findOne(Exhibition exhibition,ExResMem exresmem,Model model) {

		model.addAttribute("exhibition", exhibitionService.exFindOne(exhibition));
		
		model.addAttribute("exresmem", exhibitionService.exResFindOne(exresmem));
		
		return "exhibition/exFindOne";

	}
	
	@RequestMapping("/exResFindAll")
	public String exresFindAll(Model model) {
		List<ExResMem> exresmem = exhibitionService.resFindAll();
		
		model.addAttribute("exresmems", exresmem);
		return "exhibition/exResFindAll";
	}
	
	@RequestMapping("/exResFindOne")
	public String exresFindOne(ExResMem exresmem, Model model) {
		
		model.addAttribute("exresmem", exhibitionService.exResFindOne(exresmem));
		return "exhibition/exResFindOne";
	}

	// 수정

	@RequestMapping("/exResAmtUpdate") 
	public String  exResAmtUpdate(@ModelAttribute("exresmem") ExResMem exresmem) {
		  
		  exhibitionService.exResAmtUpdate(exresmem);
		  
	 return "redirect:findAll"; 
	 }
	 
	// 수정페이지
	
	/*
	 * @RequestMapping("/updatePage") public String updatePage() {
	 * 
	 * return "exhibition/updatePage"; }
	 */

}
