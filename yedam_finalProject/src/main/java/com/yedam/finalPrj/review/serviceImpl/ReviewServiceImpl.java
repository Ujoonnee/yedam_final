package com.yedam.finalPrj.review.serviceImpl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<Review> reviewSelectAll(Review vo, HttpSession session) {
		// TODO Auto-generated method stub
		return map.reviewSelectAll(vo);
	}


	@Override
	public Review reviewSelectOne(Review vo) {
		// TODO Auto-generated method stub
		return map.reviewSelectOne(vo);
	}
}
