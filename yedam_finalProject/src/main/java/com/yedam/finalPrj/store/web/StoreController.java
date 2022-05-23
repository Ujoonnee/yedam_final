package com.yedam.finalPrj.store.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yedam.finalPrj.store.serviceImpl.StoreServiceImpl;
import com.yedam.finalPrj.store.vo.jo.ResProdListPageMaker;
import com.yedam.finalPrj.store.vo.jo.ResProdListPagingCriteria;
import com.yedam.finalPrj.store.vo.park.Store;
import com.yedam.finalPrj.store.vo.park.StorePageMaker;
import com.yedam.finalPrj.store.vo.park.StorePagingCriteria;

@Controller
@RequestMapping("/store/*")
public class StoreController {
	
	@Autowired StoreServiceImpl dao;

	
//	Park
	
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
	
		
	
//	Hong


	
//	Jo
	
//	예약한 상품 리스트 출력/ 검색처리
	@GetMapping("resProdList")
	public String reservedProductsList(ResProdListPagingCriteria cri,Model model) {
		  
		if(cri.getType()=="") {
			model.addAttribute("resProdList", dao.resProdList(cri));
			model.addAttribute("paging",new ResProdListPageMaker(cri,dao.resTotalCnt()));
		}else {
			dao.search(cri, model);
		}
		
		return "store/resProdList";
	}
	
// 	(예약번호 받아서)예약내역 상세페이지로 이동
	@GetMapping("resProdListByProdName/{selectedResNo}")
	public String reservedProductsDetail(@PathVariable("selectedResNo") long selectedResNo, Model model) {
			
		model.addAttribute("detail", dao.resProdDetail(selectedResNo));
		model.addAttribute("prodList", dao.resProdDetailList(selectedResNo));
			
		return "store/reservedProductsDetail";
	}
	
//	Yoon
	
	
	
//	Lee
	
}
