package com.yedam.finalPrj.product.service;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Product {
	private long prodNo;
	private int storeNo;
	private String prodName;
	private int stock;
	private String soldOut;
	private String price;
	private String prodThumbnail;
	private int productCnt;
}

