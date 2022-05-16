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
import com.yedam.finalPrj.member.service.Member;
import com.yedam.finalPrj.member.service.MemberService;

@Controller
//디렉토리 찾아주는거 아직까진 필요하진 않고 정확하게 몰라서 막아둠 
//@RequestMapping("/exhibition/*")
public class ExhibitionController {

	@Autowired
	private ExhibitionService exhibitionService;
	
	@Autowired
	private MemberService memberService;
	
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
	public String findOne(Exhibition exhibition, ExhibitionReservation er, Model model) {
		model.addAttribute("exhibition", exhibitionService.exFindOne(exhibition));
		
		return "exhibition/exFindOne";

	}
	
	// 결제 전 확인 페이지
	@RequestMapping("/resConfirm")
	public String resConfirm(ExhibitionReservation er, Model model) {
		
		// 전시정보
		Exhibition ex = new Exhibition();
		ex.setExNo(er.getExNo());
		
		//회원
		Member mem = new Member();
		
		
		model.addAttribute("ex", exhibitionService.exFindOne(ex));
//		model.addAttribute("mem", memberService.findOne(mem));
		model.addAttribute("er", er);
		
		return "exhibition/resConfirm";
	}
	// 예약자 전체 명단.
	@RequestMapping("/exResFindAll")
	public String exresFindAll(Model model) {
		List<ExResMem> exresmem = exhibitionService.resFindAll();
		
		model.addAttribute("exresmems", exresmem);
		return "exhibition/exResFindAll";
	}
	
	//예약 정보 
	  @RequestMapping("/exResFindOne") 
	  public String exresFindOne(ExResMem exresmem, Model model) {
	  
	  model.addAttribute("exresmem", exhibitionService.exResFindOne(exresmem));
	  return "exhibition/exResFindOne"; 
	  }
	 

	// 미구현수정

	@RequestMapping("/exResAmtUpdate") 
	public String  exResAmtUpdate(@ModelAttribute("exresmem") ExResMem exresmem) {
		  
		  exhibitionService.exResAmtUpdate(exresmem);
		  
	 return "redirect:exResFindOne"; 
	 }
	//전시 회원 예약 목록 페이지.
	@GetMapping("/exResFindAllGu")
	public String ExResFindAllGu(Model model) {
		
		
		List<ExhibitionReservation> exres =   exhibitionService.exResFindAllGu();
		
		model.addAttribute("exres", exres);
		
		return "exhibition/exResFindAllGu";
	}
	
	
	//전시 : 사업자 예약 목록 페이지
	@RequestMapping("/exResFindAllBm")
	public String exResFindAllBm(Model model) {
		List<Exhibition> exres = exhibitionService.exResFindAllBm();
		
		model.addAttribute("exres", exres);
		return "exhibition/exResFindAllBm";
	}
	
	@RequestMapping("/resConfirmGu") 
	 public String resConfirmGu(ExResMem exresmem, Model model) {
	 
	 model.addAttribute("exresmem", exhibitionService.resConfirmGu(exresmem));
	 
	 return "exhibition/resConfirmGu"; 
	  }

	// 수정페이지
	
	/*
	 * @RequestMapping("/updatePage") public String updatePage() {
	 * 
	 * return "exhibition/updatePage"; }
	 */

}
