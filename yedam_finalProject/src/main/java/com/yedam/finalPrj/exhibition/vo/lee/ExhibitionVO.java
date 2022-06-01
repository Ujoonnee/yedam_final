package com.yedam.finalPrj.exhibition.vo.lee;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ExhibitionVO {
	
	private int exNo;
	private int memNo;
	private String name;
	private String locationName;
	private int price;
	private String thumbnail;
	private String tel;
	private String address;
	private Date startDate;
	private Date endDate;
	private String detail;
	private String category;
	private String categoryCodeName;
	private String approvalStatus;
	private String approvalStatusCodeName;
	private Date applicationDate;

}
