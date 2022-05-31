package com.yedam.finalPrj.exhibition.vo.jo;

import java.sql.Date;

import com.yedam.finalPrj.member.service.MemberVO;

import lombok.Data;

@Data
public class ExhibitionVO {
	
	private int exNo;
	private int memNo;
	private String name;
	private String locationName;
	private String showRoom;
	private int price;
	private String thumbnail;
	private String tel;
	private String address;
	private Date startDate;
	private Date endDate;
	private String detail;
	private String category;
	private String approvalStatus;
	private Date applicationDate;
	
	private MemberVO member;
}
