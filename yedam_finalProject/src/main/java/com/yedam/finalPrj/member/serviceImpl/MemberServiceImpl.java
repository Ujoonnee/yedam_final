package com.yedam.finalPrj.member.serviceImpl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.member.service.Member;
import com.yedam.finalPrj.member.service.MemberService;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper map;
	
	@Override
	public Member findOne(Member vo) {
		// TODO Auto-generated method stub
		return map.findOne(vo);
	}

	@Override
	public Member findAll(Member vo) {
		// TODO Auto-generated method stub
		return map.findAll(vo);
	}

	@Override
	public int insert(Member vo) {
		// TODO Auto-generated method stub
		return map.insert(vo);
	}

	@Override
	public int update(Member vo) {
		// TODO Auto-generated method stub
		return map.update(vo);
	}

	@Override
	public int delete(Member vo) {
		// TODO Auto-generated method stub
		return map.delete(vo);
	}

	@Override
	public boolean idCheck(String str) {
		// TODO Auto-generated method stub
		return false;
	}

}
