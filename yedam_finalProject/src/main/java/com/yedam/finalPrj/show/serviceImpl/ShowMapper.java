package com.yedam.finalPrj.show.serviceImpl;

import java.util.List;

import com.yedam.finalPrj.show.Show;

public interface ShowMapper {
	List<Show> showFindAll();
	Show showFindOne(Show show);
	int showInsert(Show show);
	int showUpdate(Show show);
	int showDelete(Show show);
}
