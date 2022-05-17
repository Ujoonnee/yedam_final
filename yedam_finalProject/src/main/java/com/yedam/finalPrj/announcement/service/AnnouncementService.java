package com.yedam.finalPrj.announcement.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;


public interface AnnouncementService {

	List<Announcement> findAll(AnnouncementPagingCriteria paging);
	List<Announcement> getTopList();
	Announcement findOne(Announcement announcement);
//	Announcement annInsert(Announcement announcement);
	
	//파일업로드 더미
	Announcement annInsert(Announcement announcement, MultipartHttpServletRequest filerequest) throws IllegalStateException, IOException;
	void annInsertFile(Map<String, Object> map);
	
	
	//글 갯수
	int totalCnt(AnnouncementPagingCriteria cri);
	int updateView(Announcement ann);
}
