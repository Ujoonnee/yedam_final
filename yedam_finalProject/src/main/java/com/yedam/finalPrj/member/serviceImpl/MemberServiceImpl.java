package com.yedam.finalPrj.member.serviceImpl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.member.service.MemberService;
import com.yedam.finalPrj.member.service.MemberVO;

@Service
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
//		return map.insert(vo);
		return 0;
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
	
	public MemberVO getCurrentUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		return user;
	}

	@Override
	public boolean isValidEmail(MemberVO vo) {
		return (map.isValidEmail(vo) == 0)? true : false;
	}
	
	@Override
	public int signUp(MemberVO member) {
		
		Map<String, String> memberMap = new HashMap<>();
		
		memberMap.put("email", member.getEmail());
		memberMap.put("name", member.getName());
		memberMap.put("password", member.getPassword());
		memberMap.put("address", member.getAddress());
		memberMap.put("addressDetail", member.getAddressDetail());
		memberMap.put("tel", member.getTel());
		memberMap.put("buisnessNum", member.getBuisnessNum());
		memberMap.put("buisnessType", member.getBuisnessType());
		memberMap.put("applicationNo", "");
		
		System.out.println("buisnessNum : " + memberMap.get("buisnessNum"));
		if (memberMap.get("buisnessNum") == null) {
			// 일반회원
			memberMap.put("memType", "00102");
		} else {
			// 사업자회원
			memberMap.put("memType", "00103");
		}
		
		return map.signup(memberMap);
	}

}
