package com.yedam.finalPrj.store.vo.jo;

import lombok.Data;

@Data
public class ProductVO {

	private int prodNo;
	private int storeNo;
	private String prodName;
	private int stock;
	private String status;
	private String price;
	private String prodThumbnail;
	private String prodCat;
}
