package com.yedam.finalPrj.store.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.yedam.finalPrj.product.service.Product;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ReservedGoods {

	private long prodResNo; 
	private int storeNo3; 
	private int prodNo2; 
	private int count; 
	
	@Autowired ProductReservation proResVO;
	@Autowired Store storeVO;
	@Autowired Product productVO;
}
