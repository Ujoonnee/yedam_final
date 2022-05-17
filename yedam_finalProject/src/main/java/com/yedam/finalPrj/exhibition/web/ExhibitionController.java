package com.yedam.finalPrj.exhibition.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yedam.finalPrj.exhibition.service.ExhibitionService;
import com.yedam.finalPrj.exhibition.vo.hong.ExhibitionReservationVO;

@Controller
@RequestMapping("/exhibition/*")
public class ExhibitionController {

	@Autowired ExhibitionService service;
	
	// 홍제
	
	// 내 예약 목록
	@GetMapping("/exSelectAllReservation")
	public String exSelectAllReservation(Model model) {
		List<ExhibitionReservationVO> exhibitionReservationVO = service.selectAllExhibitionReservattion();
		model.addAttribute("exhibitionReservationVO", exhibitionReservationVO);
		return "exhibition/exhibitionReservation";
	}
	
	// 예약목록 상세페이지
	@RequestMapping(value = "/exhibitionReservationDetail", method = RequestMethod.GET)
	public String exhibitionReservationDetail(Model model, ExhibitionReservationVO vo) {
		ExhibitionReservationVO detail = service.exDetail(vo);
		model.addAttribute("exRes", detail);
		return "exhibition/exhibitionReservationDetail";
	}
	
	
	// 준우
	
	
	// 성환
	
	
	// 우준
	
	
	// 성준
	
	
}
