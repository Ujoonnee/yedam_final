package com.yedam.finalPrj.review.service;

import java.util.List;

public interface ReviewService {
	
	
	int insert(ReviewVO vo);
	
//	리뷰 전체목록 조회
	List <Review> reviewSelectAll(int memNo);
//	리뷰 단건조회
	ReviewVO reviewSelectOne(int revNo);
//	리뷰 수정
	public int reviewUpdate(ReviewVO vo);
//	리뷰 삭제

	//상품예약 답변등록.
	void replyInsert(int prodResNo, String replyContent);
	//전시리뷰 답변 등록.
	void exhReplyInsert(int resNo, String replyContent);
}