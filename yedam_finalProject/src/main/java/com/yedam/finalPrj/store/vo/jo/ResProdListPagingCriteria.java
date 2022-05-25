package com.yedam.finalPrj.store.vo.jo;

import org.springframework.beans.factory.annotation.Autowired;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResProdListPagingCriteria {

		//페이징
		private int pageNum=1;	//페이지 번호
		private int amount=1;	//페이지당 데이터 갯수
		//검색
		private String type ="";
		private String keyword = "";


		@Autowired Store store;
		@Autowired Product product;
		private String storeName;
		private String prodName;
}
