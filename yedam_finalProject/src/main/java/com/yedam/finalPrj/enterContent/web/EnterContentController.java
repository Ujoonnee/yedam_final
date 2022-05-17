package com.yedam.finalPrj.enterContent.web;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yedam.finalPrj.enterContent.service.EnterContent;
import com.yedam.finalPrj.enterContent.serviceImpl.EnterContentMapper;
import com.yedam.finalPrj.enterContent.serviceImpl.EnterContentServiceImpl;


@Controller
public class EnterContentController {

	@Autowired EnterContentMapper map;
	@Autowired EnterContentServiceImpl dao;
	
//	view service insert form
	@RequestMapping(value = "/enter", method = RequestMethod.GET)
	public String enter(Locale locale, Model model) {
		
		return "Content/enterContent";
	}
	
//	view  My service List
	@RequestMapping(value = "/enterlist", method = RequestMethod.GET)
	public String enterList(HttpServletRequest request, HttpServletResponse response,
			Locale locale, Model model) {
		HttpSession session = request.getSession();
		
		//세션사용 사업자 등록번호 받아오기.
		String registNum = (String)session.getAttribute("");
		//사업자 번호로 검색후 리스트 받아오기
		request.setAttribute("approval1",  dao.selectAll(registNum));
		request.setAttribute("approval",  dao.selectsAll());
		//사업자 번호확인 로직
		if( registNum != null) {
			System.out.println("registNum값있을떄");
			return "Content/ContentList";
		}else {
			System.out.println("registNum값없을때");
			return "Content/ContentList";
		}
		
	}
	
//	insert service js to SQL
	@RequestMapping("/enterContent.do")
	public String Insert(@ModelAttribute("EnterContent")EnterContent vo,Model model) {
		vo.setRegistration_number("판매자테이블에서 사업자번호 가져와야함");
		vo.setService_approval("N");
		vo.setService_status("승인대기");
		dao.insert(vo);
		return "home/home";	
	}
	
}
//	@GetMapping("/enterstore.do")
//	public EnterStore Insert(@RequestBody EnterStore vo) {
//		map.insert(vo);
//		return vo;	
//	}
//	
//	@GetMapping("/enterstore/management")
//	public List<EnterStore> selectAll(){
//		
//		return map.selectAll();
//	}
