package com.yedam.finalPrj.exhibition.serviceImpl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.exhibition.service.ExhibitionService;
import com.yedam.finalPrj.exhibition.vo.lee.ExhibitionReservationVO;
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

	// 사업자의 전시 등록 신청 목록 조회
	@Override
	public List<ExhibitionVO> getRegistrationList(HttpServletRequest request) {
		MemberVO user = getCurrentUser(request);
		
		return map.selectRegistrationList(user);
	}
	
	// 사업자의 전시 등록 신청 상세 조회
	public ExhibitionVO getRegistration(int exNo) {
		return map.selectRegistrationDetail(exNo);
	}

	// 사업자의 승인된 전시 목록
	@Override
	public List<ExhibitionVO> getExhibitionList(HttpServletRequest request) {
		MemberVO user = getCurrentUser(request);
		
		return map.selectProviderExhibitionList(user);
	}

	// 선택한 전시의 예약자 목록
	@Override
	public List<ExhibitionReservationVO> getReservationList(int exNo, HttpServletRequest request) {
		MemberVO user = getCurrentUser(request);
		
		ExhibitionReservationVO vo = new ExhibitionReservationVO();
		vo.setExNo(exNo);
		vo.setMemNo(user.getMemNo());
		
		return map.selectProviderReservationList(vo);
	}

	
	
	
	// 성준
	
	
	// 공통
	private MemberVO getCurrentUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		return user;
	}
}
