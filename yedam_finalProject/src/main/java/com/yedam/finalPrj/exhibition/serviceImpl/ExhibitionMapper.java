package com.yedam.finalPrj.exhibition.serviceImpl;

import java.util.List;

import com.yedam.finalPrj.exhibition.vo.lee.ExhibitionVO;
import com.yedam.finalPrj.member.service.MemberVO;

public interface ExhibitionMapper {

	// 홍제
	
	
	// 준우
	
	
	// 성환
	
	
	// 우준
	int insertExhibition(ExhibitionVO vo);
	List<ExhibitionVO> selectRegistrationList(MemberVO member);
	ExhibitionVO selectRegistrationDetail(int exNo);
	List<ExhibitionVO> selectProviderExhibitionList(MemberVO member);
	
	
	// 성준
	
	
}
