package com.yedam.finalPrj.exhibition.vo.hong;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ExhibitionReservationVO {
	
	private int exResNo;
	private int exNo;
	private Date exDate;
	private int amount;
	private int paymentAmt;
	private String category;
	private String paymentStatus;
	private int memNo;
	
	
	private String name;
	private String showRoom;
	private int price;
	private String thumbnail;
	private String tel;
	private String address;
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	private String detail;
	private String approvalStatus;
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date applicationDate;
	
	private int payment;
	
	private String memName;
	private String memTel;
	
}
