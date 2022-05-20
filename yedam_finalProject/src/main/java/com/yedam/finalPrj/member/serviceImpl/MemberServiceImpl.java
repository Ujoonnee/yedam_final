package com.yedam.finalPrj.member.serviceImpl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.member.service.MemberVO;
import com.yedam.finalPrj.member.service.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper map;

	@Override
	public MemberVO findOne(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.findOne(vo);
	}

	@Override
	public MemberVO findAll(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.findAll(vo);
	}

	@Override
	public int insert(MemberVO vo) {
		// TODO Auto-generated method stub
		System.out.println("check"+vo.getName());
		return map.insert(vo);
	}

	@Override
	public int update(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.update(vo);
	}

	@Override
	public int delete(MemberVO vo) {
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
	public MemberVO loginCheck(MemberVO vo, HttpSession session) {
		vo = map.loginCheck(vo);
		if (vo != null) { // 세션변수저장.
			session.setAttribute("memNo", vo.getMemNo());
			session.setAttribute("email", vo.getEmail());
			session.setAttribute("name", vo.getName());
			System.out.println("session memNo : "+session.getAttribute("memNo"));
			System.out.println("session Email : "+session.getAttribute("email"));
			System.out.println("session name : "+session.getAttribute("name"));
		}
		return vo;
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate(); // 세션 초기화.
	}

}
