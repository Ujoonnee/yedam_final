package com.yedam.finalPrj.announcement.serviceImpl;

import java.util.List;

import com.yedam.finalPrj.announcement.service.Announcement;
import com.yedam.finalPrj.announcement.service.AnnouncementSearch;

public interface AnnouncementMapper {
	
	Announcement findOne(Announcement announcement);
	List<Announcement> findAll();
	int insert(Announcement announcement);
	int update(Announcement announcement);
	int delete(Announcement announcement);
	//검색
	List<Announcement> searchList(AnnouncementSearch announcementsearch);
	
	//글 갯수
	int totalCnt();
	
}
