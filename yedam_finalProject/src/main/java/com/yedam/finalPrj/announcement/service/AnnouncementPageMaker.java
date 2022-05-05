package com.yedam.finalPrj.announcement.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AnnouncementPageMaker {
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private AnnouncementPagingCriteria cri;
	
	public AnnouncementPageMaker(AnnouncementPagingCriteria cri, int total) {
		this.cri=cri;
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage=realEnd;
		}
		this.next = getEndPage() < realEnd;
		this.prev = getStartPage() > 1;
	}
}
