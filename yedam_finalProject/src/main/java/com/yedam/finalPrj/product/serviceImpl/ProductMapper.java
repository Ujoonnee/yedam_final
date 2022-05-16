package com.yedam.finalPrj.product.serviceImpl;

import java.util.List;

import com.yedam.finalPrj.product.service.Product;

public interface ProductMapper {
	//상품 상세 페이지
//	매장클릭 시 -> 상품 정보 확인
	public List<Product> selectOne(String storeNo);
//  매장의 상품개수
	public int ProcutCnt(String prodNo);
}
