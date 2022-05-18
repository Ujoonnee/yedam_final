package com.yedam.finalPrj.exhibition.serviceImpl;

import java.util.List;

import com.yedam.finalPrj.exhibition.vo.hong.ExhibitionReservationVO;
import com.yedam.finalPrj.exhibition.vo.lee.ExhibitionVO;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionPagingCriteria;
import com.yedam.finalPrj.member.service.MemberVO;


public interface ExhibitionMapper {

	// 홍제
	List<ExhibitionReservationVO> selectAllExhibitionReservattion();
	ExhibitionReservationVO selectOneExhibitionReservationVO(ExhibitionReservationVO exhibitionReservationVO);
	ExhibitionReservationVO exDetail(ExhibitionReservationVO vo);
	
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
	int insertExhibition(ExhibitionVO vo);
	List<ExhibitionVO> selectRegistrationList(MemberVO vo);
	ExhibitionVO selectRegistrationDetail(int exNo);
	List<ExhibitionVO> selectProviderExhibitionList(MemberVO vo);
	List<ExhibitionReservationVO> selectProviderReservationList(ExhibitionReservationVO vo);
	
	
	// 성준

	public List<ExhibitionVO> exhibition(ParkExhibitionPagingCriteria cri); //	전시 목록
	ExhibitionVO findExVO(ExhibitionVO vo); //	전시 상세 페이지
	int insertExhibitionReservation(ExhibitionVO vo);//예약 정보 등록
	ExhibitionReservationVO findExReVO(ExhibitionVO vo);//예약정보 확인
}