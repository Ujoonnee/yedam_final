package com.yedam.finalPrj.review.serviceImpl;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.finalPrj.review.service.Review;
import com.yedam.finalPrj.review.service.ReviewVO;

public interface ReviewMapper {
	int insert(ReviewVO vo);
	
//	리뷰 전체목록 조회
	List <Review> reviewSelectAll(int memNo);
//	리뷰 단건조회
	ReviewVO reviewSelectOne(int revNo);
//	리뷰 수정
	public int reviewUpdate(ReviewVO vo);
//	리뷰 삭제

	
//답변 등록
	void replyInsert(@Param("prodResNo") int prodResNo, @Param("replyContent") String replyContent);
//전시답변 등록
	void exhReplyInsert(@Param("resNo") int resNo,@Param("replyContent") String replyContent);
}