package com.yedam.finalPrj.member.serviceImpl;

import java.util.Map;

import com.yedam.finalPrj.member.service.MemberVO;

public interface MemberMapper {
	
	
	// 로그인
	public MemberVO loginCheck(MemberVO vo);
	MemberVO findByEmail(MemberVO vo);
	
	// 회원가입
	int isValidEmail(MemberVO vo);
	String signup(Map<String, String> member);
	String confirm(Map<String,Integer> map);
	
	// 수정
	void update(MemberVO vo);

}
