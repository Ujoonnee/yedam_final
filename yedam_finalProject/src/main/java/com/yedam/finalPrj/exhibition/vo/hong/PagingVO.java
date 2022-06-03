package com.yedam.finalPrj.exhibition.vo.hong;

import lombok.Data;

@Data
public class PagingVO {
	
	private int pageNum=1;  // 페이지번호
	private int amount=5;  // 페이지당 데이터 갯수
	
	private String type;
	private String keyword;
	
	
	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split("");
	}
}
