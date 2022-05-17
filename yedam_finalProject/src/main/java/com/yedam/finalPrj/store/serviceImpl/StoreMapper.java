package com.yedam.finalPrj.store.serviceImpl;


import java.util.List;

import com.yedam.finalPrj.store.service.Store;
import com.yedam.finalPrj.store.service.StorePagingCriteria;

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
	

}
