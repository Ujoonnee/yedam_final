package com.yedam.finalPrj.store.vo.jo;

import org.springframework.beans.factory.annotation.Autowired;

import com.yedam.finalPrj.product.vo.park.Product;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ReservedProductVO {

	private int prodResNo; 
	private int storeNo; 
	private int prodNo; 
	private int count; 
	
	@Autowired ProductReservationVO proResVO;
	@Autowired StoreVO storeVO;
	@Autowired Product productVO;
}
