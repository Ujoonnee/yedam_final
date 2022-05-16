package com.yedam.finalPrj.product.service;

import java.util.List;

public interface ProductService {

	//상품 상세 페이지
//	매장클릭 시 -> 상품 정보 확인
	public List<Product> selectOne(String storeNo);
//  매장의 상품개수
	public int ProcutCnt(String prodNo);
}
