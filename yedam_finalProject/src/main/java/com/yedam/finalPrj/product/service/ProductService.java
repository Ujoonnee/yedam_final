package com.yedam.finalPrj.product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.finalPrj.product.vo.park.Product;
import com.yedam.finalPrj.product.vo.park.ProductPagingCriteria;
import com.yedam.finalPrj.product.vo.park.Statistics;
import com.yedam.finalPrj.product.vo.park.hong.ProductReservation;

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
	 
//	내 상품 관리
	public List<Product> myStoreProductManegement(ProductPagingCriteria cri,HttpServletRequest request); //cri.storeNo사용
	void myStoreProductInsert(String file);
	void myStoreProductUpdate(List<HashMap<String, String>> vo);
	void myStoreProductDelete(List<HashMap<String, String>> vo);
	int myStoreProductCnt(ProductPagingCriteria cri, HttpServletRequest request);
	int oneProductInsert(Product product);
//	파일업로드
	
	void myStoreProductUpdate(MultipartFile multi, Model model, Product vo);
	
//	통계조회
	List<ProductReservation> salesbyDate(int storeNo);
//	통계 날짜 검색
	List<ProductReservation> searchDateInStatistics(Statistics vo);
	
	
	
//	Hong

//	상품예약목록 
	public List<ProductReservation> proReSelectAll(HttpServletRequest request);
 
//  페이징
	int totalCnt(ProductPagingCriteria cri);
	
//	상세페이지 이동
	ProductReservation proReDetail(ProductReservation vo);
//  상세페이지 상품목록
	public List<ProductReservation> proReDetailList();
	
//	Jo
	
 
	
	
//	Yoon
	
	
 
	
//	Lee
	
 
 
}
