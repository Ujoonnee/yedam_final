package com.yedam.finalPrj.facilityBusiness.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.facility.service.Facility;
import com.yedam.finalPrj.facilityBusiness.service.FacBusinessService;
import com.yedam.finalPrj.facilityBusiness.service.FacReservation;
import com.yedam.finalPrj.member.service.Member;

@Service("FacBusinessService")
public class FacBusinessServiceImpl implements FacBusinessService {

	@Autowired FacBusinessMapper mapper;
	

	@Override
	public List<FacReservation> findAll() {
		return mapper.findAll();
	}

	@Override
	public Member findNameTel(int resNo) {
		return mapper.findNameTel(resNo);
	}

	@Override
	public String FindFacName(int facResNo) {
		// TODO Auto-generated method stub
		return mapper.FindFacName(facResNo);
	}

	@Override
	public FacReservation findDetail(int resNo) {
		return mapper.findDetail(resNo);
	}

	@Override
	public void insert(Facility vo) {
	}

	@Override
	public void update(Facility vo) {
	}

	@Override
	public List<FacReservation> findMyResList(int memNo) {
		return mapper.findMyResList(memNo);
	}

	@Override
	public List<FacReservation> findAll2() {
		return mapper.findAll2();
	}

	

}
