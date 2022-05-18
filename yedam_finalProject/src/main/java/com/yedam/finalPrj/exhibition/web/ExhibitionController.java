package com.yedam.finalPrj.exhibition.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.finalPrj.exhibition.service.ExhibitionService;
import com.yedam.finalPrj.exhibition.vo.lee.ExhibitionVO;
import com.yedam.finalPrj.member.service.MemberVO;

@Controller
@RequestMapping("/exhibition/*")
public class ExhibitionController {

	@Autowired ExhibitionService service;
	
	// 홍제
	
	
	// 준우
	
	
	// 성환
	
	
	// 우준
	
	// 사업자 시작 ===================

	// 전시 등록 신청 폼
	@GetMapping("register")
	public String registerForm(Model model) {
		
		// TODO session 에서 받는 member 정보로 교체할 것
		MemberVO member = new MemberVO();
		member.setMemNo(2);
		model.addAttribute("member", member);
		
		return "provider/exhibition/register";
	}
	
	// 전시 등록 신청
	@PostMapping("register")
	public String register(ExhibitionVO vo) {
		System.out.println(vo);
		service.insertExhibition(vo);
		
		// TODO 사업자의 등록 신청 목록 페이지로 이동시킬 것
		return "home/home"; 
	}
	
	// 로그인한 사업자의 전시 등록 신청 목록
	@GetMapping("registration")
	public String getRegistrationList(Model model, HttpServletRequest request) {
		model.addAttribute("list", service.getRegistrationList(request));
		
		return "exhibition/provider/registrationList";
	}
	
	// 전시 등록 신청 상세
	@GetMapping("registration/{exNo}")
	public String getRegistration(@PathVariable("exNo") int exNo, Model model) {
		model.addAttribute("exhibition", service.getRegistration(exNo));
		
		return "exhibition/provider/registration";
	}
	
	// 전시 목록 (승인완료)
	@GetMapping("provider/exhibition")
	public String getProviderExhibitionList(HttpServletRequest request, Model model) {
		model.addAttribute("list", service.getExhibitionList(request));
		return "exhibition/provider/exhibitionList";
	}
	
	// TODO 전시 상세
	@GetMapping("provider/exhibition/{exNo}")
	public String getProviderExhibition(@PathVariable("exNo") int exNo, Model model) {
		
		
		// 서비스의 전시 상세 페이지로 연결할 것
		return "";
	}
	
	// 전시 예약자 목록
	@RequestMapping("provider/exhibition/{exNo}/reservation")
	public String getProviderReservationList(@PathVariable("exNo") int exNo, HttpServletRequest request) {
		
		return "";
	}
	
	// TODO 예약정보 상세
	
	
	// 사업자 끝 ===================
	
	// 성준
	
	
}
