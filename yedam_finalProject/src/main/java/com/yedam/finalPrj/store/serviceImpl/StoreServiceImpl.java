package com.yedam.finalPrj.store.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.store.service.Product;
import com.yedam.finalPrj.store.service.Store;
import com.yedam.finalPrj.store.service.StorePagingCriteria;
import com.yedam.finalPrj.store.service.StoreService;

@Service("StoreService")
public class StoreServiceImpl implements StoreService{
	@Autowired StoreMapper map;
//	매장등록
	@Override
	public int regist(Store store) {
		// TODO Auto-generated method stub
		return map.regist(store);
	}
//	매장출력
	@Override
	public List<Store> storeList(StorePagingCriteria cri) {
		// TODO Auto-generated method stub
		return map.storeList(cri);
	}
//	매장접근(상품목록)
	@Override
	public List<Product> selectOne(String storeNo) {
		// TODO Auto-generated method stub
		return map.selectOne(storeNo);
	}
//	매장 개수 출력
	@Override
	public int totalCnt() {
		// TODO Auto-generated method stub
		return map.totalCnt();
	}
//	매장출력(상품명검색)
	@Override
	public List<Store> searchProduct(StorePagingCriteria cri) {
		// TODO Auto-generated method stub
		return map.searchProduct(cri);
	}
//	매장출력(매장이름검색)	
	@Override
	public List<Store> searchName(StorePagingCriteria cri) {
		// TODO Auto-generated method stub
		return map.searchName(cri);
	}
//	매장출력(주소 검색)	
	@Override
	public List<Store> searchaddress(StorePagingCriteria cri) {
		// TODO Auto-generated method stub
		return map.searchaddress(cri);
	}

}
