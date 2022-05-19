
package com.yedam.finalPrj.store.service;

import java.util.List;

import org.springframework.ui.Model;

import com.yedam.finalPrj.store.vo.jo.ProductReservation;
import com.yedam.finalPrj.store.vo.jo.ReservedProductsListPagingCriteria;
import com.yedam.finalPrj.store.vo.park.Store;
import com.yedam.finalPrj.store.vo.park.StorePagingCriteria;

public interface StoreService {
	
//	Park
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
	

		
//		Hong


	 
		
//		Jo
//예약 상품 목록 들어갈 시 리스트 출력
	 List<ProductReservation> reservedProductsList(ReservedProductsListPagingCriteria cri);
//검색 리스트 출력(매장이름으로, 상품명으로)		 
	 public List<ProductReservation> selectResProdListByStoreName(ReservedProductsListPagingCriteria cri, Model model);
	 public List<ProductReservation> resProdListByProdName(ReservedProductsListPagingCriteria cri, Model model);
		
//		Yoon
		
		
	 
		
//		Lee
		
	 
	 
}