package com.yedam.finalPrj.exhibition.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.exhibition.service.ExhibitionService;
import com.yedam.finalPrj.exhibition.vo.hong.ExhibitionReservationVO;
import com.yedam.finalPrj.exhibition.vo.jo.ExhibitionVO;
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
	@Override
	public List<ExhibitionVO> selectAllExh() {
		return map.selectAllExh();
	}
	
	@Override
	public List<ExhibitionVO> selectAllExhByStatus(String approvalStatus) {
		return map.selectAllExhByStatus(approvalStatus);
	}

	@Override
	public List<ExhibitionVO> selectAllByExhName(String exhName) {
		return map.selectAllByExhName(exhName);
	}

	@Override
	public List<ExhibitionVO> selectAllByMemName(String memName) {
		return map.selectAllByMemName(memName);
	}
	
	// 성환
	
	
	// 우준
	
	
	// 성준
//	전시목록
	@Override
	public List<ParkExhibitionVO> exhibition(ParkExhibitionPagingCriteria cri) {
		// TODO Auto-generated method stub
		
		return map.exhibition(cri);
	}
//	전시 상세페이지
	@Override
	public ParkExhibitionVO findExVO(ParkExhibitionVO vo) {
		// TODO Auto-generated method stub
		return map.findExVO(vo);
	}
//	예약 정보 등록
	@Override
	public int insertExhibition(ParkExhibitionVO vo) {
		// TODO Auto-generated method stub
		return map.insertExhibition(vo);
	}
//	예약정보확인
	@Override
	public ParkExhibitionReservationVO findExReVO(ParkExhibitionVO vo) {
		// TODO Auto-generated method stub
		return map.findExReVO(vo);
	}
//	전시 목록에서의 검색처리
	@Override
	public List<ParkExhibitionVO> searchEx(ParkExhibitionPagingCriteria cri) {
		System.out.println(cri.getExVO().getAddress());
		System.out.println(cri.getExVO().getStartDate());
		System.out.println(cri.getExVO().getEndDate());
		System.out.println(cri.getKeyword());
		// TODO Auto-generated method stub
		return map.searchEx(cri);
	}
//	페이징 위한 전시 개수 
	@Override
	public int totalExCnt(ParkExhibitionPagingCriteria cri) {
		// TODO Auto-generated method stub
		return map.totalExCnt(cri);
	}
	
	
}
