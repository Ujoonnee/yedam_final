package com.yedam.finalPrj.announcement.serviceImpl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.yedam.finalPrj.announcement.service.AnnouncementPagingCriteria;
import com.yedam.finalPrj.announcement.service.AnnouncementVO;

public interface AnnouncementMapper {
	
	List<AnnouncementVO> adminFindAll(AnnouncementPagingCriteria paging);
	List<AnnouncementVO> userFindAll(AnnouncementPagingCriteria paging);
	List<AnnouncementVO> getTopList();
//	다중쿼리를 위해서 만들어둔 service
	List<AnnouncementVO> annFindAll(Map<String, Object>map);
	AnnouncementVO findOne(AnnouncementVO announcement);
	
	//공지사항
	void annInsert(AnnouncementVO announcement) throws IllegalStateException, IOException;
	public void annUpdate(AnnouncementVO announcement);

	//	다중 업데이트
	int statusUpdates(Map<String, Object> maps);
	int statusDelete(Map<String, Object> maps);
	int topStatus(Map<String, Object>maps);
	//파일 업로드 용
	void annInsertFile(Map<String, Object> map); 
	Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectFileList(int annNo) throws Exception; 
	public void fileUpdate(Map<String, Object>maps);
	public void fileDelete(Map<String, Object> map);
	
	//	Announcement annInsert(Announcement announcement);
	

	
	
	
	//글 갯수
	int totalCnt(AnnouncementPagingCriteria cri);
	// 조회수 올리기
	int updateView(AnnouncementVO ann);
}
