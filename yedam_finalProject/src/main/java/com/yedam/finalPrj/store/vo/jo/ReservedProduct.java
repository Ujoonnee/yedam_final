package com.yedam.finalPrj.store.vo.jo;

import org.springframework.beans.factory.annotation.Autowired;

import com.yedam.finalPrj.product.vo.park.Product;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ReservedProduct {

	private long prodResNo; 
	private int storeNo; 
	private int prodNo; 
	private int count; 
	
	@Autowired ProductReservation proResVO;
	@Autowired Store storeVO;
	@Autowired Product productVO;
}
