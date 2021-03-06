package com.yedam.finalPrj.review.service;

import java.sql.Date;

import com.yedam.finalPrj.member.service.MemberVO;

import lombok.Data;

@Data
public class ReviewVO {

	private int revNo;
	private int resNo;
	private String category;
	private String score;
	private String content;
	private String replyContent;
	private Date revTime;
	private Date replyTime;
	private int memNo;
	private String serviceName;

	private MemberVO member;
}
