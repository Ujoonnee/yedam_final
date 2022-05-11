package com.yedam.finalPrj.store.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.finalPrj.store.service.Store;
import com.yedam.finalPrj.store.serviceImpl.StoreMapper;
import com.yedam.finalPrj.store.serviceImpl.StoreServiceImpl;

@Controller
@RequestMapping("/store/*")
public class StoreController {
	
	@Autowired StoreMapper map;
	@Autowired StoreServiceImpl dao;

	@RequestMapping("/register")
	public String register() {
		return "store/storeRegister";
	}
	
	@RequestMapping("/regist")
	public String regist(@ModelAttribute("Store")Store vo,Model model) {
		model.addAttribute("Store",vo);
		dao.regist(vo);
		return "home/home";
	}
}
