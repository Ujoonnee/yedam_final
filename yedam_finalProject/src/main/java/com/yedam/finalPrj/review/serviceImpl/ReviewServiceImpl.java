package com.yedam.finalPrj.review.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.review.service.ReviewService;

@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService {

	@Autowired ReviewMapper map;

	@Override
	public int insert(String content) {
		System.out.println(content);
		return 0;
	}
}
