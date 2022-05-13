package com.yedam.finalPrj.facilityBusiness.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.facilityBusiness.service.FacBusiness;
import com.yedam.finalPrj.facilityBusiness.service.FacbusinessService;

@Service("FacbusinessService")
public class FacBusinessServiceImpl implements FacbusinessService {

	@Autowired FacBusinessMapper mapper;
	
	@Override
	public List<FacBusiness> findList(FacBusiness vo) {
		return mapper.findList(vo);
	}

	@Override
	public List<FacBusiness> findAll() {
		return mapper.findAll();
	}

}
