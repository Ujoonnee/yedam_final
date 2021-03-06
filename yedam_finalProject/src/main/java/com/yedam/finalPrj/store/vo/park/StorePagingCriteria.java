package com.yedam.finalPrj.store.vo.park;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StorePagingCriteria {

		//페이징
		private int pageNum=1;	//페이지 번호
		private int amount=10;	//페이지당 데이터 갯수
		//검색
		private String type ="";
		private String keyword = "";
		//위도,경도
		private String latitude;
		private String longitude;
		private String nowLocation = "";
		
		private String approvalType; 
		private String applicationDate; 
		private String approvalStatus; 
		
		
		
}
