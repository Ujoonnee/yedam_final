<<<<<<< HEAD
package com.yedam.finalPrj.store.vo.jo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReservedProductsListPageMaker {
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private ReservedProductsListPagingCriteria cri;
	
	public ReservedProductsListPageMaker(ReservedProductsListPagingCriteria cri, int total) {
		this.cri=cri;
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		this.endPage = (int) (Math.ceil(cri.getPageNum()/ 10.0)*10);
		this.startPage = getEndPage()-9;
		
		if(realEnd < this.endPage) {
			this.endPage=realEnd;
		}
		this.next = getEndPage() < realEnd;
		this.prev = getStartPage() > 1;
	}
}
=======
package com.yedam.finalPrj.store.vo.jo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReservedProductsListPageMaker {
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private ReservedProductsListPagingCriteria cri;
	
	public ReservedProductsListPageMaker(ReservedProductsListPagingCriteria cri, int total) {
		this.cri=cri;
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		this.endPage = (int) (Math.ceil(cri.getPageNum()/ 10.0)*10);
		this.startPage = getEndPage()-9;
		
		if(realEnd < this.endPage) {
			this.endPage=realEnd;
		}
		this.next = getEndPage() < realEnd;
		this.prev = getStartPage() > 1;
	}
}
>>>>>>> branch 'JO' of https://github.com/Ujoonnee/yedam_final.git
