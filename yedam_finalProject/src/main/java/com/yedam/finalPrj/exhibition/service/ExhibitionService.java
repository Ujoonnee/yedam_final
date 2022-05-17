package com.yedam.finalPrj.exhibition.service;

import java.util.List;

import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionPagingCriteria;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionReservationVO;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionVO;

public interface ExhibitionService {

	// 홍제
	
	
	// 준우
	
	
	// 성환
	
	
	// 우준
	
	
	// 성준

	public List<ParkExhibitionVO> exhibition(ParkExhibitionPagingCriteria cri); //	전시 목록
	ParkExhibitionVO findExVO(ParkExhibitionVO vo); //	전시 상세 페이지
	int insertExhibition(ParkExhibitionVO vo);//예약 정보 등록
	ParkExhibitionReservationVO findExReVO(ParkExhibitionVO vo);//예약정보 확인
}
