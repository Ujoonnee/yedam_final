package com.yedam.finalPrj.exhibition.vo.park;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ParkExhibitionVO {

	private int exNo;
	private int memNo;
	private String name = "";
	private String showRoom;
	private int price;
	private String thumbnail;
	private String tel;
	private String address = "";
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date endDate;
	private String detail; 
	private String category;
	private String approvalStatus;
	private Date applicationDate;
	
}
