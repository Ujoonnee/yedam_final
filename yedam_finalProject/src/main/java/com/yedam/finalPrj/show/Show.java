package com.yedam.finalPrj.show;

import java.util.Date;

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
	private Date startDate;
	private Date endDate;
	private String seatRow;
	private String seatCol;
	private String category;
	private String approvalStatus;
	private int memNo;
	
}
