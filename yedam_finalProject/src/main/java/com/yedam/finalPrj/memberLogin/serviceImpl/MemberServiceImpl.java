package com.yedam.finalPrj.memberLogin.serviceImpl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.memberLogin.service.MemberService;
import com.yedam.finalPrj.memberLogin.vo.UserVO;

@Service  // service bean으로 등록.
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;

	
	//로그인 체크
	@Override
	public String loginCheck(UserVO vo, HttpSession session) {
		String name = memberMapper.loginCheck_user(vo);
		if(name != null) { //세션변수저장.
			session.setAttribute("userEmail", vo.getUserEmail());
			session.setAttribute("name", name);
		}
		return name;
	}
	
	

	@Override
	public void logout(HttpSession session) {
		session.invalidate(); //세션 초기화.
		
	}

	

}
