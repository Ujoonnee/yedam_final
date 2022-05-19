package com.yedam.finalPrj.product.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yedam.finalPrj.product.serviceImpl.ProductServiceImpl;
import com.yedam.finalPrj.product.vo.park.ProductPageMaker;
import com.yedam.finalPrj.product.vo.park.ProductPagingCriteria;



@Controller
@RequestMapping("/store/product/*")
public class ProductController {

	@Autowired ProductServiceImpl dao;
	
	
	// park
//	매장 상세정보(선택한 매장페이지)
	@RequestMapping(value = "/productView", method = RequestMethod.GET)
	public String Storeview(ProductPagingCriteria cri,Model model,HttpServletRequest request) {
		String store_no =  (String) (request.getParameter("store_no"));
		System.out.println("page : "+cri.getPageNum() );
		System.out.println("amount : "+cri.getAmount());
		System.out.println("store_no : "+store_no);
		cri.setStoreNo(store_no);
		int total = dao.productCnt(store_no);
		System.out.println(total);
		model.addAttribute("products" ,dao.selectOne(cri));
		model.addAttribute("paging",new ProductPageMaker(cri, total));
		return "store/storeView";
	}
//  상품 검색
	@RequestMapping(value = "searchProduct",method = {RequestMethod.POST})
	public String searchProduct(ProductPagingCriteria cri,Model model,HttpServletRequest request) {
		
		String store_no =  (String) (request.getParameter("store_no"));
		System.out.println("/상품페이지/ 매장번호 값 확인: "+store_no);
		
		
		
//		option 값에 따른 sql 구문 출력.
		if(cri.getType().equals("prod_name")) {
			int total = dao.searchProductCnt(cri);
			model.addAttribute("products", dao.searchProduct(cri));
			model.addAttribute("paging",new ProductPageMaker(cri, total));
			
		} else if(cri.getType().equals("price")) {
			cri.setLowPrice(0);
			cri.setHighPrice(10000);
			int total = dao.searchPriceCnt(cri);
			model.addAttribute("products", dao.searchProduct(cri));
			model.addAttribute("paging",new ProductPageMaker(cri, total));
			
		} else {
			int total = dao.productCnt(store_no);
			model.addAttribute("products" ,dao.selectOne(cri));
			model.addAttribute("paging",new ProductPageMaker(cri, total));
		}
		return "store/storeView";
	}
	
	
	
//	Hong


 
	
//	Jo
	
 
	
	
//	Yoon
	
	
 
	
//	Lee
	
}

