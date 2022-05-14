package com.yedam.finalPrj.store.service;

import java.util.List;

public interface StoreService {
	public int regist(Store store);
	public List<Store> storeList(StorePagingCriteria cri);
	public List<Product> selectOne(String storeNo);
	public List<Store> searchName(StorePagingCriteria cri);
	public List<Store> searchProduct(StorePagingCriteria cri);
	public List<Store> searchaddress(StorePagingCriteria cri);
	public int totalCnt();
	
}
