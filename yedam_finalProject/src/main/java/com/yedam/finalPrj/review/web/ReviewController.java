package com.yedam.finalPrj.review.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.finalPrj.member.service.MemberVO;
import com.yedam.finalPrj.review.service.Review;
import com.yedam.finalPrj.review.service.ReviewService;

@Controller //컨트롤러 빈으로 등록
@RequestMapping("/review/*")
public class ReviewController {

	@Autowired ReviewService service;
	
//	Hong	
	
//	리뷰 목록 조회
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public String reviewList(Model model,HttpServletRequest request) {
		model.addAttribute("reviewList", service.reviewSelectAll(request));
		return "review/reviewList";
	}
	
	
//	리뷰 수정
//	@ResponseBody
//	@RequestMapping("/reviewUpdate")
//	public String reviewUpdate( Model model, @ModelAttribute Review vo) {
//		mapper.reviewUpdate(vo);
//		Map<String,Object> map = new HashMap<>();
//		map.put("isSuccess", true);
//		model.addAttribute("reviewUpdate", vo.getContent());
//		return "review/reviewList";
//	}
	
}
