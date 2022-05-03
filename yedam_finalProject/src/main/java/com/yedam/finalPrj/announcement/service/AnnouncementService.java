package com.yedam.finalPrj.announcement.service;

import java.util.List;

public interface AnnouncementService {

	Announcement findOne(Announcement announcement);
	List<Announcement> findAll();
	int insert(Announcement announcement);
	int update(Announcement announcement);
	int delete(Announcement announcement);
}
