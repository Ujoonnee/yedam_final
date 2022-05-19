package com.yedam.finalPrj.store.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.yedam.finalPrj.store.service.StoreService;
import com.yedam.finalPrj.store.vo.jo.ProductReservation;
import com.yedam.finalPrj.store.vo.jo.ReservedProductsListPagingCriteria;
import com.yedam.finalPrj.store.vo.park.Store;
import com.yedam.finalPrj.store.vo.park.StorePageMaker;
import com.yedam.finalPrj.store.vo.park.StorePagingCriteria;

@Service("StoreService")
public class StoreServiceImpl implements StoreService{
	@Autowired StoreMapper map;
	
	
//	Park
//	매장등록
	@Override
	public int regist(Store store) {
		// TODO Auto-generated method stub
		return map.regist(store);
	}
//	매장출력
	@Override
	public List<Store> storeList(StorePagingCriteria cri) {
		if(cri.getLatitude() == "" || cri.getLongitude() == "") {
			cri.setLatitude("30.8690794214");
			cri.setLongitude("128.5942180675");
		}
		// TODO Auto-generated method stub
		return map.storeList(cri);
	}

//	매장 개수 출력
	@Override
	public int totalCnt() {
		// TODO Auto-generated method stub
		return map.totalCnt();
	}
//	매장출력(상품명검색)
	@Override
	public void search(StorePagingCriteria cri, Model model) {

		if(cri.getType().equals("prod_name")) {
			
			model.addAttribute("storeList", searchProduct(cri));
			model.addAttribute("paging", new StorePageMaker(cri, totalProdCnt(cri)));
			
		} else if(cri.getType().equals("name")) {
			
			model.addAttribute("storeList",searchName(cri));
			model.addAttribute("paging",new StorePageMaker(cri,totalNameCnt(cri)));
			
		} else if(cri.getType().equals("store_cat")) {
			 
			model.addAttribute("storeList",searchaddress(cri));
			model.addAttribute("paging",new StorePageMaker(cri,totalCatCnt(cri)));
			
		} else {
			
			model.addAttribute("storeList", storeList(cri));
			model.addAttribute("paging",new StorePageMaker(cri, totalCnt()));
			
		}
	}
	@Override
	public List<Store> searchProduct(StorePagingCriteria cri) {
		// TODO Auto-generated method stub
		return map.searchProduct(cri);
	}
//	매장출력(매장이름검색)	
	@Override
	public List<Store> searchName(StorePagingCriteria cri) {
		// TODO Auto-generated method stub
		return map.searchName(cri);
	}
//	매장출력(주소 검색)	
	@Override
	public List<Store> searchaddress(StorePagingCriteria cri) {
		// TODO Auto-generated method stub
		return map.searchaddress(cri);
	}
	@Override
	public int totalNameCnt(StorePagingCriteria cri) {
		// TODO Auto-generated method stub
		return map.totalNameCnt(cri);
	}
	@Override
	public int totalCatCnt(StorePagingCriteria cri) {
		// TODO Auto-generated method stub
		return map.totalCatCnt(cri);
	}
	@Override
	public int totalProdCnt(StorePagingCriteria cri) {
		// TODO Auto-generated method stub
		return map.totalProdCnt(cri);
	}
	


//	Hong

	 

	
//	Jo
	@Override
	public List<ProductReservation> reservedProductsList(ReservedProductsListPagingCriteria cri) {
		System.out.println("매장번호 출력하기.");
		System.out.println(map.reservedProductsList(cri));
		System.out.println("매장번호 출력하기.");
		return map.reservedProductsList(cri);
	}
	@Override
	public List<ProductReservation> selectResProdListByStoreName(ReservedProductsListPagingCriteria cri, Model model) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<ProductReservation> resProdListByProdName(ReservedProductsListPagingCriteria cri, Model model) {
		// TODO Auto-generated method stub
		return null;
	}
	
 
	
//	Yoon
	
	
 
	
//	Lee
}

