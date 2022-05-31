package com.yedam.finalPrj.member.serviceImpl;

import java.util.Map;

import com.yedam.finalPrj.member.service.MemberVO;

public interface MemberMapper {
	
	
	// 로그인
	public MemberVO loginCheck(MemberVO vo);
	MemberVO findByEmail(MemberVO vo);
	
	// 회원가입
	int isValidEmail(MemberVO vo);

	

	//void confirm(String applicationNo);

	String signup(Map<String, String> member);
	String confirm(Map<String,Integer> map);

}
