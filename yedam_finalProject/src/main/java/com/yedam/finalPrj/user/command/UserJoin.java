package com.yedam.finalPrj.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.comm.Command;
import com.yedam.finalPrj.user.service.UserService;
import com.yedam.finalPrj.user.service.UserVO;
import com.yedam.finalPrj.user.serviceImpl.UserServiceImpl;

public class UserJoin implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//String address = request.getParameter("addr1") + " " + request.getParameter("addr2");
		
		UserService userDao = new UserServiceImpl();
		UserVO vo = new UserVO();
		vo.setUserId(request.getParameter("user_id"));
		vo.setUserPw(request.getParameter("user_pw"));
		vo.setUserName(request.getParameter("user_name"));
		vo.setUserBirth(request.getParameter("user_birth"));
		//vo.setUserAddress(address);
		vo.setUserTel(request.getParameter("user_tel"));
		vo.setUserEmail(request.getParameter("user_email"));
		vo.setUserAccount(request.getParameter("user_account"));
		
		int n = userDao.insert(vo);
		if ( n != 0) {
			request.setAttribute("message", "회원가입이 완료되었습니다.");
			//request.setAttribute("id", vo);
			return "user/userJoinForm";
		} else {
			request.setAttribute("message", "회원가입에 실패 하였습니다. 다시 시도해 주십시오.");
			return "user/userJoinForm";
		}
		
	}

}
