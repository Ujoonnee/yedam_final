package com.yedam.finalPrj.announcement.service;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class AnnouncementPagingCriteria {
	//페이징
	private int pageNum=1;	//페이지 번호
	private int amount=10;	//페이지당 데이터 갯수
	


}
