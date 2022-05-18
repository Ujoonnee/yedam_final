package com.yedam.finalPrj.exhibition.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.yedam.finalPrj.exhibition.vo.hong.ExhibitionReservationVO;
import com.yedam.finalPrj.exhibition.vo.lee.ExhibitionVO;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionPagingCriteria;


public interface ExhibitionService {

	// 홍제
	List<ExhibitionReservationVO> selectAllExhibitionReservattion();
	ExhibitionReservationVO selectOneExhibitionReservationVO(ExhibitionReservationVO exhibitionReservationVO);
	ExhibitionReservationVO exDetail(ExhibitionReservationVO vo);
	
	// 준우
	//전시등록신청 목록조회
	public List<ExhibitionVO> selectAllExh();
	//승인여부에 따라 등록신청목록조회
	public List<ExhibitionVO> selectAllExhByStatus(String approvalStatus);
	//전시명으로 검색
	public List<ExhibitionVO> selectAllByExhName(String exhName);
	//사업자명으로 검색
	public List<ExhibitionVO> selectAllByMemName(String memName);
	
	// 성환
	
	
	// 우준	
	int insertExhibition(ExhibitionVO vo);													// 전시 등록 신청
	List<ExhibitionVO> getRegistrationList(HttpServletRequest request);						// 전시 등록 신청 목록
	ExhibitionVO getRegistration(int exNo);													// 전시 등록 신청 상세
	List<ExhibitionVO> getExhibitionList(HttpServletRequest request);						// 승인된 전시 목록
	List<ExhibitionReservationVO> getReservationList(int exNo, HttpServletRequest request);	// 전시의 예약자 목록
	
	// 성준

	public List<ExhibitionVO> exhibition(ParkExhibitionPagingCriteria cri); //	전시 목록
	ExhibitionVO findExVO(ExhibitionVO vo); //	전시 상세 페이지
	int insertExhibitionReservation(ExhibitionVO vo);//예약 정보 등록
	ExhibitionReservationVO findExReVO(ExhibitionVO vo);//예약정보 확인
}
