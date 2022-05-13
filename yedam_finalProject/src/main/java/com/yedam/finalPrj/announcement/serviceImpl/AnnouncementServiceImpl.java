package com.yedam.finalPrj.announcement.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.announcement.service.Announcement;
import com.yedam.finalPrj.announcement.service.AnnouncementPagingCriteria;
import com.yedam.finalPrj.announcement.service.AnnouncementService;

@Service("AnnouncementService")
public class AnnouncementServiceImpl implements AnnouncementService {

	@Autowired AnnouncementMapper map;
	
	@Override
	public List<Announcement> findAll(AnnouncementPagingCriteria paging) {
		return map.findAll(paging);
	}
	
	@Override
	public Announcement findOne(Announcement announcement) {
		return map.findOne(announcement);
	}


	@Override
	public int insert(Announcement announcement) {
		return map.insert(announcement);
	}

	@Override
	public int update(Announcement announcement) {
		return map.update(announcement);
	}

	@Override
	public int delete(Announcement announcement) {
		return map.delete(announcement);
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
