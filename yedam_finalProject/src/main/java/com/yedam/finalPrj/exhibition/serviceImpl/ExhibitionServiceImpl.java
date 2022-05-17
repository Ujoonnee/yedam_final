package com.yedam.finalPrj.exhibition.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.exhibition.service.ExhibitionService;
import com.yedam.finalPrj.exhibition.vo.lee.ExhibitionVO;
import com.yedam.finalPrj.member.service.MemberVO;

@Service
public class ExhibitionServiceImpl implements ExhibitionService {

	@Autowired ExhibitionMapper map;
	
	// 홍제
	
	
	// 준우
	
	
	// 성환
	
	
	// 우준
	
	// DB 에 전시 등록
	@Override
	public int insertExhibition(ExhibitionVO vo) {
		return map.insertExhibition(vo);
	}

	// 로그인한 사업자의 전시 등록 신청 목록 조회
	@Override
	public List<ExhibitionVO> getRegistration() {

		// TODO session 에서 받는 member 정보로 교체할 것
		MemberVO member = new MemberVO();
		member.setMemNo(1);
		
		return map.getRegistration(member);
	}
	
	public ExhibitionVO getRegistration(int exNo) {
		
		return null;
	}
	
	// 성준
	
	
}
