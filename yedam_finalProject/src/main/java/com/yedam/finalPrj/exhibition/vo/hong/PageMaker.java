package com.yedam.finalPrj.exhibition.vo.hong;

import lombok.Data;

@Data
public class PageMaker {
	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private PagingVO vo;
	
	public PageMaker(PagingVO vo, int total) {
		this.vo = vo;
		int realEnd = (int)(Math.ceil((total * 1.0) / vo.getAmount()));
		this.endPage = (int)(Math.ceil(vo.getPageNum() / 10.0) * 10);
		this.startPage = getEndPage()-9;
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.next = getEndPage() < realEnd;
		this.prev = getStartPage() > 1;
	}
}
