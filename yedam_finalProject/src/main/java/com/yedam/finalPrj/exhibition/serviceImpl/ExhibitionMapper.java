package com.yedam.finalPrj.exhibition.serviceImpl;

import java.util.List;

import com.yedam.finalPrj.exhibition.service.ExResMem;
import com.yedam.finalPrj.exhibition.service.Exhibition;

public interface ExhibitionMapper {
	List<Exhibition> exFindAll();
	
	Exhibition exFindOne(Exhibition exhibition);

	int exInsert(Exhibition exhibition);

	int exUpdate(Exhibition exhibition);
	
	int exDelete(Exhibition exhibition); 

	//예약 관련 
	List<ExResMem> exResFindAll();
	
	ExResMem exResFindOne(ExResMem exresmem);
	
	int exResUpdate(ExResMem exresmem);
	
	int exResAmtUpdate(ExResMem exresmem);
}
