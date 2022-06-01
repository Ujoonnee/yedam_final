package com.yedam.finalPrj.review.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.review.service.Review;
import com.yedam.finalPrj.review.service.ReviewService;
import com.yedam.finalPrj.review.service.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired ReviewMapper map;


	@Override
	public int insert(ReviewVO vo) {
		vo.getRevNo();
		return map.insert(vo);
	}


	@Override
	public List<Review> reviewSelectAll(int memNo) {
		
//		Review vo = new Review();
//		vo.setMemNo(user.getMemNo());
		
		return map.reviewSelectAll(memNo);
	}


	@Override
	public ReviewVO reviewSelectOne(int revNo) {
		// TODO Auto-generated method stub
		return map.reviewSelectOne(revNo);
	}


	@Override
	public int reviewUpdate(ReviewVO vo) {
		// TODO Auto-generated method stub
		return map.reviewUpdate(vo);
	}

//답변등록.
	@Override
	public void replyInsert(int prodResNo, String replyContent) {
		map.replyInsert(prodResNo, replyContent);
	}
}