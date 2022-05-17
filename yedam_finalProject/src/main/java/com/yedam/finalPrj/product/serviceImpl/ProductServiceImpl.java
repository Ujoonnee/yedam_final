package com.yedam.finalPrj.product.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.product.service.Product;
import com.yedam.finalPrj.product.service.ProductPagingCriteria;
import com.yedam.finalPrj.product.service.ProductService;



@Service("ProductService")
public class ProductServiceImpl implements ProductService {
	@Autowired ProductMapper map;
	
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

}
