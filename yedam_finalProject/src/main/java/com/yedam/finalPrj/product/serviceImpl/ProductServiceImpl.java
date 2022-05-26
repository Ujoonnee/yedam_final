package com.yedam.finalPrj.product.serviceImpl;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.yedam.finalPrj.common.FileUtils;
import com.yedam.finalPrj.member.service.MemberService;
import com.yedam.finalPrj.member.service.MemberVO;
import com.yedam.finalPrj.product.service.ProductService;
import com.yedam.finalPrj.product.vo.park.Product;
import com.yedam.finalPrj.product.vo.park.ProductPageMaker;
import com.yedam.finalPrj.product.vo.park.ProductPagingCriteria;
import com.yedam.finalPrj.product.vo.park.Statistics;
import com.yedam.finalPrj.product.vo.park.hong.ProductReservation;



@Service
public class ProductServiceImpl implements ProductService {
	@Autowired ProductMapper map;
	@Autowired FileUtils file;
	@Autowired MemberService service;
	
//	Park
//	매장의 상품 개수
	@Override
	public int productCnt(int prodNo) {
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
		int store_no =   Integer.parseInt(request.getParameter("store_no"));
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
	public List<Product> myStoreProductManegement(ProductPagingCriteria cri,HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession session =  request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		System.out.println("myStoreProductManagement 에서 user세션값"+user.getMemNo());
		int memNo = map.getStoreNo(user);
		System.out.println("getStoreNo : "+memNo);
		cri.setStoreNo(memNo);
		return map.myStoreProductManegement(cri);
	}
	@Override
	public int myStoreProductCnt(ProductPagingCriteria cri,HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession session =  request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
	
		int storeNo = map.getStoreNo(user);
		System.out.println("getStoreNo : "+storeNo);
		cri.setStoreNo(storeNo);
		return map.myStoreProductCnt(cri);
	}
	@Override
	public int oneProductInsert(Product product,HttpServletRequest request) {
		HttpSession session =  request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
	
		int storeNo = map.getStoreNo(user);
		System.out.println("단일상품등록의 매장번호"+storeNo);
		product.setStoreNo(storeNo);
		// TODO Auto-generated method stub
		return map.oneProductInsert(product);
	}
	
	@Override
	public void myStoreProductUpdate(MultipartFile multi, Model model, Product vo) {
		// TODO Auto-generated method stub
		String path="C:\\image\\";
		
		String url = null;
		
		String uploadpath = path;
        String originFilename = multi.getOriginalFilename();
        String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
        long size = multi.getSize();
        String saveFileName = genSaveFileName(extName);
        
        System.out.println("uploadpath : " + uploadpath);
        
        System.out.println("originFilename : " + originFilename);
        System.out.println("extensionName : " + extName);
        System.out.println("size : " + size);
        System.out.println("saveFileName : " + saveFileName);
        
        if(!multi.isEmpty())
        {
            File file = new File(uploadpath, multi.getOriginalFilename());
            try {
				multi.transferTo(file);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            
            model.addAttribute("filename", multi.getOriginalFilename());
            model.addAttribute("uploadPath", file.getAbsolutePath());
            
//            return "filelist";
        }
        return ;
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
	@Override
	public void myStoreProductInsert(String file,HttpServletRequest request) {
		HttpSession session =  request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
	
		int storeNo = map.getStoreNo(user);
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
			product.setStoreNo(storeNo);
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
