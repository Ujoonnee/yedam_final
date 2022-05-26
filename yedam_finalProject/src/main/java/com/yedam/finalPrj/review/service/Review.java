package com.yedam.finalPrj.review.service;

import java.util.Date;

import lombok.Data;

@Data
public class Review {

	private int revNo;
	private String serviceName;
	private int facResNo;
	private String category;
	private String score;
	private String content;
	private String replyContent;
	private Date revTime;
	private Date replyTime;
	private int memNo;

}
