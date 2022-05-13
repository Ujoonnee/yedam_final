package com.yedam.finalPrj.review.service;

import lombok.Data;

@Data
public class Review {

	private int revNo;
	private int facResNo;
	private String category;
	private String score;
	private String content;
	private String replyContent;
	private String revTime;
	private String replyTime;
	private int memNo;

}
