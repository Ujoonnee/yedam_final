package com.yedam.finalPrj.member.serviceImpl;

import java.util.Map;

import com.yedam.finalPrj.member.service.MemberVO;

public interface MemberMapper {
	MemberVO findOne(MemberVO vo);   // 단건 조회
	MemberVO findAll(MemberVO vo);      // ID조회
	int insertMember(MemberVO vo);       // 등록
	int update(MemberVO vo);       // 수정
	int delete(MemberVO vo);       // 삭제
	
	boolean idCheck(String str); // id중복체크
	
	public MemberVO loginCheck(MemberVO vo);
	
	int isValidEmail(MemberVO vo);
	
	String signup (Map<String, String> member);
}
