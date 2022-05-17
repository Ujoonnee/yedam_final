package com.yedam.finalPrj.facility.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.facility.service.Facility;
import com.yedam.finalPrj.facility.service.FacilityService;

@Service("FacilityService")
public class FacilityServiceImpl implements FacilityService {

	@Autowired FacilityMapper map;
	
	@Override
	public List<Facility> findAll() {
		return map.findAll();
	}

	@Override
	public List<Facility> findEvery(String fac_no) {
		return map.findEvery(fac_no);
	}

	@Override
	public List<Facility> listSearch(Facility vo) {
		
		return map.listSearch(vo);
	}

}
