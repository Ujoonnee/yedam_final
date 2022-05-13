package com.yedam.finalPrj.exhibition.service;

import java.util.List;

public interface ExhibitionService {
	List<Exhibition> exFindAll();
	Exhibition exFindOne(Exhibition exhibition);
	int exInsert(Exhibition exhibition);
	int exUpdate(Exhibition exhibition);
	int exDelete(Exhibition exhibition);

}
