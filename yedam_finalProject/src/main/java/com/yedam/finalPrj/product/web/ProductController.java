package com.yedam.finalPrj.product.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String Storeview(ProductPagingCriteria cri,Model model,String store_no) {
		cri.setStoreNo(store_no);
		model.addAttribute("products" ,dao.selectOne(cri));
		model.addAttribute("paging",new ProductPageMaker(cri, dao.productCnt(store_no)));
		return "store/storeView";
	}
//  상품 검색
	@RequestMapping(value = "searchProduct",method = {RequestMethod.POST})
	public String searchProduct(ProductPagingCriteria cri,Model model,HttpServletRequest request) {
		dao.search(cri, model,request);
		return "store/storeView";
	}
	
	@RequestMapping("management")
	public String myProductManegement(ProductPagingCriteria cri,Model model) {
		
		model.addAttribute("ProductList",dao.myStoreProductManegement(cri));
		model.addAttribute("paging",new ProductPageMaker(cri,dao.myStoreProductCnt(cri)));
		return"store/myProductManagement";
	}
//	Json값 
	@RequestMapping("productInsert")
	@ResponseBody
	public String productInsert(String file)  {
	
		System.out.println(file);
		dao.myStoreProductInsert(file);
		return "";
	}
//	Hong


 
	
//	Jo
	
 
	
	
//	Yoon
	
	
 
	
//	Lee
	
}

