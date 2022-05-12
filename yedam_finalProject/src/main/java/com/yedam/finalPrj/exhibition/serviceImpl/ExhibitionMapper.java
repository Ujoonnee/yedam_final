package com.yedam.finalPrj.exhibition.serviceImpl;


import com.yedam.finalPrj.exhibition.service.Exhibition;

public interface ExhibitionMapper {
	int findAll(Exhibition exhibition);
	Exhibition findOne(Exhibition exhibition);
	int insert(Exhibition exhibition);
	int update(Exhibition exhibition);
	int delete(Exhibition exhibition);
	
}
