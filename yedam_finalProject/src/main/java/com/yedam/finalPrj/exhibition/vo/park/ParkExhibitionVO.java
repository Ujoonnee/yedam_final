package com.yedam.finalPrj.exhibition.vo.park;

import java.sql.Date;

import lombok.Data;

@Data
public class ParkExhibitionVO {

	private int exNo;
	private int memNo;
	private String name;
	private String showRoom;
	private int price;
	private String thumbnail;
	private String tel;
	private String address;
	private Date startDate;
	private Date endDate;
	private String detail; 
	private String category;
	private String approvalStatus;
	private Date applicationDate;
	
}
