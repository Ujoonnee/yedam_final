package com.yedam.finalPrj.review.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yedam.finalPrj.review.service.Review;
import com.yedam.finalPrj.review.serviceImpl.ReviewMapper;

@Controller //컨트롤러 빈으로 등록
@RequestMapping("/review/*")
public class ReviewController {

	@Autowired ReviewMapper mapper;
	
	@GetMapping("rev_insert")
	public String insert(String content, Review vo, Model model) {
		
		return "review/review";
	}
	@PostMapping("rev_insert.do")
	public String list(String content, Review vo, Model model) {
		System.out.println("폼이 작동했다.-----------------------------");
		System.out.println(content);
		System.out.println("폼이 작동했다.-----------------------------");
		mapper.insert(vo);
		/* vo.setContent(content); */ //db에  저장은 안됨.
		System.out.println("폼이 작동했다.-----------------------------");
		System.out.println(vo.getContent());
		System.out.println("폼이 작동했다.-----------------------------");
		System.out.println(vo);
		System.out.println("폼이 작동했다.-----------------------------");
		
		return "review/reviewList";
	}
	
	
	
	
//	리뷰 목록 조회
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public String reviewList(Review vo, Model model,HttpSession session) {
		vo.setMemNo((int) session.getAttribute("memNo"));
		List<Review> reviewList = mapper.reviewSelectAll(vo);
		model.addAttribute("reviewList", reviewList);
		return "review/reviewList";
	}
	
	
}
