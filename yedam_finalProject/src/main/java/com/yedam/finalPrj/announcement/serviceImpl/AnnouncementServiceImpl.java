package com.yedam.finalPrj.announcement.serviceImpl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.finalPrj.announcement.service.AnnouncementPagingCriteria;
import com.yedam.finalPrj.announcement.service.AnnouncementService;
import com.yedam.finalPrj.announcement.service.AnnouncementVO;
import com.yedam.finalPrj.common.FileUtils;

@Service("AnnouncementServiceImpl")
public class AnnouncementServiceImpl implements AnnouncementService {

	@Autowired
	AnnouncementMapper map;

	@Autowired
	FileUtils file;
	
	@Override
	public List<AnnouncementVO> findAll(AnnouncementPagingCriteria paging) {
		return map.findAll(paging);
	}

	@Override
	public List<AnnouncementVO> getTopList() {
		return map.getTopList();
	}

	@Override
	public AnnouncementVO findOne(AnnouncementVO announcement) {
		return map.findOne(announcement);
	}

	@Override
	public int totalCnt(AnnouncementPagingCriteria cri) {
		return map.totalCnt(cri);
	}

	@Override
	public int updateView(AnnouncementVO ann) {
		return map.updateView(ann);
	}

	/*
	 * @Override public Announcement annInsert(Announcement announcement) {
	 * 
	 * return map.annInsert(announcement); }
	 */

	@Override
	public void annInsert(AnnouncementVO announcement, MultipartHttpServletRequest filerequest)

			throws IllegalStateException, IOException {

		map.annInsert(announcement);

		List<Map<String, Object>> list = file.parseInsertFileInfo(announcement, filerequest);
		int size = list.size();
		System.out.println("-----------------------size" + size);

		for (int i = 0; i < size; i++) {
			map.annInsertFile(list.get(i));

		}

	}

	@Override
	public void annInsertFile(Map<String, Object> map) {

	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> maps) throws Exception {
		return map.selectFileInfo(maps);
	}

	@Override
	public List<Map<String, Object>> selectFileList(int annNo) throws Exception {
		return map.selectFileList(annNo);
	}

	@Override
	public void fileUpdate(Map<String, Object> maps) {

	}
//
//	@Override
//	public void annUpdate(AnnouncementVO announcement) {
//		map.annUpdate(announcement);
//	}

	@Override
	public void annUpdate(AnnouncementVO announcement, String[] files, String[] fileNames,
			MultipartHttpServletRequest filerequest) throws Exception {

		map.annUpdate(announcement);
		
		List<Map<String, Object>> list = FileUtils.parseUpdateFileInfo(announcement, files, fileNames, filerequest);
		Map<String, Object> tempMap = null;
		int size = list.size();

		for (int i = 0; i < size; i++) {
			tempMap = list.get(i);
//			새로운 파일이면 insert 
//			N이면 update하는 문장
			if (tempMap.get("IS_NEW").equals("Y")) {
				map.annInsertFile(tempMap);
			} else if(tempMap.get("IS_NEW").equals("N")){
				map.fileUpdate(tempMap);
			}
		}
	
	}

	@Override
	public String fileDelete(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		
		return null;
	}
}
	
