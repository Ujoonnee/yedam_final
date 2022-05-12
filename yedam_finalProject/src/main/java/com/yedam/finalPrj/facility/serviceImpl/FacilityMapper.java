package com.yedam.finalPrj.facility.serviceImpl;

import java.util.List;

import com.yedam.finalPrj.facility.vo.Facility;


public interface FacilityMapper {
	public List<Facility> findAll();
	public List<Facility> findEvery(String fac_no);
}
