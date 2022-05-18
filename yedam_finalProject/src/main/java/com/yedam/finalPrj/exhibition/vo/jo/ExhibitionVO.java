package com.yedam.finalPrj.exhibition.vo.jo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.yedam.finalPrj.member.service.MemberVO;

import lombok.Data;

@Data
public class ExhibitionVO {
	
	private int exNo;
	private int memNo;
	private String name;
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
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date ApplicationDate;
	
	private MemberVO member;
}
