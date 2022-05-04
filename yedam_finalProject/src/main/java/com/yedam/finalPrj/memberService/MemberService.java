package com.yedam.finalPrj.memberService;

import javax.servlet.http.HttpSession;


import com.yedam.finalPrj.memberVO.MemberVO;

public interface MemberService {
	public String loginCheck(MemberVO vo, HttpSession session);
	public void logout(HttpSession session);
}
