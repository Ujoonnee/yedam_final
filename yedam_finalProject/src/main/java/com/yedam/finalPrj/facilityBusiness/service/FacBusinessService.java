//package com.yedam.finalPrj.facilityBusiness.service;
//
//import java.util.List;
//
//import com.yedam.finalPrj.facility.service.Facility;
//import com.yedam.finalPrj.member.service.MemberVO;
//
//public interface FacBusinessService {
//	public FacReservation findDetail(int resNo);
//	public String FindFacName(int facResNo);
//	
//	//예약자 모두 조회.
//	public List<FacReservation> findAll();
//	//예약자 모두 조회+member 
//	public List<FacReservation> findAll2();
//	//예약한 회원 이름, 번호 조회.
//	public MemberVO findNameTel(int resNo);
//	//나의 예약목록 조회.
//	public List<FacReservation> findMyResList(int memNo);
//	
//	//시설등록
//	public void insert(Facility vo);
//	//시설정보수정
//	public void update(Facility vo);
//	
//}
