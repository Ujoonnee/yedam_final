package com.yedam.finalPrj.facilityBusiness.service;

import com.yedam.finalPrj.member.service.MemberVO;

import lombok.Data;

@Data
public class FacReservation {
	private int facResNo;
	private int facNo;
	private String startDate;
	private String endDate;
	private String payDate;
	private String paymentAmt;
	private String status;
	private String memNo;
	
	private MemberVO member;
	
}