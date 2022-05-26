package com.yedam.finalPrj.review.serviceImpl;

import java.util.List;

import com.yedam.finalPrj.member.service.MemberVO;
import com.yedam.finalPrj.review.service.Review;

public interface ReviewMapper {
	int insert(Review vo);
	
//	리뷰 전체목록 조회
	List <Review> reviewSelectAll(MemberVO user);
//	리뷰 단건조회
	Review reviewSelectOne(Review vo);
//	리뷰 수정
	public int reviewUpdate(Review vo);
//	리뷰 삭제
	
}
