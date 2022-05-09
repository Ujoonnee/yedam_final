package com.yedam.finalPrj.user.serviceImpl;

import com.yedam.finalPrj.user.service.UserVO;

public interface UserMapper {
	UserVO findOne(UserVO vo);   // 단건 조회
	UserVO findAll(UserVO vo);      // ID조회
	int insert(UserVO vo);       // 등록
	int update(UserVO vo);       // 수정
	int delete(UserVO vo);       // 삭제
	
	boolean idCheck(String str); // id중복체크
}
