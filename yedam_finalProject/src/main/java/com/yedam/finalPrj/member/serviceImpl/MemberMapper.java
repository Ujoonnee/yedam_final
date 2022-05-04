package com.yedam.finalPrj.member.serviceImpl;

import com.yedam.finalPrj.memberVO.MemberVO;
import com.yedam.finalPrj.memberVO.ProviderVO;


public interface MemberMapper {
	public String loginCheck(MemberVO vo);
	public String loginCheck_provider(ProviderVO vo);
}
