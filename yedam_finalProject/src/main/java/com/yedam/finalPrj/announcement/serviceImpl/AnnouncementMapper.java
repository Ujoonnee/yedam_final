package com.yedam.finalPrj.announcement.serviceImpl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.finalPrj.announcement.service.Announcement;
import com.yedam.finalPrj.announcement.service.AnnouncementPagingCriteria;

public interface AnnouncementMapper {
	
	List<Announcement> findAll(AnnouncementPagingCriteria paging);
	List<Announcement> getTopList();
	Announcement findOne(Announcement announcement);
	//파일 업로드 테스트용
	Announcement annInsert(Announcement announcement, MultipartHttpServletRequest filerequest) throws IllegalStateException, IOException;
	void annInsertFile(Map<String, Object> map); 
//	Announcement annInsert(Announcement announcement);
	
	
	//글 갯수
	int totalCnt(AnnouncementPagingCriteria cri);
	// 조회수 올리기
	int updateView(Announcement ann);
}
