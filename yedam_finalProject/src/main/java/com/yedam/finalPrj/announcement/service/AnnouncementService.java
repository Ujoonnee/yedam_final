package com.yedam.finalPrj.announcement.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.finalPrj.common.FileVO;



public interface AnnouncementService {

	List<AnnouncementVO> findAll(AnnouncementPagingCriteria paging);
	List<AnnouncementVO> getTopList();
	AnnouncementVO findOne(AnnouncementVO announcement);
	public void annUpdate(AnnouncementVO announcement, String[] files, String[] fileNames, MultipartHttpServletRequest filerequest) throws Exception;
	int annUpdates(List<AnnouncementVO> announcement);
//	public void annUpdate(AnnouncementVO announcement);		
	//	Announcement annInsert(Announcement announcement);
	
	//파일업로드
	void annInsert(AnnouncementVO announcement, MultipartHttpServletRequest filerequest) throws IllegalStateException, IOException;
	void annInsertFile(Map<String, Object> map);
	public Map<String, Object> selectFileInfo(Map<String, Object> maps) throws Exception;
	List<Map<String, Object>> selectFileList(int annNo) throws Exception; 
	public void fileUpdate(Map<String, Object>maps);
	public String fileDelete(HttpServletRequest request, HttpServletResponse response);

	//글 갯수
	int totalCnt(AnnouncementPagingCriteria cri);
	int updateView(AnnouncementVO ann);
	
}
