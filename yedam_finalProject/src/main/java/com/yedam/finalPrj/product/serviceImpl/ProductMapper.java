package com.yedam.finalPrj.product.serviceImpl;

import java.util.List;

import com.yedam.finalPrj.product.vo.park.Product;
import com.yedam.finalPrj.product.vo.park.ProductPagingCriteria;
import com.yedam.finalPrj.product.vo.park.hong.ProductReservation;

public interface ProductMapper {
	
//	Park
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
	 
	
//	Hong
	// 상품예약목록 
	public List<ProductReservation> proReSelectAll();

//  페이징
	int totalCnt(ProductPagingCriteria cri);
	
//	상세페이지 이동
	ProductReservation proReDetail(ProductReservation vo);

//  상세페이지 상품목록
	public List<ProductReservation> proReDetailList();
	
//	Jo
	
 
	
	
//	Yoon
	
	
 
	
//	Lee
	
 
 
}
