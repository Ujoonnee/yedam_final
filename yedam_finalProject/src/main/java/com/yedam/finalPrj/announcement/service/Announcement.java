package com.yedam.finalPrj.announcement.service;



import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Announcement {
	private String annNo;
	private String title;
	private String annContent;
	private Date annDate;
	private int annView;
	private String status;
	private int annCnt;
}