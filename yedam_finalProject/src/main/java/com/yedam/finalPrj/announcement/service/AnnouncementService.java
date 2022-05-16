package com.yedam.finalPrj.announcement.service;

import java.util.List;

public interface AnnouncementService {

	List<Announcement> findAll(AnnouncementPagingCriteria paging);
	List<Announcement> getTopList();
	Announcement findOne(Announcement announcement);

	//글 갯수
	int totalCnt(AnnouncementPagingCriteria cri);
	int updateView(Announcement ann);
}
