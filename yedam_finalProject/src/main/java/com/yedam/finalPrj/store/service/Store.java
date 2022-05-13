package com.yedam.finalPrj.store.service;

import lombok.Data;

@Data
public class Store {
	private long store_no;
	private String category;
	private String name;
	private String store_cat;
	private String address;
	private double latitude;
	private double longitude;
	private String tel;
	private String thumbnail;
	private int store_cnt;
}
