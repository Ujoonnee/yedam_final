package com.yedam.finalPrj.product.web;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yedam.finalPrj.member.service.MemberVO;
import com.yedam.finalPrj.member.serviceImpl.MemberServiceImpl;
import com.yedam.finalPrj.product.service.ProductService;
import com.yedam.finalPrj.product.vo.park.Product;
import com.yedam.finalPrj.product.vo.park.ProductPageMaker;
import com.yedam.finalPrj.product.vo.park.ProductPagingCriteria;
import com.yedam.finalPrj.product.vo.park.Statistics;
import com.yedam.finalPrj.product.vo.park.hong.ProductReservation;



@Controller
@RequestMapping("/store/product/*")
public class ProductController {

	@Autowired ProductService dao;
	MemberServiceImpl impl;
	// park
//	매장 상세정보(선택한 매장페이지)
	@RequestMapping(value = "/productView", method = RequestMethod.GET)
	public String Storeview(ProductPagingCriteria cri,Model model,int store_no) {
		cri.setStoreNo(store_no);
		model.addAttribute("products" ,dao.selectOne(cri));
		model.addAttribute("paging",new ProductPageMaker(cri, dao.productCnt(store_no)));
		return "main/store/storeView";
	}
//  상품 검색
	@RequestMapping(value = "searchProduct",method = {RequestMethod.POST})
	public String searchProduct(ProductPagingCriteria cri,Model model,HttpServletRequest request) {
		dao.search(cri, model,request);
		return "main/store/storeView";
	}
	
//	판매자 : 내 상품 페이지
	@RequestMapping("management")
	public String myProductManegement(ProductPagingCriteria cri,HttpServletRequest request ,Model model) {
		HttpSession session =  request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		if(user == null) {
			return "main/unusalApproach";
		}
		System.out.println(user.getMemType());
		if(!user.getMemType().equals("00103")) {
			return "main/unusalApproach";
		}else {
			model.addAttribute("ProductList",dao.myStoreProductManegement(cri,request));
			model.addAttribute("paging",new ProductPageMaker(cri,dao.myStoreProductCnt(cri, request)));
			return"provider/store/myProductManagement";
		}
	}
	
	
//	상품이 없을 시 상품등록여러개(엑셀)
	@RequestMapping("productInsert")
	@ResponseBody
	public String productInsert(String file,ProductPagingCriteria cri,HttpServletRequest request,Model model)  {
	
		System.out.println("===========================================================file:"+file);
		dao.myStoreProductInsert(file, request);
		
		model.addAttribute("ProductList",dao.myStoreProductManegement(cri,request));
		model.addAttribute("paging",new ProductPageMaker(cri,dao.myStoreProductCnt(cri, request)));
		return "provider/store/myProductManagement";
	}
	
//	상품 재고, 상태 변경
	@PostMapping("updateTempStock")
	public String TemporarilyOutOfStock(@RequestBody List<HashMap<String,String>> vo,HttpServletRequest request,String file,ProductPagingCriteria cri,Model model) {
		System.out.println(vo);
		dao.myStoreProductUpdate(vo);
		model.addAttribute("ProductList",dao.myStoreProductManegement(cri,request));
		model.addAttribute("paging",new ProductPageMaker(cri,dao.myStoreProductCnt(cri, request)));
		return"provider/store/myProductManagement";
		
	}
//	통계 초기화면
	@RequestMapping("statisticsForm")
	public String Statistics(@RequestParam("storeNo") int storeNo, Model model) {
		
		model.addAttribute("productReservation" , dao.salesbyDate(storeNo));
		return "provider/store/statistics";
	}
//	통계에서 날짜검색
	@RequestMapping("searchDate")
	public String SearchDateInStatistics(HttpServletRequest request, Statistics vo,Model model) {
		
		model.addAttribute("productReservation", dao.searchDateInStatistics(vo));
		return "provider/store/statistics";
	}
//	단일상품등록
	@RequestMapping("singleProductRegist")
	public String SingleProductRegist(HttpServletRequest request, ProductPagingCriteria cri,Product vo, Model model) {
		dao.oneProductInsert(vo, request);
		model.addAttribute("ProductList",dao.myStoreProductManegement(cri,request));
		model.addAttribute("paging",new ProductPageMaker(cri,dao.myStoreProductCnt(cri, request)));
		return "provider/store/myProductManagement";
	}
//	사진등록
	@RequestMapping(value = "ThumbnailUpdate", method = RequestMethod.POST)
	public String ThumbnailUpdate(@RequestParam("prodThumbnail") MultipartFile multi, HttpServletRequest request,ProductPagingCriteria cri,HttpServletResponse response, Model model) throws Exception {
//		String path="C:\\image\\";
//		String url = null;
//		
//		 String uploadpath = path;
//         String originFilename = multi.getOriginalFilename();
//         String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
//         long size = multi.getSize();
//         String saveFileName = genSaveFileName(extName);
//         saveFileName.substring(2,7);
//         
//         System.out.println("uploadpath : " + uploadpath);
//         
//         System.out.println("originFilename : " + originFilename);
//         System.out.println("extensionName : " + extName);
//         System.out.println("size : " + size);
//         System.out.println("saveFileName : " + saveFileName);
//         
//         if(!multi.isEmpty())
//         {
//             File file = new File(uploadpath, multi.getOriginalFilename());
//             multi.transferTo(file);
//             
//             model.addAttribute("filename", multi.getOriginalFilename());
//             model.addAttribute("uploadPath", file.getAbsolutePath());
//             
//             return "provider/store/myProductManagement";
//         }
		
//		System.out.println("test종료");
		
		Product productVO = new Product();
		
		
		dao.productThumbnailUpdate(multi,request,model,productVO);
		
		model.addAttribute("ProductList",dao.myStoreProductManegement(cri,request));
		model.addAttribute("paging",new ProductPageMaker(cri,dao.myStoreProductCnt(cri, request)));
		return "provider/store/myProductManagement";
	}
	
	
//	private String genSaveFileName(String extName) {
//        String fileName = "";
//        
//        Calendar calendar = Calendar.getInstance();
//        fileName += calendar.get(Calendar.YEAR);
//        fileName += calendar.get(Calendar.MONTH);
//        fileName += calendar.get(Calendar.DATE);
//        fileName += calendar.get(Calendar.HOUR);
//        fileName += calendar.get(Calendar.MINUTE);
//        fileName += calendar.get(Calendar.SECOND);
//        fileName += calendar.get(Calendar.MILLISECOND);
//        fileName += extName;
//        
//        return fileName;
//    }
//	Hong
	
//	상품 예약 목록
	@RequestMapping(value = "/proReSelectAll", method = RequestMethod.GET)
	public String proReSelectAll(Model model, ProductPagingCriteria cri, HttpServletRequest request) {
		model.addAttribute("proReSelectAll", dao.proReSelectAll(request));
		model.addAttribute("paging", new ProductPageMaker(cri, dao.totalCnt(cri)));
		return "provider/store/productReservation";
	}

//  상품예약목록 상세페이지
	@RequestMapping(value = "/proReDetail" , method = RequestMethod.GET)
	public String proReDetail(Model model, ProductReservation vo, HttpServletRequest request) {
		model.addAttribute("proRe", dao.proReDetail(vo));
//	   TODO  세션 가져오기 
//		model.addAttribute("detailList", dao.proReDetailList(user));
		
		return "provider/store/productReservationDetail";
	}
	
	
//	Jo
	
 
	
	
//	Yoon
	
	
 
	
//	Lee
	
}

