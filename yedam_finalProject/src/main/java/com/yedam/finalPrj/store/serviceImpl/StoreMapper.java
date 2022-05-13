package com.yedam.finalPrj.store.serviceImpl;


import java.util.List;

import com.yedam.finalPrj.store.service.Product;
import com.yedam.finalPrj.store.service.Store;
import com.yedam.finalPrj.store.service.StorePagingCriteria;

public interface StoreMapper {
	public int regist(Store store);
	public List<Store> storeList(StorePagingCriteria cri);
	public List<Product> selectOne(String storeNo);
	public List<Store> searchName(StorePagingCriteria cri);
	public List<Store> searchProduct(StorePagingCriteria cri);
	public List<Store> searchaddress(StorePagingCriteria cri);
	public int totalCnt();
	
	
}
