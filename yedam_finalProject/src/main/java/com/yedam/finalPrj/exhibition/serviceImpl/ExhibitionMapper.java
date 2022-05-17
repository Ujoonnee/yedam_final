package com.yedam.finalPrj.exhibition.serviceImpl;

import java.util.List;

import com.yedam.finalPrj.exhibition.vo.hong.ExhibitionReservationVO;

public interface ExhibitionMapper {

	// 홍제
	List<ExhibitionReservationVO> selectAllExhibitionReservattion();
	ExhibitionReservationVO selectOneExhibitionReservationVO(ExhibitionReservationVO exhibitionReservationVO);
	ExhibitionReservationVO exDetail(ExhibitionReservationVO vo);
	
	// 준우
	
	
	// 성환
	
	
	// 우준
	
	
	// 성준
	
	
}
