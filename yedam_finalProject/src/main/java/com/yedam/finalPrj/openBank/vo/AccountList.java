package com.yedam.finalPrj.openBank.vo;

import java.util.List;

import lombok.Data;

@Data
public class AccountList {
	String user_name;
	String res_cnt;
	List<AccountVO> res_list;
}
