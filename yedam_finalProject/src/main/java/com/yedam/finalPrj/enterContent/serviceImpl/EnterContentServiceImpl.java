package com.yedam.finalPrj.enterContent.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.enterContent.service.EnterContent;
import com.yedam.finalPrj.enterContent.service.EnterContentService;

@Service("EnterContentService")
public class EnterContentServiceImpl implements EnterContentService{

	@Autowired EnterContentMapper map;
	
	@Override
	public List<EnterContent> selectAll(String registNum) {
		// TODO Auto-generated method stub
		return map.selectAll(registNum);
	}

	@Override
	public int insert(EnterContent vo) {
		// TODO Auto-generated method stub
		return map.insert(vo);
	}

	public List<EnterContent>  selectsAll() {
		// TODO Auto-generated method stub
		return map.selectsAll();
	}

}
