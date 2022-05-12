package com.yedam.finalPrj.facility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.finalPrj.facility.serviceImpl.FacilityMapper;
import com.yedam.finalPrj.member.service.Member;

@Controller //컨트롤러 빈으로 등록
@RequestMapping("/facility/*")
public class FacilityController {
	
	@Autowired
	FacilityMapper mapper ;

	
	@RequestMapping("/facility")
	public String facilityList(Model model) {
		model.addAttribute("facility", mapper.findAll());
		
		return "facility/facilityList";
	}
	
	@GetMapping("detail.do/{fac_no}")
	public String Detail(@PathVariable String fac_no, Member vo, Model model) {
		//System.out.println(fac_no);
		//System.out.println(model.toString());
		
		model.addAttribute("facility", mapper.findEvery(fac_no));
		
		return "facility/facilityDetail";
	}
	
	@GetMapping("detail.do/reserve.do/{fac_no}")
	public String Reserve(@PathVariable String fac_no, Member vo, Model model) {
		//System.out.println(fac_no);
		//System.out.println(model.toString());
		
		model.addAttribute("facility", mapper.findEvery(fac_no));
		
		return "facility/facilityReserve";
	}
	
	@GetMapping("detail.do/reserve.do/confirm.do/{fac_no}")
	public String Confirm(@PathVariable String fac_no, Member vo, Model model) {
		//System.out.println(fac_no);
		//System.out.println(model.toString());
		
		model.addAttribute("facility", mapper.findEvery(fac_no));
		
		return "facility/facilityConfirm";
	}
	
	
	
	
}
