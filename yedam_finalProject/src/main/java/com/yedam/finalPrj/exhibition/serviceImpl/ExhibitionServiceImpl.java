package com.yedam.finalPrj.exhibition.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.exhibition.service.Exhibition;
import com.yedam.finalPrj.exhibition.service.ExhibitionService;

@Service("ExhibitionService")
public class ExhibitionServiceImpl implements ExhibitionService {

	@Autowired
	ExhibitionMapper map;

	@Override
	public List<Exhibition> exFindAll() {

		return map.exFindAll();
	}

	@Override
	public Exhibition exFindOne(Exhibition exhibition) {
		return map.exFindOne(exhibition);
	}

	@Override
	public int exInsert(Exhibition exhibition) {
		return map.exInsert(exhibition);
	}

	@Override
	public int exUpdate(Exhibition exhibition) {
		return map.exUpdate(exhibition);
	}

	@Override
	public int exDelete(Exhibition exhibition) {
		return map.exDelete(exhibition);
	}


}