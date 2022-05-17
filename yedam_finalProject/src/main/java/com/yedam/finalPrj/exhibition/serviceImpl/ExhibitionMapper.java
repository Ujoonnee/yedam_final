package com.yedam.finalPrj.exhibition.serviceImpl;

import java.util.List;

import com.yedam.finalPrj.exhibition.vo.jo.ExhibitionVO;

public interface ExhibitionMapper {

	// 홍제
	
	
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
	
	
	// 성준
	
	
}
