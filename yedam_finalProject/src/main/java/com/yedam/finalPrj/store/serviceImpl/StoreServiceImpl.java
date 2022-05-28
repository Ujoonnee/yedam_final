package com.yedam.finalPrj.store.serviceImpl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.yedam.finalPrj.member.service.MemberService;
import com.yedam.finalPrj.member.service.MemberVO;
import com.yedam.finalPrj.review.service.ReviewVO;
import com.yedam.finalPrj.store.service.StoreService;
import com.yedam.finalPrj.store.vo.jo.ProductReservationVO;
import com.yedam.finalPrj.store.vo.jo.ResProdListPageMaker;
import com.yedam.finalPrj.store.vo.jo.ResProdListPagingCriteria;
import com.yedam.finalPrj.store.vo.park.Store;
import com.yedam.finalPrj.store.vo.park.StorePageMaker;
import com.yedam.finalPrj.store.vo.park.StorePagingCriteria;


@Service
public class StoreServiceImpl implements StoreService{
	@Autowired StoreMapper map;
	@Autowired MemberService service;
	
//	Park
//	매장등록
	@Override
	public int regist(Store store, HttpServletRequest request) {
		
		// TODO Auto-generated method stub
		service.getCurrentUser(request);
		MemberVO user = (MemberVO) request.getAttribute("user");
		System.out.println(user.getMemNo());
		store.setMemNo(user.getMemNo());
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
	
//예약상품목록 출력
	@Override
	public List<ProductReservationVO> resProdList(ResProdListPagingCriteria cri) {
	
		return map.resProdList(cri);
	}
//총 예약건수 출력
	@Override
	public int resTotalCnt(ResProdListPagingCriteria cri) {

		return map.resTotalCnt(cri.getMemNo());
	}
//예약 건 출력(매장이름/상품명 검색시)
	@Override
	public void search(ResProdListPagingCriteria cri, Model model) {
		
		if(cri.getType().equals("name")) {
			
			model.addAttribute("resProdList", selectResProdListByStoreName(cri));
			model.addAttribute("paging", new ResProdListPageMaker(cri, storeCnt(cri)));
			
		}else if(cri.getType().equals("prodName")){
			
			model.addAttribute("resProdList", selectResProdListByProdName(cri));
			model.addAttribute("paging",new ResProdListPageMaker(cri, prodNameCnt(cri)));
			
		}else {
			model.addAttribute("resProdList", resProdList(cri));
			model.addAttribute("paging",new ResProdListPageMaker(cri, resTotalCnt(cri)));
		}		
	}
//예약상품 리스트 출력(매장이름 검색)	
	@Override
	public List<ProductReservationVO> selectResProdListByStoreName(ResProdListPagingCriteria cri) {
		return map.selectResProdListByStoreName(cri);
	}
//예약상품 리스트 출력(상품명 검색)	
	@Override
	public List<ProductReservationVO> selectResProdListByProdName(ResProdListPagingCriteria cri) {
		return map.selectResProdListByProdName(cri);
	}
	@Override
	public String findProdNameByProdResNo(int prodResNo) {
		return map.findProdNameByProdResNo(prodResNo);
	}
//예약 건수 출력(매장이름검색)
	@Override
	public int storeCnt(ResProdListPagingCriteria cri) {
		return map.storeCnt(cri);
	}
//예약 건수 출력(상품명 검색)
	@Override
	public int prodNameCnt(ResProdListPagingCriteria cri) {
		return map.prodNameCnt(cri);
	}
	
//예약상품 상세내역 
	@Override
	public ProductReservationVO resProdDetail(int prodResNo) {
		return map.resProdDetail(prodResNo);
	}
//예약상품 상세내역(상품목록)
	@Override
	public List<ProductReservationVO> resProdDetailList(int prodResNo) {
		return map.resProdDetailList(prodResNo);
	}
//리뷰페이지 상세에 같이 출력
	@Override
	public ReviewVO reviewLoad(int revNo) {
		return map.reviewLoad(revNo);
	}

	
//	Yoon
	
	
 
	
//	Lee
}
