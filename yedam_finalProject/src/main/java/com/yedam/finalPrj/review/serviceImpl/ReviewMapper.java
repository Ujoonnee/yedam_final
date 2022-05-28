package com.yedam.finalPrj.review.serviceImpl;

import java.util.List;

import com.yedam.finalPrj.review.service.Review;
import com.yedam.finalPrj.review.service.ReviewVO;

public interface ReviewMapper {
	int insert(ReviewVO vo);
	
//	리뷰 전체목록 조회
	List <Review> reviewSelectAll(int memNo);
//	리뷰 단건조회
	Review reviewSelectOne(ReviewVO vo);
//	리뷰 수정
	public int reviewUpdate(ReviewVO vo);
//	리뷰 삭제
	
}