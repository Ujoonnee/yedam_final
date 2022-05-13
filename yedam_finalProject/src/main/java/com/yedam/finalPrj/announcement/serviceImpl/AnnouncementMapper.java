package com.yedam.finalPrj.announcement.serviceImpl;

import java.util.List;

import com.yedam.finalPrj.announcement.service.Announcement;
import com.yedam.finalPrj.announcement.service.AnnouncementPagingCriteria;

public interface AnnouncementMapper {
	
	Announcement findOne(Announcement announcement);
	List<Announcement> findAll(AnnouncementPagingCriteria paging);
	int insert(Announcement announcement);
	int update(Announcement announcement);
	int delete(Announcement announcement);
	
	//글 갯수
	int totalCnt(AnnouncementPagingCriteria cri);
	// 조회수 올리기
	int updateView(Announcement ann);
}
