package com.yedam.finalPrj.store.service;

import lombok.Data;

@Data
public class Product {
	private int prod_no;
	private int store_no;
	private String prod_name;
	private int stock;
	private String sold_out;
	private String price;
}
