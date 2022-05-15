package com.yedam.finalPrj.exhibition.service;

import java.util.List;

public interface ExhibitionService {
	List<Exhibition> exFindAll();
	Exhibition exFindOne(Exhibition exhibition);
	int exInsert(Exhibition exhibition);
	int exUpdate(Exhibition exhibition);
	int exDelete(Exhibition exhibition);
	
	//join 결과물 담아놓은 List
	//예약
	List<ExResMem> resFindAll();
	ExResMem exResFindOne(ExResMem exresmem);
	int exResUpdate(ExResMem exresmem);
	int exResAmtUpdate(ExResMem exresmem);
}
