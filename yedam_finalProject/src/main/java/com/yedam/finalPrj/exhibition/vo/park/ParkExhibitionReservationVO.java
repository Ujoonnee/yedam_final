package com.yedam.finalPrj.exhibition.vo.park;

import lombok.Data;

@Data
public class ParkExhibitionReservationVO {
	private int exResNo;
	private int exNo;
	private int memNo;
	private String exDate;
	private int amount;
	private int paymentAmt;
	private String category;
	private String status;
}
