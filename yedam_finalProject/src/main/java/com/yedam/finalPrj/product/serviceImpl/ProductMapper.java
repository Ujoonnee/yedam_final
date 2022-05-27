package com.yedam.finalPrj.product.serviceImpl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.yedam.finalPrj.member.service.MemberVO;
import com.yedam.finalPrj.product.vo.park.Product;
import com.yedam.finalPrj.product.vo.park.ProductPagingCriteria;
import com.yedam.finalPrj.product.vo.park.Statistics;
import com.yedam.finalPrj.product.vo.park.hong.ProductReservationVO;

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
	public int productCnt(int prodNo);
	public int searchProductCnt(ProductPagingCriteria cri);
	public int searchPriceCnt(ProductPagingCriteria cri);
	 
//	내 상품 관리
	public List<Product> myStoreProductManegement(ProductPagingCriteria cri); //cri.storeNo사용
	public int myStoreProductInsert(Product product); //상품등록
	public int myStoreProductUpdate(HashMap<String, String> list); //상품수정
	int myStoreProductCnt(ProductPagingCriteria cri); //내 상품에 제품 개수
	int oneProductInsert(Product product); //단일상품 등록
	
	int getStoreNo(MemberVO vo); //회원번호로 storeNO조회
	
	
//	파일업로드
	String thumbnailUpdate(Product product) throws Exception;

//	통계조회
	List<ProductReservationVO> salesbyDate(int storeNo);
//	통계 날짜 검색
	List<ProductReservationVO> searchDateInStatistics(Statistics vo);

//	Hong
	// 상품예약목록 
	public List<ProductReservationVO> proReSelectAll(MemberVO user);

//  페이징
	int totalCnt(ProductPagingCriteria cri);
	
//	상세페이지 이동
	ProductReservationVO proReDetail(ProductReservationVO vo);

//  상세페이지 상품목록
	public List<ProductReservationVO> proReDetailList(ProductReservationVO vo);
	
//	Jo
	
 
	
	
//	Yoon
	
	
 
	
//	Lee
	
 
 
}
