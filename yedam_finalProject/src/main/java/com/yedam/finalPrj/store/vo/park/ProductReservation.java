package com.yedam.finalPrj.store.vo.park;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ProductReservation {
	private int prodResNo;
	private int storeNo;
	private int memNo;
	private Date pickupTime;
	private Date pickupDate;
	private String paymentAmt;
	private String paymentStatus;
	private Date orderDate;
	private String pickupStatus;
}
