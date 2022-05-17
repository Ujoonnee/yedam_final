package com.yedam.finalPrj.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.yedam.finalPrj.member.service.Member;
import com.yedam.finalPrj.member.serviceImpl.MemberServiceImpl;


public class MemberJoin  {

	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//String address = request.getParameter("addr1") + " " + request.getParameter("addr2");
		
		MemberServiceImpl memberDao = new MemberServiceImpl();
		Member vo = new Member();
		vo.setEmail(request.getParameter("email"));
		vo.setPassword(request.getParameter("password"));
		vo.setName(request.getParameter("name"));
		vo.setTel(request.getParameter("tel"));
		vo.setBuisnessNum(request.getParameter("buisness_num"));
		vo.setAddress(request.getParameter("address"));
		vo.setAddressDetail(request.getParameter("address_detail"));
		//vo.setmemberBirth(request.getParameter("member_birth"));
		//vo.setmemberAddress(address);
		
		
		int n = memberDao.insert(vo);
		if ( n != 0) {
			request.setAttribute("message", "회원가입이 완료되었습니다.");
			//request.setAttribute("id", vo);
			return "member/memberJoinForm";
		} else {
			request.setAttribute("message", "회원가입에 실패 하였습니다. 다시 시도해 주십시오.");
			return "member/memberJoinForm";
		}
		
	}

}
