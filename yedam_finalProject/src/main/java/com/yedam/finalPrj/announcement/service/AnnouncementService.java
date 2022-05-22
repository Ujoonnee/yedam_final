package com.yedam.finalPrj.announcement.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.finalPrj.common.FileVO;



public interface AnnouncementService {

	List<AnnouncementVO> findAll(AnnouncementPagingCriteria paging);
	List<AnnouncementVO> getTopList();
	AnnouncementVO findOne(AnnouncementVO announcement);
	
		
	//	Announcement annInsert(Announcement announcement);
	
	//파일업로드 더미
	void annInsert(AnnouncementVO announcement, MultipartHttpServletRequest filerequest) throws IllegalStateException, IOException;
	void annInsertFile(Map<String, Object> map);

	public Map<String, Object> selectFileInfo(Map<String, Object> maps) throws Exception;
	List<Map<String, Object>> selectFileList(int annNo) throws Exception; 

	//	다중 파일 업로드 및 삭제 수정
	public void annUpdate(AnnouncementVO announcement, String[] files, String[] fileNames, MultipartHttpServletRequest filerequest) throws Exception;
	public void fileUpdate(Map<String, Object>maps);
	public void fileDelete(FileVO file);
//	public void annUpdate(AnnouncementVO announcement);
	//글 갯수
	int totalCnt(AnnouncementPagingCriteria cri);
	int updateView(AnnouncementVO ann);
	
}
