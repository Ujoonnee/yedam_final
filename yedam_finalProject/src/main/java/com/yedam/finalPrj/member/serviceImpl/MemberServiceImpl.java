package com.yedam.finalPrj.member.serviceImpl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.member.service.Member;
import com.yedam.finalPrj.member.service.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper map;

	@Override
	public Member findOne(Member vo) {
		// TODO Auto-generated method stub
		return map.findOne(vo);
	}

	@Override
	public Member findAll(Member vo) {
		// TODO Auto-generated method stub
		return map.findAll(vo);
	}

	@Override
	public int insert(Member vo) {
		// TODO Auto-generated method stub
		System.out.println("check"+vo.getName());
		return map.insert(vo);
	}

	@Override
	public int update(Member vo) {
		// TODO Auto-generated method stub
		return map.update(vo);
	}

	@Override
	public int delete(Member vo) {
		// TODO Auto-generated method stub
		return map.delete(vo);
	}

	@Override
	public boolean idCheck(String str) {
		// TODO Auto-generated method stub
		return false;
	}

	
	
	// 조준우
	// 로그인 체크
	@Override
	public String loginCheck(Member vo, HttpSession session) {
		String name = map.loginCheck(vo);
		if (name != null) { // 세션변수저장.
			session.setAttribute("email", vo.getEmail());
			session.setAttribute("name", name);
		}
		return name;
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate(); // 세션 초기화.
	}

}
