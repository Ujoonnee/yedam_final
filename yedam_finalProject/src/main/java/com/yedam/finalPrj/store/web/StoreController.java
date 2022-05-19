package com.yedam.finalPrj.store.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yedam.finalPrj.store.service.Store;
import com.yedam.finalPrj.store.service.StorePageMaker;
import com.yedam.finalPrj.store.service.StorePagingCriteria;
import com.yedam.finalPrj.store.serviceImpl.StoreServiceImpl;

@Controller
@RequestMapping("/store/*")
public class StoreController {
	
	@Autowired StoreServiceImpl dao;

//	매장신청 양식 페이지
	@RequestMapping("register")
	public String register() {
		return "store/storeRegister";
	}
//	매장신청 양식 전송
	@RequestMapping("regist")
	public String regist(Store vo,Model model) {
//		매장등록 번호 입력.
		vo.setCategory("00204");
		dao.regist(vo);
		return "home/home";
	}
	
//	매장 리스트 출력
	@GetMapping("list")
	public String list(StorePagingCriteria cri,Model model) {
//		storeList출력
		model.addAttribute("storeList", dao.storeList(cri));
		model.addAttribute("paging",new StorePageMaker(cri, dao.totalCnt()));
		return "store/storeList";
	}
	

//	매장에서의 검색처리
	@RequestMapping(value ="searchList", method= {RequestMethod.POST})
	public String search(StorePagingCriteria cri,Model model, HttpServletRequest request ) {
		dao.search(cri, model);
		return "store/storeList";
	}
	
//	내 예약정보 (매장)
	@RequestMapping("reservation")
	public String storeReservation(StorePagingCriteria cri,Model model) {
		model.addAttribute("storeReservation", dao.storeReserve(cri));
		model.addAttribute("paging",new StorePageMaker(cri, dao.numberOfReservation(cri)));
		
		return "store/storeReservation";
	}
//	상세예약정보(매장)
	@RequestMapping("reservationDetail")
	public String storeReservationDetail(StorePagingCriteria cri,Model model) {
		model.addAttribute("reservationDetail",dao.storeReservationDetail(cri));
		return "store/storeResrvationDetail";
	}
		
	
	
	
}
