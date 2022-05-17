package com.yedam.finalPrj.announcement.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.announcement.service.Announcement;
import com.yedam.finalPrj.announcement.service.AnnouncementPagingCriteria;
import com.yedam.finalPrj.announcement.service.AnnouncementService;

@Service
public class AnnouncementServiceImpl implements AnnouncementService {

	@Autowired AnnouncementMapper map;
	
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

	

	




}
