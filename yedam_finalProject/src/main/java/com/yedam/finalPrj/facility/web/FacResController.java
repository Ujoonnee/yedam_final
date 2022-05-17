package com.yedam.finalPrj.facility.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.finalPrj.facility.service.Facility;
import com.yedam.finalPrj.facility.serviceImpl.FacilityMapper;

@Controller //컨트롤러 빈으로 등록
@RequestMapping("/fac_res/*")
public class FacResController {
	
	@Autowired
	FacilityMapper mapper ;

	//controller일때는 (WebINf/views)-> 폴더/jsp
	//restController일때는 동일화면에 값을 그대로 출력.
	@RequestMapping("/facility")
	public String facilityList(Model model) {
		model.addAttribute("facility", mapper.findAll());
		
		return "facility/facilityList";
	}
	
	@PostMapping("/facilities")
	@ResponseBody
	public List<Facility> listSearch(@RequestBody Facility vo) {
		System.out.println(vo);
		return mapper.listSearch(vo);
	}
	
	@GetMapping("detail.do/{fac_no}")
	public String Detail(@PathVariable String fac_no, Facility vo, Model model) {
		//System.out.println(fac_no);
		//System.out.println(model.toString());
		
		model.addAttribute("facility", mapper.findEvery(fac_no));
		
		return "facility/facilityDetail";
	}
	
	@GetMapping("detail.do/reserve.do/{fac_no}")
	public String Reserve(@PathVariable String fac_no, Facility vo, Model model) {
		//System.out.println(fac_no);
		//System.out.println(model.toString());
		
		model.addAttribute("facility", mapper.findEvery(fac_no));
		
		return "facility/facilityReserve";
	}
	
	@GetMapping("detail.do/reserve.do/confirm.do/{fac_no}")
	public String Confirm(@PathVariable String fac_no, Facility vo, Model model) {
		//System.out.println(fac_no);
		//System.out.println(model.toString());
		
		model.addAttribute("facility", mapper.findEvery(fac_no));
		
		return "facility/facilityConfirm";
	}
	
	
	
	
}
