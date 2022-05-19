package com.yedam.finalPrj.product.serviceImpl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.yedam.finalPrj.product.vo.park.Product;
import com.yedam.finalPrj.product.vo.park.ProductPagingCriteria;

public interface ProductMapper {
	
//	Park
	//상품 상세 페이지
	void search(ProductPagingCriteria cri,Model model,HttpServletRequest request);
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
	 
//	내 상품 관리
	public List<Product> myStoreProductManegement(ProductPagingCriteria cri); //cri.storeNo사용
	public int myStoreProductInsert(List<Product> list);
	public int myStoreProductUpdate(String file);
	int myStoreProductCnt(ProductPagingCriteria cri);
//	Hong


 
	
//	Jo
	
 
	
	
//	Yoon
	
	
 
	
//	Lee
	
 
 
}
