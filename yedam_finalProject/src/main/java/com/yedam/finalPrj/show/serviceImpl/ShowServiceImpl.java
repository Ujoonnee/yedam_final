package com.yedam.finalPrj.show.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.show.Show;
import com.yedam.finalPrj.show.service.ShowService;

@Service
public class ShowServiceImpl implements ShowService {
	
	@Autowired
	ShowMapper map;
	
	@Override
	public List<Show> showFindAll() {
		// TODO Auto-generated method stub
		return map.showFindAll();
	}

	@Override
	public Show showFindOne(Show show) {
		// TODO Auto-generated method stub
		return map.showFindOne(show);
	}

	@Override
	public int showInsert(Show show) {
		// TODO Auto-generated method stub
		return map.showInsert(show);
	}

	@Override
	public int showUpdate(Show show) {
		// TODO Auto-generated method stub
		return map.showUpdate(show);
	}

	@Override
	public int showDelete(Show show) {
		// TODO Auto-generated method stub
		return map.showDelete(show);
	}

}
