package com.yedam.finalPrj.product.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.yedam.finalPrj.product.vo.park.hong.ProductReservationVO;
import com.yedam.finalPrj.review.service.ReviewService;
import com.yedam.finalPrj.store.service.StoreService;



@Controller
@RequestMapping("/store/product/*")
public class ProductController {

	@Autowired ProductService dao;
	MemberServiceImpl impl;
	@Autowired StoreService storeService;
	// park
//	매장 상세정보(선택한 매장페이지)
	@RequestMapping(value = "/productView", method = RequestMethod.GET)
	public String Storeview(ProductPagingCriteria cri,Model model,HttpServletRequest request) {
		System.out.println(cri.getStoreNo());
		System.out.println(cri.getStoreName());
		HttpSession session =  request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		if (user == null) {
			model.addAttribute("products" ,dao.selectOne(cri));
			model.addAttribute("paging",new ProductPageMaker(cri, dao.productCnt(cri.getStoreNo())));
			return "main/store/storeView";
		}else {
		System.out.println(user.getName());
		
		model.addAttribute("memNo",user.getMemNo());
		model.addAttribute("name",user.getName());
		model.addAttribute("email",user.getEmail());
		model.addAttribute("tel",user.getTel());
		model.addAttribute("address",user.getAddress());
		model.addAttribute("products" ,dao.selectOne(cri));
		model.addAttribute("paging",new ProductPageMaker(cri, dao.productCnt(cri.getStoreNo())));
		
		//By JO, 매장명 받아서 review 목록 출력.
		System.out.println("++++++++++++++++++++++++");
		System.out.println(cri.getStoreName()); 
		model.addAttribute("reviewList", dao.selectReviewList(cri.getStoreName()));
		return "main/store/storeView";
		}
	}
//	결제정보전달
	@RequestMapping("paymenInformation")
	public String PaymentInformation(@RequestBody HashMap<String,String> vo,ProductPagingCriteria cri,Model model,HttpServletRequest request) {
		System.out.println(cri.getStoreNo());
		System.out.println("=================vo"+vo);
		
		dao.productReservationInsert(vo, model, request); //예약등록
		dao.myStoreProductStockUpdate(vo, model, request); //재고수정
		
		
		model.addAttribute("products" ,dao.selectOne(cri));
		model.addAttribute("paging",new ProductPageMaker(cri, dao.productCnt(cri.getStoreNo())));
		return "main/store/storeView";
	}
	
//  상품 검색
	@RequestMapping(value = "searchProduct",method = {RequestMethod.GET})
	public String searchProduct(ProductPagingCriteria cri,Model model,HttpServletRequest request) {
		System.out.println("cri getStoreNo : "+ cri.getStoreNo());
		System.out.println("cri getStoreName : "+ cri.getStoreName());
		model.addAttribute("products",	dao.searchPriceProdName(cri, model, request));
		model.addAttribute("paging",new ProductPageMaker(cri, dao.productCnt(cri.getStoreNo())));


//		type,store_no,keyword
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
//			product 가 null이면 매장이없음, product가 size가 0이면 제품이 없음. 
			List<Product> productList = dao.myStoreProductManegement(cri,request);
			model.addAttribute("ProductList",productList);
			if (productList != null) {
				model.addAttribute("paging",new ProductPageMaker(cri,dao.myStoreProductCnt(cri, request)));
			}
			return "provider/store/myProductManagement";
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
	@RequestMapping(value = "thumbnailUpdate", method = RequestMethod.POST)
	public String ThumbnailUpdate(@RequestParam("prodThumbnail") MultipartFile multi, @RequestParam("prodNo") long prodNo ,HttpServletRequest request,ProductPagingCriteria cri,HttpServletResponse response, Model model) throws Exception {
		System.out.println("prodNo : "+prodNo);
		
		Product productVO = new Product();
		productVO.setProdNo(prodNo);
		
		dao.productThumbnailUpdate(multi,request,model,productVO);
		
		model.addAttribute("ProductList",dao.myStoreProductManegement(cri,request));
		model.addAttribute("paging",new ProductPageMaker(cri,dao.myStoreProductCnt(cri, request)));
		return "provider/store/myProductManagement";
	}
//  등록된 사진 제거
	@RequestMapping(value = "thumbnailDelete", method = RequestMethod.POST)
	public String ThumbnailDelete(@RequestParam("prodThumbnail") String thumbnail,@RequestParam("prodNo") long prodNo ,HttpServletRequest request,ProductPagingCriteria cri, Model model) {
		Product vo = new Product();
		System.err.println("============No,Thumbnail 값 확인==========");
		System.out.println(thumbnail);
		System.out.println(prodNo);
		
		vo.setProdThumbnail(thumbnail);
		vo.setProdNo(prodNo);
		
		dao.productThumbnailDelete(request, model, vo);
		
		model.addAttribute("ProductList",dao.myStoreProductManegement(cri,request));
		model.addAttribute("paging",new ProductPageMaker(cri,dao.myStoreProductCnt(cri, request)));
		return "provider/store/myProductManagement";
	}
	
	
//	hong
//	상품 예약 목록
	@RequestMapping(value = "/proReSelectAll", method = RequestMethod.GET)
	public String proReSelectAll(Model model, ProductPagingCriteria cri, HttpServletRequest request) {
		model.addAttribute("proReSelectAll", dao.proReSelectAll(request));
		model.addAttribute("paging", new ProductPageMaker(cri, dao.totalCnt(cri)));
		
		return "provider/store/productReservation";
	}

//  상품예약목록 상세페이지
	@RequestMapping(value = "/proReDetail" , method = RequestMethod.GET)
	public String proReDetail( Model model, ProductReservationVO vo) {
		
		//	   TODO  세션 가져오기 
		model.addAttribute("proRe", dao.proReDetail(vo));
		
		int ResNo = dao.proReDetail(vo).getProdResNo();
		model.addAttribute("proReDetail", dao.proReDetailList(vo));
		model.addAttribute("reviewList", storeService.reviewLoad(ResNo)); //store 패키지에서 가져옴.
		model.addAttribute("pickupStatus", dao.proReDetail(vo)); //상품 픽업 상태 파악.
		return "provider/store/productReservationDetail";
	}
	

	
	
//	Jo
//사업자가 픽업완료 처리
	@PostMapping("pickupComplete")
	@ResponseBody
	public int pickupComplete(Model model, int prodResNo) {

		return dao.pickupComplete(prodResNo);
	}
//사업자가 매장상품 주문 취소
	@PostMapping("cancelRes")
	@ResponseBody
	public int cancelRes(Model model, int prodResNo) {
		return dao.cancelRes(prodResNo);
	}
//	Yoon
	
	
 
	
//	Lee
	
}

