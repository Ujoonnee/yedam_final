package com.yedam.finalPrj.exhibition.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.finalPrj.exhibition.service.ExhibitionService;
import com.yedam.finalPrj.exhibition.vo.jo.ExhibitionVO;

@Controller
@RequestMapping("/exhibition/*")
public class ExhibitionController {

	@Autowired ExhibitionService service;
	
	// 홍제
	
	
	// 준우
		//모든 등록신청목록조회.
			@GetMapping("exRegAppList")
			public String exRegAppList(String approvalStatus, Model model) {
				model.addAttribute("regList", service.selectAllExh());
				return "exhibition/exRegAppList";
			}
		//승인여부로 검색.
			@GetMapping("exRegAppList2")
			@ResponseBody
			public List<ExhibitionVO> exRegAppList2(String approvalStatus) {
				return service.selectAllExhByStatus(approvalStatus);
			}
		//전시명으로 검색.
			@GetMapping("exRegAppListByExhName")
			@ResponseBody
			public List<ExhibitionVO> selectAllByExhName(String exhName){
				return service.selectAllByExhName(exhName);
			}
		//사업자명으로 검색.
			@GetMapping("exRegAppListByMemName")
			@ResponseBody
			public List<ExhibitionVO> selectAllByMemName(String memName){
				return service.selectAllByMemName(memName);
			}
		
	// 성환
	
	
	// 우준
	
	
	// 성준
	
	
}
