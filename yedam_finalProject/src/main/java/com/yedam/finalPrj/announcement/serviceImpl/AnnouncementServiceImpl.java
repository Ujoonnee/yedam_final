package com.yedam.finalPrj.announcement.serviceImpl;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.finalPrj.announcement.service.AnnouncementPagingCriteria;
import com.yedam.finalPrj.announcement.service.AnnouncementService;
import com.yedam.finalPrj.announcement.service.AnnouncementVO;
import com.yedam.finalPrj.common.FileUtils;
import com.yedam.finalPrj.common.FileVO;

@Service("AnnouncementServiceImpl")
public class AnnouncementServiceImpl implements AnnouncementService {

	@Autowired
	AnnouncementMapper map;
	
	@Autowired
	FileUtils file;

	private Object replacedName;
	
	@Override
	public List<AnnouncementVO> adminFindAll(AnnouncementPagingCriteria paging) {
		return map.adminFindAll(paging);
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
	public void fileUpdate(FileVO file, HttpServletRequest fileRequest) {
		}


	@Override
	public void annUpdate(AnnouncementVO announcement, String[] files, String[] fileNames,
			MultipartHttpServletRequest filerequest) throws Exception {
		String filePath = "C:\\image\\";
//		System.out.println("-----------------"+replacedName.toString());
		
		map.annUpdate(announcement);
		
		List<Map<String, Object>> lists = FileUtils.parseUpdateFileInfo(announcement, files, fileNames, filerequest);
		Map<String, Object> tempMap = null;
		int size = lists.size();
		for (int i = 0; i < size; i++) {
			tempMap = lists.get(i);
//			새로운 파일이면 insert 
//			N이면 update하는 문장
		
			if (tempMap.get("IS_NEW").equals("Y")) {
				map.annInsertFile(tempMap);
			} else {
				 
				replacedName = map.selectFileInfo(tempMap).get("REPLACED_NAME");
				 
				System.out.println("---------------------------------file");
				File file = new File(filePath + replacedName);
			
				if(file.exists()) {
					file.delete();
				}
				map.fileUpdate(tempMap);
				
			}
		}
	}

	
	@Override
	public int statusUpdates(Map<String, Object> maps) {
			
		return map.statusUpdates(maps);
	}

	@Override
	public List<AnnouncementVO> annFindAll(Map<String, Object> map) {
		return null;
	}

	@Override
	public List<AnnouncementVO> userFindAll(AnnouncementPagingCriteria paging) {
		return map.userFindAll(paging);
	}

	@Override
	public int statusDelete(Map<String, Object> maps) {
		return map.statusDelete(maps);
	}

	@Override
	public int topStatus(Map<String, Object> maps) {
		return map.topStatus(maps);
	}
	
	// zip파일인데 먼저 css 끝내고 할것 
	/*
	 * @Override public List<String> selectZipFileInfo(List<String> list) { // TODO
	 * Auto-generated method stub return map.selectZipFileInfo(list); }
	 */

	/*
	 * @Override public List<FileVO> selectZipFileInfo(Map<String, Object> map) { //
	 * TODO Auto-generated method stub return map.se; }
	 */
	
}