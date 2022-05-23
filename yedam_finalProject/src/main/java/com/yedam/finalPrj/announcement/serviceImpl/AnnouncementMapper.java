package com.yedam.finalPrj.announcement.serviceImpl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.yedam.finalPrj.announcement.service.AnnouncementPagingCriteria;
import com.yedam.finalPrj.announcement.service.AnnouncementVO;

public interface AnnouncementMapper {
	
	List<AnnouncementVO> findAll(AnnouncementPagingCriteria paging);
	List<AnnouncementVO> getTopList();
	AnnouncementVO findOne(AnnouncementVO announcement);
	//파일 업로드 테스트용
	void annInsert(AnnouncementVO announcement) throws IllegalStateException, IOException;
	void annInsertFile(Map<String, Object> map); 
	Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectFileList(int annNo) throws Exception; 
	public void fileUpdate(Map<String, Object>maps);
	public void annUpdate(AnnouncementVO announcement);
	//	Announcement annInsert(Announcement announcement);
	
	
	//글 갯수
	int totalCnt(AnnouncementPagingCriteria cri);
	// 조회수 올리기
	int updateView(AnnouncementVO ann);
}
