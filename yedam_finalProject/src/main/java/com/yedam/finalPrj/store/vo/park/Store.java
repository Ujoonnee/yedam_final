package com.yedam.finalPrj.store.vo.park;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
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
	private int memNo;
	private Date applicationDate;
	private String approvalStatus;
	
	private String memName;
}
