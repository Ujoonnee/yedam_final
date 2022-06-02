package com.yedam.finalPrj.exhibition.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.yedam.finalPrj.exhibition.vo.hong.HongExhibitionReservationVO;
import com.yedam.finalPrj.exhibition.vo.hong.PagingVO;
import com.yedam.finalPrj.exhibition.vo.lee.ExhibitionVO;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionPagingCriteria;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionReservationVO;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionVO;
import com.yedam.finalPrj.review.service.ReviewVO;


public interface ExhibitionService {

	// 홍제
	List<HongExhibitionReservationVO> selectAllExhibitionReservattion(); // 전체조회
	List<HongExhibitionReservationVO> searchExhibitionByNo(int exResNo); // 예약번호로검색
	HongExhibitionReservationVO selectOneExhibitionReservationVO(HongExhibitionReservationVO exhibitionReservationVO);
	HongExhibitionReservationVO exDetail(int exResNo);
	public ReviewVO selectReview(int selectedResNo);
	
	int totalCnt(PagingVO vo);
	
	// 준우
	public List<ExhibitionVO> selectAllExh(); 									//전시등록신청 목록조회
	public List<ExhibitionVO> selectAllExhByStatus(String approvalStatus);		//승인여부에 따라 등록신청목록조회
	public List<ExhibitionVO> selectAllByExhName(String exhName);				//전시명으로 검색
	public List<ExhibitionVO> selectAllByMemName(String memName);				//사업자명으로 검색
	public ExhibitionVO selectOneByExNo(int exNo); 								//전시등록번호로 상세내역 가져오기
	public int exhPermit(int exNo);												//전시등록 승인하기
	public int exhReject(int exNo); 											//전시등록 반려하기
	// 성환
	
	
	// 우준	
	int insertExhibition(ExhibitionVO vo);													// 전시 등록 신청
	List<ExhibitionVO> getRegistrationList(HttpServletRequest request);						// 전시 등록 신청 목록
	ExhibitionVO getRegistration(int exNo);													// 전시 등록 신청 상세
	List<ExhibitionVO> getExhibitionList(HttpServletRequest request);						// 승인된 전시 목록
	List<HongExhibitionReservationVO> getReservationList(int exNo, HttpServletRequest request);	// 전시의 예약자 목록
	
	// 성준

	public List<ParkExhibitionVO> exhibition(ParkExhibitionPagingCriteria cri); //	전시 목록
	public List<ParkExhibitionVO> searchEx(ParkExhibitionPagingCriteria cri); //	전시 목록에서의 검색처리
	int totalExCnt(ParkExhibitionPagingCriteria cri); //페이징 위한 전시 개수 
	int listTotalCnt(ParkExhibitionPagingCriteria cri);
	ParkExhibitionVO findExVO(ParkExhibitionVO vo); //	전시 상세 페이지
	int insertExhibitionReservation(ParkExhibitionReservationVO vo);//예약 정보 등록
	ParkExhibitionReservationVO findExReVO(ParkExhibitionVO vo);//예약정보 확인
	void cancelOneReservation(int exResNo); //예약취소
	
	
}
