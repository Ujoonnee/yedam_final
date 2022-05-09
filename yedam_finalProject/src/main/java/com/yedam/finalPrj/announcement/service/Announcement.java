package com.yedam.finalPrj.announcement.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Announcement {
	private String announcementSerial;
	private String announcementTitle;
	private String announcementContent;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date announcementDate;
	private String announcementHidden;
	private int announcementView;
	private String announcementStatus;
	private String announcement_deleteStatus;
	private String announcementPriorityStatus;
	private int announcementCnt;

}
