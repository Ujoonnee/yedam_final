package com.yedam.finalPrj.announcement.serviceImpl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.yedam.finalPrj.announcement.service.AnnouncementVO;
import com.yedam.finalPrj.announcement.service.AnnouncementPagingCriteria;

public interface AnnouncementMapper {
	
	List<AnnouncementVO> findAll(AnnouncementPagingCriteria paging);
	List<AnnouncementVO> getTopList();
	AnnouncementVO findOne(AnnouncementVO announcement);
	//파일 업로드 테스트용
	void annInsert(AnnouncementVO announcement) throws IllegalStateException, IOException;
	void annInsertFile(Map<String, Object> map); 
	Map<String, Object> selectFileInfo(Map<String, Object> map);
	List<Map<String, Object>> selectFileList(int annNo) ; 
	//	Announcement annInsert(Announcement announcement);
	
	
	//글 갯수
	int totalCnt(AnnouncementPagingCriteria cri);
	// 조회수 올리기
	int updateView(AnnouncementVO ann);
}
