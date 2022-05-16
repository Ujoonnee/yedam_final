package com.yedam.finalPrj.facility.service;

import java.util.List;

public interface FacilityService {

	public List<Facility> findAll();
	public List<Facility> findEvery(String fac_no);
	public List<Facility> listSearch(Facility vo);
}
