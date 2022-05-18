package com.yedam.finalPrj.home.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.yedam.finalPrj.member.service.MemberVO;

public interface HomeService {

	public String login(MemberVO member, HttpServletRequest request);
	public Map<String, Object> getRecommendation();
}
