package com.yedam.finalPrj.facilityBusiness.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.finalPrj.facilityBusiness.service.FacBusiness;
import com.yedam.finalPrj.facilityBusiness.serviceImpl.FacBusinessMapper;

@Controller //컨트롤러 빈으로 등록
@RequestMapping("/fac_business/*")
public class Fac_business_Controller {
	
	@Autowired
	FacBusinessMapper mapper ;

	//controller일때는 (WebINf/views)-> 폴더/jsp
	//restController일때는 동일화면에 값을 그대로 출력.
	@RequestMapping("/resList")
	public String resList(Model model) {
		model.addAttribute("resList", mapper.findAll());
		
		return "fac_business/resList";
	}
	
	
	
}
