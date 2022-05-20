package com.yedam.finalPrj.store.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.finalPrj.store.serviceImpl.StoreServiceImpl;
import com.yedam.finalPrj.store.vo.jo.ProductReservation;
import com.yedam.finalPrj.store.vo.jo.ReservedProductsListPageMaker;
import com.yedam.finalPrj.store.vo.jo.ReservedProductsListPagingCriteria;
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
	
//	예약한 상품 리스트 출력
	@GetMapping("reservedProductsList")
	public String reservedProductsList(ReservedProductsListPagingCriteria cri,Model model) {
//		예약 상품 목록 출력
		
		 model.addAttribute("reservedProductsList", dao.reservedProductsList(cri));
		  
		 model.addAttribute("paging",new ReservedProductsListPageMaker(cri, dao.totalCnt()));
		 
		return "store/reservedProductsList";
	}
// 	매장이름으로 검색 리스트 출력	
	@PostMapping("resProdListByStoreName")
	@ResponseBody
	public List<ProductReservation> selectResProdListByStoreName(ReservedProductsListPagingCriteria cri, @RequestParam("storeName") String storeName) {
		cri.setStoreName(storeName);
//		System.out.println(dao.selectResProdListByStoreName(cri, storeName));
		return dao.selectResProdListByStoreName(cri);
	}
// 	상품명으로 검색 리스트 출력	
	@PostMapping("resProdListByProdName")
	@ResponseBody
	public String selectResProdListByProdName(ReservedProductsListPagingCriteria cri, Model model, @RequestParam("prodName") String inputVal) {
		 model.addAttribute("reservedProductsList", dao.reservedProductsList(cri));
		  
		 model.addAttribute("paging",new ReservedProductsListPageMaker(cri, dao.totalCnt()));
		return "dao.reservedProductsList(cri)";
	}
// 	(예약번호 받아서)예약내역 상세페이지로 이동
	@GetMapping("resProdListByProdName/{selectedResNo}")
	public String reservedProductsDetail(@PathVariable long selectedResNo) {
		System.out.println();
		System.out.println("선택한상품예약번호에 따라 상세 출력");
		return "store/reservedProductsDetail";
	}
//	Yoon
	
	
	
//	Lee
	
}
