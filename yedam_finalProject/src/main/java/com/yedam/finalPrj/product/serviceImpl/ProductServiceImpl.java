package com.yedam.finalPrj.product.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.MapUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yedam.finalPrj.product.service.ProductService;
import com.yedam.finalPrj.product.vo.park.Product;
import com.yedam.finalPrj.product.vo.park.ProductPageMaker;
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
			cri.setHighPrice(10000);
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
		
		cri.setStoreNo("1");
		System.out.println(cri.getStoreNo());
		return map.myStoreProductManegement(cri);
	}
	@Override
	public int myStoreProductCnt(ProductPagingCriteria cri) {
		// TODO Auto-generated method stub
		cri.setStoreNo("1");
		return map.myStoreProductCnt(cri);
	}
	
	@Override
	public int myStoreProductInsert(String file) {
		JSONParser parser = new JSONParser();
		try {
			JSONObject jsonObject = (JSONObject) parser.parse(file);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		ObjectMapper objectMapper = new ObjectMapper();
		List<String>prodName = null;
		List<String>prodCat = null;
		List<String>price = null;
		List<String>stock = null;
		System.out.println("Impl");
		try {
			List<Map<String,Object>> readValue = objectMapper.readValue(file,
					new TypeReference<List<Map<String,Object>>>(){});
			
			System.out.println("readValue크기"+readValue.size());
			System.out.println("readValue값"+readValue);
			
			for(Map<String,Object>map : readValue) {
				MapUtils.debugPrint(System.out,"map",map);
				
				
				prodName=(List<String>)map.get("prodName");
				prodCat=(List<String>)map.get("prodCat");
				price=(List<String>)map.get("price");
				stock=(List<String>)map.get("stock");
				
				System.out.println(prodName.get(0));
				System.out.println(prodCat.get(1));
				System.out.println(price.get(2));
				System.out.println(stock.get(3));
			}
			
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for(int i = 0; i< prodName.size(); i++) {
			System.out.println(prodName.get(i));
			System.out.println(prodCat.get(i));
			System.out.println(price.get(i));
			System.out.println(stock.get(i));
			
		}
		
		// TODO Auto-generated method stub
		return map.myStoreProductInsert(null);
	}
	@Override
	public int myStoreProductUpdate(String file) {
		
		// TODO Auto-generated method stub
		return map.myStoreProductUpdate(file);
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
