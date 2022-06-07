package com.yedam.finalPrj.product.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.yedam.finalPrj.member.service.MemberVO;
import com.yedam.finalPrj.product.vo.park.Product;
import com.yedam.finalPrj.product.vo.park.ProductPagingCriteria;
import com.yedam.finalPrj.product.vo.park.Statistics;
import com.yedam.finalPrj.product.vo.park.hong.ProductReservationVO;
import com.yedam.finalPrj.review.service.ReviewVO;

public interface ProductService {
	
	
//	Park
	//상품 상세 페이지
	void search(ProductPagingCriteria cri,Model model,HttpServletRequest request);
//	매장클릭 시 -> 상품 정보 확인
	public List<Product> selectOne(ProductPagingCriteria cri);
//	가격 검색
	public List<Product> searchPrice(ProductPagingCriteria cri);
//	상품명검색
	public List<Product> searchProduct(ProductPagingCriteria cri);
//  매장의 상품개수
	public int productCnt(int store_no);
	public int searchProductCnt(ProductPagingCriteria cri);
	public int searchPriceCnt(ProductPagingCriteria cri);
	 
//	매장 상품 검색(가격, 상품명)
	List <Product> searchPriceProdName(ProductPagingCriteria cri,Model model,HttpServletRequest reqeust);
//	내 상품 관리
	public List<Product> myStoreProductManegement(ProductPagingCriteria cri,HttpServletRequest request); //cri.storeNo사용
	void myStoreProductInsert(String file,HttpServletRequest request);
	void myStoreProductUpdate(List<HashMap<String, String>> vo);
	void myStoreProductDelete(List<HashMap<String, String>> vo);
	int myStoreProductCnt(ProductPagingCriteria cri, HttpServletRequest request);
	int oneProductInsert(Product product,HttpServletRequest request);
	void myStoreProductStockUpdate(List<HashMap<String, String>> vo,Model model,HttpServletRequest request);
	
//	파일업로드
	String productThumbnailUpdate(MultipartFile multi, HttpServletRequest request,Model model, Product vo);
	int productThumbnailDelete(HttpServletRequest request,Model model, Product vo);
	
//	통계조회
	List<ProductReservationVO> salesbyDate(int storeNo);
//	통계 날짜 검색
	List<ProductReservationVO> searchDateInStatistics(Statistics vo);
	
	int productReservationInsert(HashMap<String, String> vo,Model model,HttpServletRequest request);
	
//	Hong

//	상품예약목록 
	public List<ProductReservationVO> proReSelectAll(HttpServletRequest request);
 
//  페이징
	int totalCnt(ProductPagingCriteria cri);
	
//	상세페이지 이동
	ProductReservationVO proReDetail(ProductReservationVO vo);

//  상세페이지 상품목록
	public List<ProductReservationVO> proReDetailList(ProductReservationVO vo);
	

	
	
//	Jo
	//리뷰목록 출력.
	public List<ReviewVO> selectReviewList(String storeName);
	public int pickupComplete(int prodResNo);
	
	
//	Yoon
	
	
 
	
//	Lee
	
 
 
}
