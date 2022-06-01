package com.yedam.finalPrj.store.serviceImpl;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.yedam.finalPrj.member.service.MemberVO;
import com.yedam.finalPrj.review.service.ReviewVO;
import com.yedam.finalPrj.store.vo.jo.ProductReservationVO;
import com.yedam.finalPrj.store.vo.jo.ResProdListPagingCriteria;
import com.yedam.finalPrj.store.vo.park.Store;
import com.yedam.finalPrj.store.vo.park.StorePagingCriteria;

public interface StoreMapper {
	//매장등록신청
	public int regist(Store store);
	String checkStoreNo(MemberVO mem);

	void searchApprovalList(StorePagingCriteria cri, Model model,HttpServletRequest request);
	List<Store> selectStoreRegList(StorePagingCriteria cri); //매장등록신청 목록조회
	List<Store> searchStoreName(StorePagingCriteria cri);
	List<Store> searchPname(StorePagingCriteria cri);
	List<Store> searchBlank(StorePagingCriteria cri);
	int totalApprovalStoreNameCnt(StorePagingCriteria cri);
	int totalApprovalNameCnt(StorePagingCriteria cri);
	int totalBlankCnt(StorePagingCriteria cri);
	int updateStatus(HashMap<String, String> list); //관리자-> 매장 신청 승인 및 거절
	
//	매장 들어갈 시 리스트 출력
	public List<Store> storeList(StorePagingCriteria cri);
//  매장 검색(매장명, 매장 카테고리, 상품명)
	public List<Store> searchName(StorePagingCriteria cri);
	public List<Store> searchProduct(StorePagingCriteria cri);
	public List<Store> searchaddress(StorePagingCriteria cri);
//	페이징을 위한 전체 개수
	public int totalCnt();
	public int totalNameCnt(StorePagingCriteria cri);
	public int totalCatCnt(StorePagingCriteria cri);
	public int totalProdCnt(StorePagingCriteria cri);
	
//	매장 예약 페이지
	/*
	 * public List <ReservedProducts> storeReserve(StorePagingCriteria cri); public
	 * ReservedProducts storeReservationDetail(StorePagingCriteria cri);
	 */
	 int numberOfReservation(StorePagingCriteria cri);
	 
	 
		
//		Hong

//		댓글 삭제
		public int deleteReply(int revNo);
		
	 

		
//		Jo
	 
//예약 상품 목록 들어갈 시 리스트 출력
	 public List<ProductReservationVO> resProdList(ResProdListPagingCriteria cri);
//상품 예약 검색(매장이름, 상품명)		 
	 public List<ProductReservationVO> selectResProdListByStoreName(ResProdListPagingCriteria cri);
	 public List<ProductReservationVO> selectResProdListByProdName(ResProdListPagingCriteria cri);
	 
	 
//상품예약번호로 상품명 찾아오기	 
	 public String findProdNameByProdResNo(int prodResNo);
//예약상품 상세내역 
	 public ProductReservationVO resProdDetail(int prodResNo); 
//예약상품 상세내역(상품목록)
	 public List<ProductReservationVO> resProdDetailList(int prodResNo);
	 
//페이징을 위한 전체 개수
	public int resTotalCnt(int memNO); //총 예약 건수
	public int storeCnt(ResProdListPagingCriteria cri); // 매장 이름 검색시 총 매장 개수
	public int prodNameCnt(ResProdListPagingCriteria cri);  // 상품명이 포함된 총 예약건 수 
//리뷰페이지 상세에 같이 출력
	 public ReviewVO reviewLoad(int revNo);	
//예약 취소
	public int CancelRes(int prodResNo);	
	public void CancelRes2(@Param("storeNo") int storeNo, @Param("prodNo") String prodNo);
	


//		Yoon



		
		
	 
		
//		Lee
		
	 
	 
}