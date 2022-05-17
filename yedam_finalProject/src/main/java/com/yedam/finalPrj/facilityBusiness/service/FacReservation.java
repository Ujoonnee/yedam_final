package com.yedam.finalPrj.facilityBusiness.service;

import com.yedam.finalPrj.member.service.Member;

import lombok.Data;

@Data
public class FacReservation {
	private int facResNo;
	private int facNo;
	private String startDate;
	private String endDate;
	private String payDate;
	private String paymentAmt;
	private String resStatus;
	private String revStatus;
	private String memNo;
	
	
	private Member member;
	
}
