package com.yedam.finalPrj.announcement.service;

import java.util.List;



public interface AnnouncementService {

	Announcement findOne(Announcement announcement);
	List<Announcement> findAll(AnnouncementPagingCriteria paging);
	int insert(Announcement announcement);
	int update(Announcement announcement);
	int delete(Announcement announcement);

	//글 갯수
	int totalCnt(AnnouncementPagingCriteria cri);
	void viewUpdate(int annNo);
}
