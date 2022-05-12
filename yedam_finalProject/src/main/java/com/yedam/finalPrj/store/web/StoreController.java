package com.yedam.finalPrj.store.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.finalPrj.store.service.Store;
import com.yedam.finalPrj.store.serviceImpl.StoreMapper;
import com.yedam.finalPrj.store.serviceImpl.StoreServiceImpl;

@Controller
@RequestMapping("/store/*")
public class StoreController {
	
	@Autowired StoreMapper map;
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
	@RequestMapping("/list")
	public String list(Model model) {
//		로그인한지 확인하는 session
		
//		storeList출력
		model.addAttribute("storeList", dao.storeList());
		
		
		return "store/storeList";
	}
	

}
