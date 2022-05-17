package com.yedam.finalPrj.exhibition.serviceImpl;

import java.util.List;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.exhibition.service.ExhibitionService;
import com.yedam.finalPrj.exhibition.vo.hong.ExhibitionReservationVO;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionPagingCriteria;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionReservationVO;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionVO;

@Service("ExhibitionService")
public class ExhibitionServiceImpl implements ExhibitionService {
	
	@Autowired ExhibitionMapper map;

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
	@Override
	public List<ParkExhibitionVO> exhibition(ParkExhibitionPagingCriteria cri) {
		// TODO Auto-generated method stub
		
		return map.exhibition(cri);
	}
	
	@Override
	public ParkExhibitionVO findExVO(ParkExhibitionVO vo) {
		// TODO Auto-generated method stub
		return map.findExVO(vo);
	}
	
	@Override
	public int insertExhibition(ParkExhibitionVO vo) {
		// TODO Auto-generated method stub
		return map.insertExhibition(vo);
	}
	
	@Override
	public ParkExhibitionReservationVO findExReVO(ParkExhibitionVO vo) {
		// TODO Auto-generated method stub
		return map.findExReVO(vo);
	}
	
	
}
