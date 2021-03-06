package com.yedam.finalPrj.store.vo.park;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ProductReservation {
	private int prodResNo;
	private int storeNo;
	private int memNo;
	private Timestamp pickupTime;
	private Date pickupDate;
	private String paymentAmt;
	private String paymentStatus;
	private Date orderDate;
	private String pickupStatus;
	private String category;
}
