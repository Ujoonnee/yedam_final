package com.yedam.finalPrj.exhibition.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Exhibition {
	private int exNo;
	private int memNo;
	private String name;
	private String showRoom;
	private int price;
	private String address;
	private String thumbnail;
	private String tel;
	private Date startDate;
	private Date endDate;
	private String detail;
	private String category;
	private String approvalStatus;
	
}
