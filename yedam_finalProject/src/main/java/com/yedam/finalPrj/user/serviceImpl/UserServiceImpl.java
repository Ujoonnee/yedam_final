package com.yedam.finalPrj.user.serviceImpl;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.yedam.finalPrj.user.service.UserService;
import com.yedam.finalPrj.user.service.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper map;
	
	@Override
	public UserVO findOne(UserVO vo) {
		// TODO Auto-generated method stub
		return map.findOne(vo);
	}

	@Override
	public UserVO findAll(UserVO vo) {
		// TODO Auto-generated method stub
		return map.findAll(vo);
	}

	@Override
	public int insert(UserVO vo) {
		// TODO Auto-generated method stub
		return map.insert(vo);
	}

	@Override
	public int update(UserVO vo) {
		// TODO Auto-generated method stub
		return map.update(vo);
	}

	@Override
	public int delete(UserVO vo) {
		// TODO Auto-generated method stub
		return map.delete(vo);
	}

	@Override
	public boolean idCheck(String str) {
		// TODO Auto-generated method stub
		return false;
	}

}
