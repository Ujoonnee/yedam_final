package com.yedam.finalPrj.facility.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.finalPrj.facilityBusiness.serviceImpl.FacBusinessMapper;

@Controller //컨트롤러 빈으로 등록
@RequestMapping("/my_fac_res/*")
public class FacMyresList {
	
	@Autowired
	FacBusinessMapper mapper ;

	//controller일때는 (WebINf/views)-> 폴더/jsp
	//restController일때는 동일화면에 값을 그대로 출력.
	@RequestMapping("/resList")
	public String myfacResList(Model model) {
		int memNo = 2;
		
		model.addAttribute("myResList", mapper.findMyResList(memNo));
		
		return "facMyReserv/resList";
	}
	
	@RequestMapping("/detail.do/{facResNo}")
	public String detail(@PathVariable int facResNo, Model model) {
		
		model.addAttribute("reserve", mapper.findMyResList(facResNo));
		model.addAttribute("person", mapper.findNameTel(facResNo));
		model.addAttribute("facName", mapper.FindFacName(facResNo));
		
		return "facMyReserv/detail";
	}
	
}