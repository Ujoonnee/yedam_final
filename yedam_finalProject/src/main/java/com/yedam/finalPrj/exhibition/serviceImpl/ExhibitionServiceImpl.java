package com.yedam.finalPrj.exhibition.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.exhibition.service.Exhibition;
import com.yedam.finalPrj.exhibition.service.ExhibitionService;


@Service("ExhibitionService")
public class ExhibitionServiceImpl implements ExhibitionService {

	@Autowired ExhibitionMapper map;
	
	
	@Override
	public int findAll(Exhibition exhibition) {
		return map.findAll(exhibition);
	}
	
	
	@Override
	public Exhibition findOne(Exhibition exhibition) {
		return map.findOne(exhibition);
	}


	@Override
	public int insert(Exhibition exhibition) {
		return map.insert(exhibition);
	}

	@Override
	public int update(Exhibition exhibition) {
		return map.update(exhibition);
	}

	@Override
	public int delete(Exhibition exhibition) {
		return map.delete(exhibition);
	}









}
