package com.yedam.finalPrj.store.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.yedam.finalPrj.member.service.MemberVO;
import com.yedam.finalPrj.review.service.ReviewVO;
import com.yedam.finalPrj.store.vo.jo.ProductReservationVO;
import com.yedam.finalPrj.store.vo.jo.ResProdListPagingCriteria;
import com.yedam.finalPrj.store.vo.park.Store;
import com.yedam.finalPrj.store.vo.park.StorePagingCriteria;

public interface StoreService {
	
//	Park
	int regist(Store store, HttpServletRequest request);
//	매장 들어갈 시 리스트 출력
	List<Store> storeList(StorePagingCriteria cri);
//  매장 검색(매장명, 매장 카테고리, 상품명)
	void search(StorePagingCriteria cri, Model model);
	
	 List<Store> searchName(StorePagingCriteria cri);
	 List<Store> searchProduct(StorePagingCriteria cri);
	 List<Store> searchaddress(StorePagingCriteria cri);
//	페이징을 위한 전체 개수
	 int totalCnt();
	 int totalNameCnt(StorePagingCriteria cri);
	 int totalCatCnt(StorePagingCriteria cri);
	 int totalProdCnt(StorePagingCriteria cri);
	

		
//		Hong



//		Jo
//	예약상품 목록조회 들어갈 시 리스트 출력
	List<ProductReservationVO> resProdList(ResProdListPagingCriteria cri);
	 
//상품 예약 검색(매장이름, 상품명)		 
	 void search(ResProdListPagingCriteria cri, Model model);
	 
	 List<ProductReservationVO> selectResProdListByStoreName(ResProdListPagingCriteria cri);
	 List<ProductReservationVO> selectResProdListByProdName(ResProdListPagingCriteria cri);
	 
//상품예약번호로 상품명 찾아오기	 
	 public String findProdNameByProdResNo(int prodResNo);
		
//예약상품 상세내역 
	 public ProductReservationVO resProdDetail(long prodResNo); 
//예약상품 상세내역(상품목록)
	 public List<ProductReservationVO> resProdDetailList(long prodResNo);
		 
	 
//페이징을 위한 전체 개수
	 int resTotalCnt(ResProdListPagingCriteria cri); //총 예약 건수
	 int storeCnt(ResProdListPagingCriteria cri); // 매장 이름 검색시 총 매장 개수
	 int prodNameCnt(ResProdListPagingCriteria cri);  // 상품명이 포함된 총 예약건 수
//리뷰페이지 상세에 같이 출력
	 public List<ReviewVO> reviewLoad(long selectedResNo); 
	 
	 
//		Yoon
		
		
	 
		
//		Lee
		
	 
	 
}
