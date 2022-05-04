package com.yedam.finalPrj.announcement.serviceImpl;

import java.util.List;

import com.yedam.finalPrj.announcement.service.Announcement;

public interface AnnouncementMapper {
	
	Announcement findOne(Announcement announcement);
	List<Announcement> findAll();
	int insert(Announcement announcement);
	int update(Announcement announcement);
	int delete(Announcement announcement);
	//검색 메서드명 미정
	List<Announcement> searchList(Announcement announcement);
}
