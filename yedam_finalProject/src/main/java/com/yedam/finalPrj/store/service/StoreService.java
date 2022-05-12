package com.yedam.finalPrj.store.service;

import java.util.List;

public interface StoreService {
	public int regist(Store store);
	public List<Store> storeList();
	public List<Product> selectOne(String storeNo);
	public int totalCnt();
}
