package com.yedam.finalPrj.store.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.store.service.Store;
import com.yedam.finalPrj.store.service.StoreService;

@Service("StoreService")
public class StoreServiceImpl implements StoreService{
	@Autowired StoreMapper map;

	@Override
	public int regist(Store store) {
		// TODO Auto-generated method stub
		return map.regist(store);
	}


}
