package com.yedam.finalPrj.store.serviceImpl;


import java.util.List;

import org.springframework.ui.Model;

import com.yedam.finalPrj.store.vo.jo.ProductReservation;
import com.yedam.finalPrj.store.vo.jo.ReservedProductsListPagingCriteria;
import com.yedam.finalPrj.store.vo.park.ReservedGoods;
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
	public List <ReservedGoods> storeReserve(StorePagingCriteria cri);
	public ReservedGoods storeReservationDetail(StorePagingCriteria cri);
	 int numberOfReservation(StorePagingCriteria cri);
	 
	 
		
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
