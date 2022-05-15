package com.yedam.finalPrj.show.service;

import java.util.List;

import com.yedam.finalPrj.show.Show;

public interface ShowService {
	List<Show> findAll();
	Show findOne(Show show);
	int insert(Show show);
	int update(Show show);
	int delete(Show show);
}
