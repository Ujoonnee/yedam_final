package com.yedam.finalPrj.show;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class Show {
	
	private int showNo;
	private String name;
	private int price;
	private String thumbnail;
	private String tel;
	private String address;
	private String detail;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm", timezone="Asia/Seoul")
	private Date startDate;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm", timezone="Asia/Seoul")
	private Date endDate;
	
	private String seatRow;
	private String seatCol;
	private String category;
	private String approvalStatus;
	private int memNo;
	
}
