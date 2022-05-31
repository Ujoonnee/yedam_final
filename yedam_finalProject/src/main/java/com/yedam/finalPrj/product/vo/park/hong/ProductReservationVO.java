package com.yedam.finalPrj.product.vo.park.hong;

import java.util.Date;

import lombok.Data;

@Data
public class ProductReservationVO {
	
//  상품 예약
	private long prodResNo;
	private int storeNo;
	private int memNo;
	private Date pickupTime;
	private Date pickupDate;
	private String paymentAmt;
	private String paymentStatus;
	private Date orderDate;
	private String pickupStatus;

	
//	멤버테이블 
//	예약자명
	private String name;
//	예약자 연락처
	private String tel;
	
//	상품 테이블
	private String prodThumbnail;
	private String prodName;
	private String price;
	
	
//	예약상품 테이블 VO
	private int prodNo;
	private int count;
	
	
//	상품주문금액 받을 VO
	private int payment;
	
//  리뷰 순번
	private int revNo;
}
