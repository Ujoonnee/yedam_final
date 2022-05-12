package com.yedam.finalPrj.memberLogin.service;

import javax.servlet.http.HttpSession;

import com.yedam.finalPrj.memberLogin.vo.Member;

public interface MemberService {
	public String loginCheck(Member vo, HttpSession session);
	
	public void logout(HttpSession session);

}
