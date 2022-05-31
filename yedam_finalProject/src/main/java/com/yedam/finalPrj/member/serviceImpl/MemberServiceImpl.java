package com.yedam.finalPrj.member.serviceImpl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.common.EmailSender;
import com.yedam.finalPrj.member.service.MemberService;
import com.yedam.finalPrj.member.service.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired MemberMapper map;
	@Autowired EmailSender emailSender;
	
	public MemberVO getCurrentUser(HttpServletRequest request) {
		// 현재 로그인한 유저 정보
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		return user;
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
	public String signIn(MemberVO member, HttpServletRequest request) {

		String pw = member.getPassword();
		
		member = map.findByEmail(member);
		
		String result = (member == null)? "email" 
						: (!member.getPassword().equals(pw))? "pw" : "success";
		
		if (result.equals("success")) {
			HttpSession session = request.getSession();
			session.setAttribute("user", member);
		}
		
		return result;
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate(); // 세션 초기화.
	}
	
	// 회원가입
	
	@Override
	public boolean isValidEmail(MemberVO vo) {
		return (map.isValidEmail(vo) == 0)? true : false;
	}
	
	@Override
	public String signUp(Map<String,String> member) {
		
		// 최종 회원가입 전 이메일 체크
		MemberVO vo = new MemberVO();
		vo.setEmail(member.get("email"));
		if (!isValidEmail(vo)) return "fail";
			
		// 프로시저 out 변수
		member.put("applicationNo", "");
		
		if (member.get("buisnessNum") == null) {
			// 일반회원
			member.put("memType", "00102");
		} else {
			// 사업자회원
			member.put("memType", "00103");
		}
		
		map.signup(member);
		
		return "success";
	}
	
	@Override
	public void sendConfirmationMail(Map<String,String> member) {
		emailSender.authenticationSend(member.get("email"), member);
	}
	
	@Override
	public boolean confirm(String applicationNo) {
		
		Map<String,Integer> m = new HashMap<>();
		m.put("applicationNo", Integer.parseInt(applicationNo));
		m.put("isExpired", null);
		
		map.confirm(m);
		
		return (m.get("isExpired") == 1)? true: false; 
	}

}
