package com.yedam.finalPrj.show.serviceImpl;

import java.util.List;

import com.yedam.finalPrj.show.Show;

public interface ShowMapper {
	List<Show> findAll();
	Show findOne(Show show);
	int insert(Show show);
	int update(Show show);
	int delete(Show show);
}
