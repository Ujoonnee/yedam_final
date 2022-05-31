package com.yedam.finalPrj.store.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.yedam.finalPrj.member.service.MemberVO;
import com.yedam.finalPrj.review.service.ReviewVO;
import com.yedam.finalPrj.store.vo.jo.ProductReservationVO;
import com.yedam.finalPrj.store.vo.jo.ResProdListPagingCriteria;
import com.yedam.finalPrj.store.vo.park.Store;
import com.yedam.finalPrj.store.vo.park.StorePagingCriteria;

public interface StoreService {
	
//	Park
	//매장등록신청
	String regist(Store store, HttpServletRequest request, MultipartFile multi, Model model); 
	String checkStoreNo(MemberVO mem, HttpServletRequest request,Model model);
	void searchApprovalList(StorePagingCriteria cri, Model model,HttpServletRequest request);
	List<Store> selectStoreRegList(StorePagingCriteria cri,HttpServletRequest request); //매장등록신청 목록조회
	List<Store> searchStoreName(StorePagingCriteria cri,HttpServletRequest request);
	List<Store> searchPname(StorePagingCriteria cri,HttpServletRequest request);
	List<Store> searchBlank(StorePagingCriteria cri,HttpServletRequest request);
	int totalApprovalStoreNameCnt(StorePagingCriteria cri);
	int totalApprovalNameCnt(StorePagingCriteria cri);
	int totalBlankCnt(StorePagingCriteria cri);
	void updateStatus(List<HashMap<String, String>> vo); //관리자-> 매장 신청 승인 및 거절

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

//		댓글 삭제
		public int deleteReply(ProductReservationVO vo);
	 

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
	 public ProductReservationVO resProdDetail(int prodResNo); 
//예약상품 상세내역(상품목록)
	 public List<ProductReservationVO> resProdDetailList(int prodResNo);
		 
	 
//페이징을 위한 전체 개수
	 int resTotalCnt(ResProdListPagingCriteria cri); //총 예약 건수
	 int storeCnt(ResProdListPagingCriteria cri); // 매장 이름 검색시 총 매장 개수
	 int prodNameCnt(ResProdListPagingCriteria cri);  // 상품명이 포함된 총 예약건 수
//리뷰페이지 상세에 같이 출력
	 public ReviewVO reviewLoad(int revNo); 
//예약 취소
	 int CancelRes(int prodResNo); // update(product_reservation테이블에서 결제상태 'N'으로, reserved_product테이블에서 반환한만큼 product테이블에서 재고수량 증가) 
	 
//		Yoon
		
		
	 
		
//		Lee
		
	 
	 
}
