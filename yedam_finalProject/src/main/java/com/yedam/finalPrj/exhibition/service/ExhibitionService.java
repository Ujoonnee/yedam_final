package com.yedam.finalPrj.exhibition.service;

import java.util.List;


import com.yedam.finalPrj.exhibition.vo.jo.ExhibitionVO;
import com.yedam.finalPrj.exhibition.vo.hong.ExhibitionReservationVO;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionPagingCriteria;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionReservationVO;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionVO;

public interface ExhibitionService {

	// 홍제
	List<ExhibitionReservationVO> selectAllExhibitionReservattion();
	ExhibitionReservationVO selectOneExhibitionReservationVO(ExhibitionReservationVO exhibitionReservationVO);
	ExhibitionReservationVO exDetail(ExhibitionReservationVO vo);
	
	// 준우
	public List<ExhibitionVO> selectAllExh(); //전시등록신청 목록조회
	public List<ExhibitionVO> selectAllExhByStatus(String approvalStatus); //승인여부에 따라 등록신청목록조회
	public List<ExhibitionVO> selectAllByExhName(String exhName); //전시명으로 검색
	public List<ExhibitionVO> selectAllByMemName(String memName); //사업자명으로 검색
	public ExhibitionVO selectOneByExNo(int exNo); //전시등록번호로 상세내역 가져오기
	public int exhPermit(int exNo); //전시등록 승인하기
	public int exhReject(int exNo); //전시등록 반려하기
	// 성환
	
	
	// 우준
	
	
	// 성준

	public List<ParkExhibitionVO> exhibition(ParkExhibitionPagingCriteria cri); //	전시 목록
	ParkExhibitionVO findExVO(ParkExhibitionVO vo); //	전시 상세 페이지
	int insertExhibition(ParkExhibitionVO vo);//예약 정보 등록
	ParkExhibitionReservationVO findExReVO(ParkExhibitionVO vo);//예약정보 확인
}
