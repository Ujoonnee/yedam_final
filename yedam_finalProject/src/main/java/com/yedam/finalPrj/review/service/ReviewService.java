package com.yedam.finalPrj.review.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface ReviewService {
	int insert(Review vo);
	
//	리뷰 전체목록 조회
	List <Review> reviewSelectAll(HttpServletRequest request);
//	리뷰 단건조회
	Review reviewSelectOne(Review vo);
//	리뷰 수정
	public int reviewUpdate(Review vo);
//	리뷰 삭제
	
}
