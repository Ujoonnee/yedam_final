package com.yedam.finalPrj.exhibition.service;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ExhibitionReservation {
	int exResNo;
	int exNo;
	String exdate;
	int amount;
	int paymentAmt;
	String category;
	String status;
}
