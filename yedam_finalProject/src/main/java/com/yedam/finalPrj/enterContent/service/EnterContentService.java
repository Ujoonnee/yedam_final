package com.yedam.finalPrj.enterContent.service;

import java.util.List;

public interface EnterContentService {
	public List<EnterContent> selectsAll();
	public List<EnterContent> selectAll(String registNum);
	public int insert(EnterContent vo);
}
