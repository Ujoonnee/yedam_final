package com.yedam.finalPrj.member.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface MemberService {
	
	// 조준우
	public MemberVO loginCheck(MemberVO vo, HttpSession session);
	public void logout(HttpSession session);
	
	// 이우준
	MemberVO getCurrentUser(HttpServletRequest request);
	String signIn(MemberVO member, HttpServletRequest request);
	
	boolean isValidEmail(MemberVO vo);
	String signUp(Map<String,String> member);
	void sendConfirmationMail(Map<String,String> member);
	boolean confirm(String applicationNo);
}
