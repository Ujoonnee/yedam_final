package com.yedam.finalPrj.exhibition.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.yedam.finalPrj.exhibition.vo.lee.ExhibitionReservationVO;
import com.yedam.finalPrj.exhibition.vo.lee.ExhibitionVO;

public interface ExhibitionService {

	// 홍제
	
	
	// 준우
	
	
	// 성환
	
	
	// 우준
	int insertExhibition(ExhibitionVO vo);											// 전시 등록 신청
	List<ExhibitionVO> getRegistrationList(HttpServletRequest request);				// 전시 등록 신청 목록
	ExhibitionVO getRegistration(int exNo);											// 전시 등록 신청 상세
	List<ExhibitionVO> getExhibitionList(HttpServletRequest request);				// 승인된 전시 목록
	List<ExhibitionReservationVO> getReservationList(int exNo, HttpServletRequest request);	// 전시의 예약자 목록
	
	// 성준
	
	
}
