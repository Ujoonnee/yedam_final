package com.yedam.finalPrj.product.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.product.service.Product;
import com.yedam.finalPrj.product.service.ProductService;

@Service("ProductService")
public class ProductServiceImpl implements ProductService {
	@Autowired ProductMapper map;
	
//	매장의 상품 개수
	@Override
	public int ProcutCnt(String prodNo) {
		// TODO Auto-generated method stub
		return map.ProcutCnt(prodNo);
	}
//	매장접근(상품목록)
	@Override
	public List<Product> selectOne(String storeNo) {
		// TODO Auto-generated method stub
		return map.selectOne(storeNo);
	}

}
