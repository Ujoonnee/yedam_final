package com.yedam.finalPrj.exhibition.vo.lee;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ExhibitionReservationVO {
	
	private int exResNo;
	private String category;
	private int exNo;
	private Date exDate;
	private int amount;
	private int paymentAmt;
	private String paymentStatus;
	private String paymentStatusCodeName;
	private int memNo;
	private String name;
	
}
