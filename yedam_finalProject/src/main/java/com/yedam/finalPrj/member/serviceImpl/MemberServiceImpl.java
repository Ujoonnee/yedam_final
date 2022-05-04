package com.yedam.finalPrj.member.serviceImpl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.memberService.MemberService;
import com.yedam.finalPrj.memberVO.MemberVO;

@Service  // service bean으로 등록.
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;

	@Override
	public String loginCheck(MemberVO vo, HttpSession session) {
		String name = memberMapper.loginCheck(vo);
		if(name != null) { //세션변수저장.
			session.setAttribute("userid", vo.getUserId());
			session.setAttribute("name", name);
		}
		return name;
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate(); //세션 초기화.
		
	}

}
