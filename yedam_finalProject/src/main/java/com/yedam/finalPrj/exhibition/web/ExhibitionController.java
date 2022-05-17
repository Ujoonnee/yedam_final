package com.yedam.finalPrj.exhibition.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yedam.finalPrj.exhibition.serviceImpl.ExhibitionServiceImpl;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionPagingCriteria;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionVO;
import com.yedam.finalPrj.member.service.Member;

@Controller
@RequestMapping("/exhibition/*")
public class ExhibitionController {
	
	@Autowired ExhibitionServiceImpl service;
	
	// 홍제
	
	
	// 준우
	
	
	// 성환
	
	
	// 우준
	
	
	// 성준
//	전시 출력
	@RequestMapping("list")
	public String list(ParkExhibitionPagingCriteria cri, Model model) {
		model.addAttribute("exhibitionList", service.exhibition(cri));
		return "exhibition/exhibitionList";
	}
//	전시 상세보기
	@RequestMapping(value = "DetailView.do",method = RequestMethod.GET)
	public String exhibitionView(ParkExhibitionVO vo ,HttpServletRequest request,Model model) {
//		이건 추후에 삭제할거임 
		Member mem = new Member();
		mem.setName("길동");
		mem.setTel("010-555-5555");
		model.addAttribute("member",mem);
		model.addAttribute("exhibitionView",service.findExVO(vo));
		return "exhibition/exhibitionView";
	}
//	결제하기
	@RequestMapping(value = "payment.do", method = RequestMethod.POST)
	public String payment (Model model, ParkExhibitionVO vo) {
		System.out.println("paymentDo");
		service.insertExhibition(vo);
		return "";
	}
	
}
