package com.yedam.finalPrj.exhibition.vo.hong;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	 private int revNo;             // 리뷰번호
	 private int resNo;             // 예약번호
	 private String category;       // 카테고리
	 private String score;          // 평점
	 private String content;        // 리뷰내용
	 private String replyContent;   // 답변내용
	 private Date revTime;          // 리뷰작성시간
	 private Date replyTime;        // 답변작성시간
	 private int memNo;             // 회원번호
}
