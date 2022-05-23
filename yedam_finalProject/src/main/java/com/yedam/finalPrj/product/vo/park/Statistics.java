package com.yedam.finalPrj.product.vo.park;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Statistics {
	int storeNo;
	String startDate;
	String endDate;
	Date pickupDate;
	String paymentAmt;
}
