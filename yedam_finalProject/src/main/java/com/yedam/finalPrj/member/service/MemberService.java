package com.yedam.finalPrj.member.service;

import javax.servlet.http.HttpSession;

public interface MemberService {
	// 이홍제
	Member findOne(Member vo);   // 단건 조회
	Member findAll(Member vo);      // ID조회
	int insert(Member vo);       // 등록
	int update(Member vo);       // 수정
	int delete(Member vo);       // 삭제
	
	boolean idCheck(String str); // id중복체크
	
	// 조준우
	public String loginCheck(Member vo, HttpSession session);
	public void logout(HttpSession session);
	
}
