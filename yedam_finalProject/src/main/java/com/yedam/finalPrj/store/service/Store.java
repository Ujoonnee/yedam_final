package com.yedam.finalPrj.store.service;

import lombok.Data;

@Data
public class Store {
	private long storeNo;
	private String category;
	private String name;
	private String storeCat;
	private String address;
	private double latitude;
	private double longitude;
	private String tel;
	private String thumbnail;
	private int storeCnt;
}
