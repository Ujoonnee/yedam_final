package com.yedam.finalPrj.announcement.service;



import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class AnnouncementVO {
	private int annNo;
	private String title;
	private String annContent;
	private Date annDate;
	private int annView;
	private String status;
	private int annCnt;
	@Override
	public String toString() {
		return "Announcement [annNo=" + annNo + ", title=" + title + ", annContent=" + annContent + ", annDate="
				+ annDate + ", annView=" + annView + ", status=" + status + ", annCnt=" + annCnt + "]";
	}
	
	
}