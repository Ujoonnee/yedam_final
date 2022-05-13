package com.yedam.finalPrj.review.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.finalPrj.review.service.Review;

@Controller //컨트롤러 빈으로 등록
@RequestMapping("/review/*")
public class ReviewController {

	@PostMapping("rev_insert.do")
	public String insert(String content, Review vo, Model model) {
		System.out.println(content);
		System.out.println("폼이 작동했다.");
		
		vo.setContent(content);
		System.out.println(vo.getContent());
		System.out.println(vo);
		
		
		return "review/reviewList";
	}
}
