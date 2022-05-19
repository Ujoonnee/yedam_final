package com.yedam.finalPrj.store.service;

import java.util.List;

import org.springframework.ui.Model;

public interface StoreService {
	 int regist(Store store);
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
	
//	매장 예약 페이지
	 List <ReservedGoods> storeReserve(StorePagingCriteria cri);
	 ReservedGoods storeReservationDetail(StorePagingCriteria cri);
	 int numberOfReservation(StorePagingCriteria cri);

}
