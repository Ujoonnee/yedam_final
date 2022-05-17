package com.yedam.finalPrj.exhibition.serviceImpl;

import java.util.List;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.exhibition.service.ExhibitionService;
import com.yedam.finalPrj.exhibition.vo.hong.ExhibitionReservationVO;



@Service("exDao")
public class ExhibitionServiceImpl implements ExhibitionService {
	
	@Autowired
	ExhibitionMapper map;

	// 홍제
	
	// 예약목록 전체 조회
	@Override
	public List<ExhibitionReservationVO> selectAllExhibitionReservattion() {
		// TODO Auto-generated method stub
		return map.selectAllExhibitionReservattion();
	}
	
	// 예약목록 단건 조회
	@Override
	public ExhibitionReservationVO selectOneExhibitionReservationVO(ExhibitionReservationVO exhibitionReservationVO) {
		// TODO Auto-generated method stub
		return map.selectOneExhibitionReservationVO(exhibitionReservationVO);
	}

	@Override
	public ExhibitionReservationVO exDetail(ExhibitionReservationVO vo) {
		// TODO Auto-generated method stub
		return map.exDetail( vo);
	}
	
	
	// 준우
	
	
	// 성환
	
	
	// 우준
	
	
	// 성준
	
	
}
