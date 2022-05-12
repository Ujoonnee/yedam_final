package com.yedam.finalPrj.memberLogin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.yedam.finalPrj.facility.vo.FacilityVO;
import com.yedam.finalPrj.memberLogin.vo.UserVO;

public interface MemberService {
	public String loginCheck(UserVO vo, HttpSession session);
	
	public void logout(HttpSession session);

}
