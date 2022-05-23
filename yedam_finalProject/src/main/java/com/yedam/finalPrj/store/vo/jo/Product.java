package com.yedam.finalPrj.store.vo.jo;

import lombok.Data;

@Data
public class Product {

	private int prodNo;
	private int storeNo;
	private String prodName;
	private int stock;
	private String soldOut;
	private String price;
	private String prodThumbnail;
	private String prodCat;
}
