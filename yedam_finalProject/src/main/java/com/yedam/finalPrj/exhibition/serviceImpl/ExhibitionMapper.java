package com.yedam.finalPrj.exhibition.serviceImpl;

import java.util.List;

import com.yedam.finalPrj.exhibition.vo.hong.HongExhibitionReservationVO;
import com.yedam.finalPrj.exhibition.vo.hong.PagingVO;
import com.yedam.finalPrj.exhibition.vo.lee.ExhibitionReservationVO;
import com.yedam.finalPrj.exhibition.vo.lee.ExhibitionVO;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionPagingCriteria;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionReservationVO;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionVO;
import com.yedam.finalPrj.member.service.MemberVO;
import com.yedam.finalPrj.review.service.ReviewVO;


public interface ExhibitionMapper {

	// 홍제
	List<HongExhibitionReservationVO> selectAllExhibitionReservattion();
	List<HongExhibitionReservationVO> searchExhibitionByNo(int exResNo); // 예약번호로검색
	HongExhibitionReservationVO selectOneExhibitionReservationVO(HongExhibitionReservationVO exhibitionReservationVO);
	HongExhibitionReservationVO exDetail(int exResNo);
	
	int totalCnt(PagingVO vo);
	
	// 준우
	public List<ExhibitionVO> selectAllExh(); 								
	public List<ExhibitionVO> selectAllExhByStatus(String approvalStatus); 
	public List<ExhibitionVO> selectAllByExhName(String exhName); 			
	public List<ExhibitionVO> selectAllByMemName(String memName); 			
	public ExhibitionVO selectOneByExNo(int exNo);							
	public int exhPermit(int exNo); 										
	public int exhReject(int exNo); 	
	public ReviewVO selectReview(int selectedResNo);
	void cancelOneReservation(int exResNo); 									//예약취소
	List<ReviewVO> exhReviewLoad(int exNo); 											//리뷰목록 출력
	// 성환
	
	
	// 우준
	int insertExhibition(ExhibitionVO vo);
	List<ExhibitionVO> selectRegistrationList(MemberVO vo);
	ExhibitionVO selectRegistrationDetail(int exNo);
	List<ExhibitionVO> selectProviderExhibitionList(MemberVO vo);
	List<HongExhibitionReservationVO> selectProviderReservationList(HongExhibitionReservationVO vo);
	ExhibitionReservationVO selectReservation(ExhibitionReservationVO vo);
	
	
	// 성준

	public List<ParkExhibitionVO> exhibition(ParkExhibitionPagingCriteria cri); //	전시 목록
	public List<ParkExhibitionVO> searchEx(ParkExhibitionPagingCriteria cri); //	전시 목록에서의 검색처리
	int totalExCnt(ParkExhibitionPagingCriteria cri); //페이징 위한 전시 개수 
	int listTotalCnt(ParkExhibitionPagingCriteria cri); //전시 리스트 첫회면 페이징 
	ParkExhibitionVO findExVO(ParkExhibitionVO vo); //	전시 상세 페이지
	int insertExhibitionReservation(ParkExhibitionReservationVO vo);//예약 정보 등록
	ParkExhibitionReservationVO findExReVO(ParkExhibitionVO vo);//예약정보 확인
	
}