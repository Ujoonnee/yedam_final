package com.yedam.finalPrj.store.serviceImpl;


import java.util.List;

import com.yedam.finalPrj.store.vo.jo.ProductReservation;
import com.yedam.finalPrj.store.vo.jo.ResProdListPagingCriteria;
import com.yedam.finalPrj.store.vo.park.Store;
import com.yedam.finalPrj.store.vo.park.StorePagingCriteria;

public interface StoreMapper {
	public int regist(Store store);
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

	 

		
//		Jo
	 
//예약 상품 목록 들어갈 시 리스트 출력
	 public List<ProductReservation> resProdList(ResProdListPagingCriteria cri);		
//상품 예약 검색(매장이름, 상품명)		 
	 public List<ProductReservation> selectResProdListByStoreName(ResProdListPagingCriteria cri);
	 public List<ProductReservation> selectResProdListByProdName(ResProdListPagingCriteria cri);
	 
	 
//상품예약번호로 상품명 찾아오기	 
	 public String findProdNameByProdResNo(int prodResNo);
//예약상품 상세내역 
	 public List<ProductReservation> resProdDetail(long prodResNo); 
//예약상품 상세내역(상품목록)
	 public List<ProductReservation> resProdDetailList(long prodResNo);
	 
//페이징을 위한 전체 개수
	public int resTotalCnt(); //총 예약 건수
	public int storeCnt(ResProdListPagingCriteria cri); // 매장 이름 검색시 총 매장 개수
	public int prodNameCnt(ResProdListPagingCriteria cri);  // 상품명이 포함된 총 예약건 수 
	
	
//		Yoon
		
		
	 
		
//		Lee
		
	 
	 
}