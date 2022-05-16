package com.yedam.finalPrj.home.serviceImpl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.home.service.HomeService;

@Service("homeService")
public class HomeServiceImpl implements HomeService {
	
	@Autowired HomeMapper map;
	
	@Override
	public Map<String, Object> getRecommendation() {
		Map<String, Object> result = new HashMap<>();
		
//		result.put("showList", map.getShowRecommendation());
		result.put("exhibitionList", map.getExhibitionRecommendation());
//		result.put("facilityList", map.getFacilityRecommendation());
		
		
		return result; 
	}
}
