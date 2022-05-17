package com.yedam.finalPrj.member.service;

import lombok.Data;

@Data
public class MemberEmail {
	
	private String subject;
	private String content;
	private String receiver;
}
