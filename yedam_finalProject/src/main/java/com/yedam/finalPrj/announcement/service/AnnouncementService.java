package com.yedam.finalPrj.announcement.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;



public interface AnnouncementService {

	List<AnnouncementVO> findAll(AnnouncementPagingCriteria paging);
	List<AnnouncementVO> getTopList();
	AnnouncementVO findOne(AnnouncementVO announcement);
//	Announcement annInsert(Announcement announcement);
	
	//파일업로드 더미
	void annInsert(AnnouncementVO announcement, MultipartHttpServletRequest filerequest) throws IllegalStateException, IOException;
	void annInsertFile(Map<String, Object> map);

	public Map<String, Object> selectFileInfo(Map<String, Object> map);
	 List<Map<String, Object>> selectFileList(int annNo) ; 
	
	
	//글 갯수
	int totalCnt(AnnouncementPagingCriteria cri);
	int updateView(AnnouncementVO ann);
}
