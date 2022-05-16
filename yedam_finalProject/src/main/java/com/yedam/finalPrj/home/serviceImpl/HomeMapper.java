package com.yedam.finalPrj.home.serviceImpl;

import java.util.List;

import com.yedam.finalPrj.exhibition.service.Exhibition;

public interface HomeMapper {
	
	List<Exhibition> getExhibitionRecommendation();
}
