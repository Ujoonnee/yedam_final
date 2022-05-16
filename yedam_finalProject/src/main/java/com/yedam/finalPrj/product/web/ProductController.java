package com.yedam.finalPrj.product.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yedam.finalPrj.product.serviceImpl.ProductServiceImpl;
import com.yedam.finalPrj.store.service.StorePageMaker;
import com.yedam.finalPrj.store.service.StorePagingCriteria;

@Controller
@RequestMapping("/store/*")
public class ProductController {

	@Autowired ProductServiceImpl dao;
	
//	매장 상세정보(선택한 매장페이지)
	@RequestMapping(value = "/storeView.do", method = RequestMethod.GET)
	public String Storeview(StorePagingCriteria cri,Model model,HttpServletRequest request) {
		String store_no =  (String) (request.getParameter("store_no"));
		int total = dao.ProcutCnt(store_no);
		System.out.println("key : "+cri.getPageNum() );
		System.out.println("val : "+cri.getAmount());
		System.out.println("Store_no : "+store_no);
		System.out.println(total);
		model.addAttribute("products" ,dao.selectOne(store_no));
		model.addAttribute("paging",new StorePageMaker(cri, total));
		return "store/storeView";
	}
//  상품 검색
	@RequestMapping(value = "searchProduct.do",method = {RequestMethod.POST})
	public String searchProduct(StorePagingCriteria cri,Model model,HttpServletRequest request) {
		System.out.println("key : "+cri.getType() );
		System.out.println("val : "+cri.getKeyword());
		
		String store_no =  (String) (request.getParameter("store_no"));
		System.out.println("/상품페이지 매장번호 출력: "+store_no);
		
		int total = dao.ProcutCnt(store_no);
		
//		option 값에 따른 sql 구문 출력.
		if(cri.getType().equals("prod_name")) {
			
		} else if(cri.getType().equals("price")) {
			
		} else {
			model.addAttribute("products" ,dao.selectOne(store_no));
			model.addAttribute("paging",new StorePageMaker(cri, total));
		}
		return "store/storeView";
	}
}
