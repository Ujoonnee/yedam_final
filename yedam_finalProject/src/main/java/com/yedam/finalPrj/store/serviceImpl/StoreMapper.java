package com.yedam.finalPrj.store.serviceImpl;

import java.util.List;

import com.yedam.finalPrj.store.service.Product;
import com.yedam.finalPrj.store.service.Store;

public interface StoreMapper {
	public int regist(Store store);
	public List<Store> storeList();
	public List<Product> selectOne(String storeNo);
	public int totalCnt();
}
