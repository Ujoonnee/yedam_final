package com.yedam.finalPrj.exhibition.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.finalPrj.exhibition.service.ExhibitionService;
import com.yedam.finalPrj.exhibition.vo.hong.ExhibitionReservationVO;
import com.yedam.finalPrj.exhibition.vo.hong.PageMaker;
import com.yedam.finalPrj.exhibition.vo.hong.PagingVO;
import com.yedam.finalPrj.exhibition.vo.jo.ExhibitionVO;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionPageMaker;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionPagingCriteria;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionVO;
import com.yedam.finalPrj.member.service.MemberVO;

@Controller
@RequestMapping("/exhibition/*")
public class ExhibitionController {

	@Autowired
	ExhibitionService service;

	// 홍제

	// 내 예약 목록
	@GetMapping("/exSelectAllReservation")
	public String exSelectAllReservation(PagingVO vo, Model model) {
		List<ExhibitionReservationVO> exhibitionReservationVO = service.selectAllExhibitionReservattion();
		
		int total = service.totalCnt(vo);
		
		model.addAttribute("exhibitionReservationVO", exhibitionReservationVO);
		
		model.addAttribute("paging", new PageMaker(vo, total));
		return "exhibition/exhibitionReservation";
	}

	// 예약목록 상세페이지
	@RequestMapping(value = "/exhibitionReservationDetail", method = RequestMethod.GET)
	public String exhibitionReservationDetail(Model model, ExhibitionReservationVO vo) {
		System.out.println("값확인"+model.getAttribute("exResNo"));
		System.out.println(vo.getExResNo());
		ExhibitionReservationVO detail = service.exDetail(vo);
		model.addAttribute("exRes", detail);
		return "exhibition/exhibitionReservationDetail";
	}

	// 준우
	// 모든 등록신청목록조회.
	@GetMapping("exRegAppList")
	public String exRegAppList(String approvalStatus, Model model) {
		model.addAttribute("regList", service.selectAllExh());
		return "exhibition/exRegAppList";
	}

	// 승인여부로 검색.
	@GetMapping("exRegAppList2")
	@ResponseBody
	public List<ExhibitionVO> exRegAppList2(String approvalStatus) {
		return service.selectAllExhByStatus(approvalStatus);
	}

	// 전시명으로 검색.
	@GetMapping("exRegAppListByExhName")
	@ResponseBody
	public List<ExhibitionVO> selectAllByExhName(String exhName) {
		return service.selectAllByExhName(exhName);
	}

	// 사업자명으로 검색.
	@GetMapping("exRegAppListByMemName")
	@ResponseBody
	public List<ExhibitionVO> selectAllByMemName(String memName) {
		return service.selectAllByMemName(memName);
	}

	// 성환

	// 우준

	// 성준
//	전시 출력
	@RequestMapping("list")
	public String list(ParkExhibitionPagingCriteria cri, Model model) {
		
		model.addAttribute("exhibitionList", service.exhibition(cri));
		model.addAttribute("paging",new ParkExhibitionPageMaker(cri, service.totalExCnt(cri)));
		return "exhibition/exhibitionList";
	}
	
//	전시 목록 검색
	@RequestMapping(value="searchExhibition", method= {RequestMethod.POST})
	public String searchEx(ParkExhibitionPagingCriteria cri, Model model) {
		model.addAttribute("exhibitionList", service.searchEx(cri));
		model.addAttribute("paging",new ParkExhibitionPageMaker(cri, service.totalExCnt(cri)));
		return "exhibition/exhibitionList";
	}

//	전시 상세보기
	@RequestMapping(value = "DetailView", method = RequestMethod.GET)
	public String exhibitionView(ParkExhibitionVO vo, HttpServletRequest request, Model model) {
//		이건 추후에 삭제할거임 
		MemberVO mem = new MemberVO();
		mem.setName("길동");
		mem.setTel("010-555-5555");
		model.addAttribute("member", mem);
		model.addAttribute("exhibitionView", service.findExVO(vo));
		return "exhibition/exhibitionView";
	}
	
	
//	결제하기
	@RequestMapping(value = "payment", method = RequestMethod.POST)
	public String payment(Model model, ParkExhibitionVO vo) {
		System.out.println("paymentDo");
		service.insertExhibition(vo);
		return "";
	}

}
