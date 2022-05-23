package com.yedam.finalPrj.product.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.finalPrj.product.serviceImpl.ProductServiceImpl;
import com.yedam.finalPrj.product.vo.park.ProductPageMaker;
import com.yedam.finalPrj.product.vo.park.ProductPagingCriteria;
import com.yedam.finalPrj.product.vo.park.Statistics;
import com.yedam.finalPrj.product.vo.park.hong.ProductReservation;



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
	public String productInsert(String file,ProductPagingCriteria cri,Model model)  {
	
		System.out.println("===========================================================file:"+file);
		dao.myStoreProductInsert(file);
		
		model.addAttribute("ProductList",dao.myStoreProductManegement(cri));
		model.addAttribute("paging",new ProductPageMaker(cri,dao.myStoreProductCnt(cri)));
		return "store/myProductManagement";
	}
	
	
	@PostMapping("updateTempStock")
	public String TemporarilyOutOfStock(@RequestBody List<HashMap<String,String>> vo,String file,ProductPagingCriteria cri,Model model) {
		System.out.println(vo);
		dao.myStoreProductUpdate(vo);
		model.addAttribute("ProductList",dao.myStoreProductManegement(cri));
		model.addAttribute("paging",new ProductPageMaker(cri,dao.myStoreProductCnt(cri)));
		return"store/myProductManagement";
		
	}
	
	@RequestMapping("statisticsForm")
	public String Statistics(@RequestParam("storeNo") int storeNo, Model model) {
		
		model.addAttribute("productReservation" , dao.salesbyDate(storeNo));
		return "store/statistics";
	}
	
	@RequestMapping("searchDate")
	public String SearchDateInStatistics(HttpServletRequest request, Statistics vo,Model model) {
		System.out.println("ㅇㅅㅇ");
		System.out.println(vo.getStartDate());
		System.out.println(vo.getStoreNo());
		System.out.println(vo.getEndDate());
		
		model.addAttribute("productReservation", dao.searchDateInStatistics(vo));
		return "store/statistics";
	}
	
//	Hong
	
//	상품 예약 목록
	@RequestMapping(value = "/proReSelectAll", method = RequestMethod.GET)
	public String proReSelectAll(Model model, ProductPagingCriteria cri) {
		model.addAttribute("proReSelectAll", dao.proReSelectAll());
		model.addAttribute("paging", new ProductPageMaker(cri, dao.totalCnt(cri)));
		return "store/productReservation";
	}

//  상품예약목록 상세페이지
	@RequestMapping(value = "/proReDetail" , method = RequestMethod.GET)
	public String proReDetail(Model model, ProductReservation vo) {
		model.addAttribute("proRe", dao.proReDetail(vo));
		model.addAttribute("detailList", dao.proReDetailList());
		return "store/productReservationDetail";
	}
	
	
//	Jo
	
 
	
	
//	Yoon
	
	
 
	
//	Lee
	
}

