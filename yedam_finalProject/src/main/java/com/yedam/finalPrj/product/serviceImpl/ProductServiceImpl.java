package com.yedam.finalPrj.product.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.product.service.ProductService;
import com.yedam.finalPrj.product.vo.park.Product;
import com.yedam.finalPrj.product.vo.park.ProductPagingCriteria;
import com.yedam.finalPrj.product.vo.park.hong.ProductReservation;



@Service("ProductService")
public class ProductServiceImpl implements ProductService {
	@Autowired ProductMapper map;
	
//	Park
//	매장의 상품 개수
	@Override
	public int productCnt(String prodNo) {
		// TODO Auto-generated method stub
		return map.productCnt(prodNo);
	}
//	매장접근(상품목록)
	@Override
	public List<Product> selectOne(ProductPagingCriteria cri) {
		// TODO Auto-generated method stub
		return map.selectOne(cri);
	}
	@Override
	public List<Product> searchPrice(ProductPagingCriteria cri) {
		// TODO Auto-generated method stub
		return map.searchPrice(cri);
	}
	@Override
	public List<Product> searchProduct(ProductPagingCriteria cri) {
		// TODO Auto-generated method stub
		return map.searchProduct(cri);
	}
	@Override
	public int searchProductCnt(ProductPagingCriteria cri) {
		// TODO Auto-generated method stub
		return map.searchProductCnt(cri);
	}
	@Override
	public int searchPriceCnt(ProductPagingCriteria cri) {
		// TODO Auto-generated method stub
		return map.searchPriceCnt(cri);
	}
	
	 
	
//	Hong


	@Override
	public List<ProductReservation> proReSelectAll() {
		// TODO Auto-generated method stub
		return map.proReSelectAll();
	}
	@Override
	public int totalCnt(ProductPagingCriteria cri) {
		// TODO Auto-generated method stub
		return map.totalCnt(cri);
	}
	@Override
	public ProductReservation proReDetail(ProductReservation vo) {
		// TODO Auto-generated method stub
		return map.proReDetail(vo);
	}
	@Override
	public List<ProductReservation> proReDetailList() {
		// TODO Auto-generated method stub
		return map.proReDetailList();
	}

	
//	Jo
	
 
	
	
//	Yoon
	
	
 
	
//	Lee
	
 
 
	

}
