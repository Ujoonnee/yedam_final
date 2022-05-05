package com.yedam.finalPrj.enterContent.serviceImpl;

import java.util.List;

import com.yedam.finalPrj.enterContent.service.EnterContent;

public interface EnterContentMapper {
	
	public List<EnterContent> selectAll(String registNum);
	public List<EnterContent> selectsAll();
	int insert(EnterContent vo);
}
