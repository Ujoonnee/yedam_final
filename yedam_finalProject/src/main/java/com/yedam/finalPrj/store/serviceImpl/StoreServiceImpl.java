package com.yedam.finalPrj.store.serviceImpl;

import java.io.File;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

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
	public String regist(Store store, HttpServletRequest request, MultipartFile multi, Model model) {
		HttpSession session =  request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		String path="C:\\Store\\";
		String url = null;
		
		 String uploadpath = path;
         String originFilename = multi.getOriginalFilename();
         String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
         long size = multi.getSize();
         String saveFileName = genSaveFileName(extName);
         System.out.println(saveFileName);
         System.out.println(multi.toString());
         System.out.println("uploadpath : " + uploadpath);
         System.out.println("originFilename : " + originFilename);
         System.out.println("extensionName : " + extName);
         System.out.println("size : " + size);
         System.out.println("saveFileName : " + saveFileName);
         store.setMemNo(user.getMemNo());
         store.setThumbnail(saveFileName);
         if(!multi.isEmpty())
         {
             File file = new File(uploadpath, saveFileName);
             try {
				multi.transferTo(file);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
             
             model.addAttribute("filename",saveFileName);
             model.addAttribute("uploadPath", file.getAbsolutePath());
             try {
            	System.out.println(store.getAddress());
            	System.out.println(store.getCategory());
            	System.out.println(store.getLatitude());
            	System.out.println(store.getLongitude());
            	System.out.println(store.getMemNo());
            	System.out.println(store.getName());
            	System.out.println(store.getStoreCat());
            	System.out.println(store.getStoreNo());
            	System.out.println(store.getTel());
            	System.out.println(store.getThumbnail());
				map.regist(store);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
             return "filelist";
         }
         
		return "redirect:list";
	}
	
	@Override
	public List<Store> selectStoreRegList(StorePagingCriteria cri, HttpServletRequest request) {
		// TODO Auto-generated method stub
		return map.selectStoreRegList(cri);
	}
	

	@Override
	public int totalApprovalStoreNameCnt(StorePagingCriteria cri) {
		// TODO Auto-generated method stub
		return map.totalApprovalStoreNameCnt(cri);
	}

	@Override
	public int totalApprovalNameCnt(StorePagingCriteria cri) {
		// TODO Auto-generated method stub
		return map.totalApprovalNameCnt(cri);
	}

	// 현재 시간을 기준으로 파일 이름 생성
		 private String genSaveFileName(String extName) {
		        String fileName = "";
		        
		        Calendar calendar = Calendar.getInstance();
		        fileName += calendar.get(Calendar.YEAR);
		        fileName += calendar.get(Calendar.MONTH);
		        fileName += calendar.get(Calendar.DATE);
		        fileName += calendar.get(Calendar.HOUR);
		        fileName += calendar.get(Calendar.MINUTE);
		        fileName += calendar.get(Calendar.SECOND);
		        fileName += calendar.get(Calendar.MILLISECOND);
		        fileName += extName;
		        
		        return fileName;
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
	public void searchApprovalList(StorePagingCriteria cri, Model model,HttpServletRequest request) {
		// TODO Auto-generated method stub
		if(cri.getType().equals("storeName")) {//매장명으로 검색
			model.addAttribute("regList",searchStoreName(cri,request) );
			model.addAttribute("paging", new StorePageMaker(cri, totalApprovalStoreNameCnt(cri)));
		} else if (cri.getType().equals("pname")) { //사업자명으로 검색
			model.addAttribute("regList",searchPname(cri,request) );
			model.addAttribute("paging", new StorePageMaker(cri, totalApprovalNameCnt(cri)));
		} 
		else if(cri.getType().equals("")) {
			model.addAttribute("regList", searchBlank(cri,request));
			model.addAttribute("paging", new StorePageMaker(cri, totalCnt()));
		}
		else{
			model.addAttribute("regList", selectStoreRegList(cri,request));
			model.addAttribute("paging", new StorePageMaker(cri, totalCnt()));
		}
	}
	@Override
	public List<Store> searchBlank(StorePagingCriteria cri,HttpServletRequest request) {
		// TODO Auto-generated method stub
		return map.searchBlank(cri);
	}

	@Override
	public int totalBlankCnt(StorePagingCriteria cri) {
		// TODO Auto-generated method stub
		return map.totalBlankCnt(cri);
	}
	@Override
	public List<Store> searchStoreName(StorePagingCriteria cri, HttpServletRequest request) {
		// TODO Auto-generated method stub
		return map.searchStoreName(cri);
	}

	@Override
	public List<Store> searchPname(StorePagingCriteria cri,HttpServletRequest request) {
		// TODO Auto-generated method stub
		return map.searchPname(cri);
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
//예약 취소	
	@Override
	public int CancelRes(int prodResNo) {
		
			   map.CancelRes(prodResNo); // update(product_reservation테이블에서 결제상태 'N'으로 업뎃) 
		return map.CancelRes2(prodResNo); //reserved_product테이블에서 반환한만큼 product테이블에서 재고수량 증가) 
	}










	
//	Yoon
	
	
 
	
//	Lee
}
