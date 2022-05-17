package com.yedam.finalPrj.exhibition.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.exhibition.service.ExhibitionService;
import com.yedam.finalPrj.exhibition.vo.jo.ExhibitionVO;

@Service
public class ExhibitionServiceImpl implements ExhibitionService {

	@Autowired ExhibitionMapper map;


	// 홍제
	
	
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
	
	
}
