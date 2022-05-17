package com.yedam.finalPrj.announcement.serviceImpl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.finalPrj.announcement.service.Announcement;
import com.yedam.finalPrj.announcement.service.AnnouncementPagingCriteria;
import com.yedam.finalPrj.announcement.service.AnnouncementService;
import com.yedam.finalPrj.common.FileUtils;

@Service

public class AnnouncementServiceImpl implements AnnouncementService {

	@Autowired
	AnnouncementMapper map;

	@Autowired
	FileUtils file;

	@Override
	public List<Announcement> findAll(AnnouncementPagingCriteria paging) {
		return map.findAll(paging);
	}

	@Override
	public List<Announcement> getTopList() {
		return map.getTopList();
	}

	@Override
	public Announcement findOne(Announcement announcement) {
		return map.findOne(announcement);
	}

	@Override
	public int totalCnt(AnnouncementPagingCriteria cri) {
		return map.totalCnt(cri);
	}

	@Override
	public int updateView(Announcement ann) {
		return map.updateView(ann);
	}

	/*
	 * @Override public Announcement annInsert(Announcement announcement) {
	 * 
	 * return map.annInsert(announcement); }
	 */

	@Override
	public Announcement annInsert(Announcement announcement, MultipartHttpServletRequest filerequest)
			throws IllegalStateException, IOException {

		List<Map<String, Object>> list = file.parseInsertFileInfo(announcement, filerequest);

		int size = list.size();

		for (int i = 0; i < size; i++) {
			map.annInsertFile(list.get(i));
		}
		
		return map.annInsert(announcement, filerequest);
	}

	@Override
	public void annInsertFile(Map<String, Object> map) {

	}

}
