package com.yedam.finalPrj.review.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.finalPrj.member.service.MemberVO;
import com.yedam.finalPrj.review.service.Review;
import com.yedam.finalPrj.review.service.ReviewService;
import com.yedam.finalPrj.review.service.ReviewVO;


@Controller //컨트롤러 빈으로 등록
@RequestMapping("/review/*")
public class ReviewController {

	@Autowired ReviewService service;
	
//	Hong	
	
//	리뷰 목록 조회
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public String reviewList(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		System.out.println(session);
		MemberVO user = (MemberVO) session.getAttribute("user");
		int memNo = user.getMemNo();
		
		model.addAttribute("reviewList", service.reviewSelectAll(memNo));
		return "general/review/reviewList";
	}
	
	@ResponseBody
	@RequestMapping("reviewListAjax")
	public List<Review> reviewListAjax(HttpServletRequest request){
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		int memNo = user.getMemNo();
		return service.reviewSelectAll(memNo);
	}
	

//JO
	//리뷰모달 버튼 클릭시 리뷰jsp 던져주기.
	@GetMapping("rev_insert")
	public String insert() {
		return "member/review";
	}
	//리뷰등록하기.
	@PostMapping("rev_insert")
	@ResponseBody
	public void list(ReviewVO vo, Model model) {
		service.insert(vo);
	}
	
	@GetMapping("rev_update/{revNo}")
	public String update(@PathVariable("revNo") int revNo, Model model) {
		service.reviewSelectOne(revNo);
		model.addAttribute("review", service.reviewSelectOne(revNo));
		return "member/reviewUpdate";
	}
	
	@PostMapping("rev_update")
	@ResponseBody
	public void updatedlist(ReviewVO vo, Model model) {
		service.reviewUpdate(vo);
	}
	//답변 등록.
	@PostMapping("replyInsert")
	public String replyInsert(int prodResNo, String replyContent) {
		service.replyInsert(prodResNo, replyContent);
		
		return "redirect:/store/product/proReDetail?prodResNo="+prodResNo;
	}
	//전시리뷰의 답변 등록.
	@PostMapping("exhReplyInsert")
	@ResponseBody
	public void exhReplyInsert(int resNo, String replyContent) {
		service.exhReplyInsert(resNo, replyContent);
		
		//return "redirect:/store/product/proReDetail?prodResNo="+resNo;
	}

	
}
