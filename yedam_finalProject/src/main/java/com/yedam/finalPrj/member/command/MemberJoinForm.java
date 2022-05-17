package com.yedam.finalPrj.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class MemberJoinForm  {

	public String exec(HttpServletRequest request, HttpServletResponse response) {
		return "member/memberJoinForm";
	}

}
