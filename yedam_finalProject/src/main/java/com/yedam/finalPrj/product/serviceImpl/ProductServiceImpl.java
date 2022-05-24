package com.yedam.finalPrj.product.serviceImpl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.yedam.finalPrj.product.service.ProductService;
import com.yedam.finalPrj.product.vo.park.Product;
import com.yedam.finalPrj.product.vo.park.ProductPageMaker;
import com.yedam.finalPrj.product.vo.park.ProductPagingCriteria;
import com.yedam.finalPrj.product.vo.park.Statistics;
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


	@Override
	public void search(ProductPagingCriteria cri, Model model,HttpServletRequest request) {
		// TODO Auto-generated method stub
		String store_no =  (String) (request.getParameter("store_no"));
		System.out.println("/상품페이지/ 매장번호 값 확인: "+store_no);	
		
//		option 값에 따른 sql 구문 출력.
		if(cri.getType().equals("prod_name")) {
			model.addAttribute("products", searchProduct(cri));
			model.addAttribute("paging",new ProductPageMaker(cri, searchProductCnt(cri)));
			
		} else if(cri.getType().equals("price")) {
//			가격검색 아직 구현 X 에러방지 기본값
			cri.setLowPrice(0);
			cri.setHighPrice(100000);
			model.addAttribute("products", searchProduct(cri));
			model.addAttribute("paging",new ProductPageMaker(cri,  searchPriceCnt(cri)));
			
		} else {
			model.addAttribute("products" ,selectOne(cri));
			model.addAttribute("paging",new ProductPageMaker(cri, productCnt(store_no)));
		}
		
	}
	@Override
	public List<Product> myStoreProductManegement(ProductPagingCriteria cri) {
		// TODO Auto-generated method stub
		
		cri.setStoreNo("4");
		System.out.println(cri.getStoreNo());
		return map.myStoreProductManegement(cri);
	}
	@Override
	public int myStoreProductCnt(ProductPagingCriteria cri) {
		// TODO Auto-generated method stub
		cri.setStoreNo("4");
		return map.myStoreProductCnt(cri);
	}
	
	@Override
	public void myStoreProductInsert(String file) {
		file = file.replace("제품명","prodName");
		file = file.replace("상품상태","status");
		file = file.replace("가격","price");
		file = file.replace("재고","stock");
		file = file.replace("제품 카테고리","prodCat");
		System.out.println("replace 후 파일 값"+file);
		System.out.println("Impl라인");
		Gson gson = new Gson();
		List<Product> list = gson.fromJson(file, new TypeToken<List<Product>>() {}.getType());
		for (Product product : list) {
			System.out.println("for시작");
			System.out.println(product.getProdName());
			System.out.println(product.getProdCat());
			System.out.println(product.getPrice());
			System.out.println(product.getStock());
			System.out.println("for끝");
			map.myStoreProductInsert(product);
		}
		System.out.println("for문 전체 끝" );

		// TODO Auto-generated method stub
	}
	@Override
	public void myStoreProductUpdate(List<HashMap<String, String>> vo) {
		System.out.println(vo);
		for (HashMap<String, String> list : vo) {
			map.myStoreProductUpdate(list);
			
		}
		// TODO Auto-generated method stub
	}
	@Override
	public void myStoreProductDelete(List<HashMap<String, String>> vo) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public List<ProductReservation> salesbyDate(int storeNo) {
		// TODO Auto-generated method stub
		return map.salesbyDate(storeNo);
	}
	@Override
	public List<ProductReservation> searchDateInStatistics(Statistics vo) {
		// TODO Auto-generated method stub
		return map.searchDateInStatistics(vo);
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
