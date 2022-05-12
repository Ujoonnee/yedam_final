package com.yedam.finalPrj.exhibition.service;





public interface ExhibitionService {
	int findAll(Exhibition exhibition);
	Exhibition findOne(Exhibition exhibition);
	int insert(Exhibition exhibition);
	int update(Exhibition exhibition);
	int delete(Exhibition exhibition);

}
