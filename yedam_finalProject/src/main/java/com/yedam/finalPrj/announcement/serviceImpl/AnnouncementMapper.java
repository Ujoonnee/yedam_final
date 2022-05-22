package com.yedam.finalPrj.announcement.serviceImpl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.yedam.finalPrj.announcement.service.AnnouncementPagingCriteria;
import com.yedam.finalPrj.announcement.service.AnnouncementVO;
import com.yedam.finalPrj.common.FileVO;

public interface AnnouncementMapper {
	
	List<AnnouncementVO> findAll(AnnouncementPagingCriteria paging);
	List<AnnouncementVO> getTopList();
	AnnouncementVO findOne(AnnouncementVO announcement);
	
	//공지사항
	void annInsert(AnnouncementVO announcement) throws IllegalStateException, IOException;
	public void annUpdate(AnnouncementVO announcement);
	
	//파일 업로드 용
	void annInsertFile(Map<String, Object> map); 
	Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectFileList(int annNo) throws Exception; 
	public void fileUpdate(Map<String, Object>maps);
	public void fileDelete(FileVO file);
	
	//	Announcement annInsert(Announcement announcement);
	
	// 메일
	
	
	
	//글 갯수
	int totalCnt(AnnouncementPagingCriteria cri);
	// 조회수 올리기
	int updateView(AnnouncementVO ann);
}
