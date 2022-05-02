package com.yedam.finalPrj.announcement.service;

import java.util.List;

import com.yedam.finalPrj.announcement.vo.Announcement;

public interface AnnouncementMapper {
	
	Announcement findOne(Announcement announcement);
	List<Announcement> findAll();
	int insert(Announcement announcement);
	int update(Announcement announcement);
	int delete(Announcement announcement);
}
