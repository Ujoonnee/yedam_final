package com.yedam.finalPrj.product.serviceImpl;

import java.util.List;

import com.yedam.finalPrj.product.service.Product;
import com.yedam.finalPrj.product.service.ProductPagingCriteria;

public interface ProductMapper {
	//상품 상세 페이지
//	매장클릭 시 -> 상품 정보 확인
	public List<Product> selectOne(ProductPagingCriteria cri);
//	가격 검색
	public List<Product> searchPrice(ProductPagingCriteria cri);
//	상품명검색
	public List<Product> searchProduct(ProductPagingCriteria cri);
//  매장의 상품개수
	public int productCnt(String prodNo);
	public int searchProductCnt(ProductPagingCriteria cri);
	public int searchPriceCnt(ProductPagingCriteria cri);
}
