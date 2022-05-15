package com.yedam.finalPrj.show.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.yedam.finalPrj.show.Show;
import com.yedam.finalPrj.show.service.ShowService;

public class ShowServiceImpl implements ShowService {
	
	@Autowired
	ShowMapper map;
	
	
	@Override
	public List<Show> findAll() {
		// TODO Auto-generated method stub
		return map.findAll();
	}

	@Override
	public Show findOne(Show show) {
		// TODO Auto-generated method stub
		return map.findOne(show);
	}

	@Override
	public int insert(Show show) {
		// TODO Auto-generated method stub
		return map.insert(show);
	}

	@Override
	public int update(Show show) {
		// TODO Auto-generated method stub
		return map.update(show);
	}

	@Override
	public int delete(Show show) {
		// TODO Auto-generated method stub
		return map.delete(show);
	}

}
