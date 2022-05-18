package com.yedam.finalPrj.store.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yedam.finalPrj.store.service.Store;
import com.yedam.finalPrj.store.service.StorePageMaker;
import com.yedam.finalPrj.store.service.StorePagingCriteria;
import com.yedam.finalPrj.store.serviceImpl.StoreServiceImpl;

@Controller
@RequestMapping("/store/*")
public class StoreController {
	
	@Autowired StoreServiceImpl dao;

//	매장신청 양식 페이지
	@RequestMapping("/register")
	public String register() {
		return "store/storeRegister";
	}
//	매장신청 양식 전송
	@RequestMapping("/regist.do")
	public String regist(Store vo,Model model) {
//		매장등록 번호 입력.
		vo.setCategory("00204");
		dao.regist(vo);
		return "home/home";
	}
	
//	매장 리스트 출력
	@GetMapping("/list")
	public String list(StorePagingCriteria cri,Model model,@RequestParam String latitude, @RequestParam String longitude) {
//		로그인한지 확인하는 session
		int total = dao.totalCnt();
		cri.setLatitude(latitude);
		cri.setLongitude(longitude);
//		storeList출력
		model.addAttribute("storeList", dao.storeList(cri));
		model.addAttribute("paging",new StorePageMaker(cri, total));
		return "store/storeList";
	}
	

//	매장에서의 검색처리
	@RequestMapping(value ="searchList", method= {RequestMethod.POST})
	public String search(StorePagingCriteria cri,Model model) {
		System.out.println("key : "+cri.getType() );
		System.out.println("val : "+cri.getKeyword());
//		위도와 경도 임의 지정 -> 로그인 테이블 받아오면 재설정
		cri.setLongitude("30.8690794214");
		cri.setLatitude("128.5942180675");
//		페이지수 설정 (검색 한 후 토털값으로 수정해야함.)
//		상품명 검색 후 매장출력
		if(cri.getType().equals("prod_name")) {
			System.out.println("prod_name통과");
			int total = dao.totalProdCnt(cri);
			model.addAttribute("storeList",dao.searchProduct(cri));
			model.addAttribute("paging",new StorePageMaker(cri,total));
			}
//		매장명 검색 후 매장출력
		else if(cri.getType().equals("name")) {
			System.out.println("cri" + cri.getPageNum());
			int total = dao.totalNameCnt(cri);
			model.addAttribute("storeList",dao.searchName(cri));
			model.addAttribute("paging",new StorePageMaker(cri,total));
		}
//		카테고리 검색 후 매장출력
		else if(cri.getType().equals("store_cat")) {
			System.out.println("store_cat통과");
			int total = dao.totalCatCnt(cri);
			model.addAttribute("storeList",dao.searchaddress(cri));
			model.addAttribute("paging",new StorePageMaker(cri,total));
		}
//		전체 검색 후 매장출력
		else {
			System.out.println("통과한거없음.");
			int total = dao.totalCnt();
			model.addAttribute("storeList", dao.storeList(cri));
			model.addAttribute("paging",new StorePageMaker(cri, total));
		}
		return "store/storeList";
	}
	
	
	
	
}
