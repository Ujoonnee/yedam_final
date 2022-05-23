package com.yedam.finalPrj.exhibition.serviceImpl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.exhibition.service.ExhibitionService;
import com.yedam.finalPrj.exhibition.vo.hong.ExhibitionReservationVO;
import com.yedam.finalPrj.exhibition.vo.hong.PagingVO;
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
	
	
	@Override
	public int totalCnt(PagingVO vo) {
		// TODO Auto-generated method stub
		return map.totalCnt(vo);
	}
	
	
	@Override
	public List<ExhibitionReservationVO> searchExhibition() {
		// TODO Auto-generated method stub
		return map.searchExhibition();
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
	
	@Override
	public ExhibitionVO selectOneByExNo(int exNo) {
		return map.selectOneByExNo(exNo);
	}
	
	@Override
	public int exhPermit(int exNo) {
		return map.exhPermit(exNo);
	}
	
	@Override
	public int exhReject(int exNo) {
		return map.exhReject(exNo);
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
	public int insertExhibitionReservation(ParkExhibitionVO vo) {
		// TODO Auto-generated method stub
		return map.insertExhibitionReservation(vo);
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
		System.out.println(cri.getAmount());
		System.out.println(cri.getPageNum());
		// TODO Auto-generated method stub
		return map.searchEx(cri);
	}
//	페이징 위한 전시 개수 
	@Override
	public int totalExCnt(ParkExhibitionPagingCriteria cri) {
		// TODO Auto-generated method stub
		return map.totalExCnt(cri);
	}
	
	// 공통
	private MemberVO getCurrentUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		return user;
	}
}
