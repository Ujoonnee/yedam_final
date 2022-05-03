package com.yedam.finalPrj.announcement.service;

import lombok.Getter;
import lombok.Setter;
import oracle.sql.DATE;

@Setter
@Getter
public class Announcement {
	private String announcementSerial;
	private String announcementTitle;
	private String announcementContent;
	private DATE announcementDate;
	private String announcementWriter;
	private String announcementHidden;
	private int announcementView;
	
}
