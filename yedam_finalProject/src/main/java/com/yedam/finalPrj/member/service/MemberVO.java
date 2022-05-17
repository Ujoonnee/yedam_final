package com.yedam.finalPrj.member.service;

import lombok.Data;

@Data
public class MemberVO {
   
   private int memNo;
   private String email;
   private String name;
   private String password;
   private String address;
   private String addressDetail;
   private String tel;
   private String memType;
   private String buisnessNum;
   private String buisnessType;
   private String status;
   
   
}