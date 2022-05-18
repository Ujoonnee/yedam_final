package com.yedam.finalPrj.exhibition.serviceImpl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.exhibition.service.ExhibitionService;
import com.yedam.finalPrj.exhibition.vo.hong.ExhibitionReservationVO;
import com.yedam.finalPrj.exhibition.vo.lee.ExhibitionVO;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionPagingCriteria;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionReservationVO;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionVO;
import com.yedam.finalPrj.member.service.MemberVO;


@Service
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
	
	
	// 공통
	private MemberVO getCurrentUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		return user;
	}
}
