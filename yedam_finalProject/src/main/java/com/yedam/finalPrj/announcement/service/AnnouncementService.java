package com.yedam.finalPrj.announcement.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.finalPrj.common.FileVO;



public interface AnnouncementService {

	List<AnnouncementVO> adminFindAll(AnnouncementPagingCriteria paging);
	List<AnnouncementVO> userFindAll(AnnouncementPagingCriteria paging);
	List<AnnouncementVO> getTopList();
	//다중쿼리를 위해서 만들어둔 service
	List<AnnouncementVO> annFindAll(Map<String, Object>map);
	
	AnnouncementVO findOne(AnnouncementVO announcement);
	public void annUpdate(AnnouncementVO announcement, String[] files, String[] fileNames,MultipartHttpServletRequest filerequest) throws Exception;

	//다중업데이트
	int statusUpdates(Map<String, Object>maps);
	int statusDelete(Map<String, Object>maps);
	int topStatus(Map<String, Object>maps);
	//	public void annUpdate(AnnouncementVO announcement);		
	//	Announcement annInsert(Announcement announcement);
	
	//파일업로드
	void annInsert(AnnouncementVO announcement, MultipartHttpServletRequest filerequest) throws IllegalStateException, IOException;
	void annInsertFile(Map<String, Object> map);
	public Map<String, Object> selectFileInfo(Map<String, Object> maps) throws Exception;
	List<Map<String, Object>> selectFileList(int annNo) throws Exception; 
	public void fileUpdate(FileVO file, HttpServletRequest fileRequest);
//	List<String> selectZipFileInfo(List<String> list); 
	//글 갯수
	int totalCnt(AnnouncementPagingCriteria cri);
	//조회수
	int updateView(AnnouncementVO ann);
	
}
