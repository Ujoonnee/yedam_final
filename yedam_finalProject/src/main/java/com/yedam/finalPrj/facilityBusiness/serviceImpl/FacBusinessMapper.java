package com.yedam.finalPrj.facilityBusiness.serviceImpl;

import java.util.List;

import com.yedam.finalPrj.facilityBusiness.service.FacBusiness;

public interface FacBusinessMapper {
	public List<FacBusiness> findList(FacBusiness vo);
	public List<FacBusiness> findAll();
}
