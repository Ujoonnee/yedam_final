package com.yedam.finalPrj.review.serviceImpl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.member.service.MemberVO;
import com.yedam.finalPrj.review.service.Review;
import com.yedam.finalPrj.review.service.ReviewService;

@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService {

	@Autowired ReviewMapper map;


	@Override
	public int insert(Review vo) {
		return 0;
	}


	@Override
	public List<Review> reviewSelectAll(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		
//		Review vo = new Review();
//		vo.setMemNo(user.getMemNo());
		
		return map.reviewSelectAll(user);
	}


	@Override
	public Review reviewSelectOne(Review vo) {
		// TODO Auto-generated method stub
		return map.reviewSelectOne(vo);
	}


	@Override
	public int reviewUpdate(Review vo) {
		// TODO Auto-generated method stub
		return map.reviewUpdate(vo);
	}
}
