package com.yedam.finalPrj.store.vo.jo;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.yedam.finalPrj.member.service.MemberVO;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ProductReservation {
	private long prodResNo;
	private int storeNo;
	private int memNo;
	private Date pickupTime;
	private Date pickupDate;
	private String pickupStatus;
	private String paymentAmt;
	private String paymentStatus;
	private Date orderDate;
	
	/*
	 * private ReservedProduct reservedProduct; private Store store; private Product
	 * product;
	 */
	
	@Autowired ReservedProduct reservedProduct;
	@Autowired Store store;
	@Autowired Product product;
	@Autowired MemberVO member;
}
