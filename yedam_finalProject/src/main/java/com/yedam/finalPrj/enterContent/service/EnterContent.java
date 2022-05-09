package com.yedam.finalPrj.enterContent.service;

import java.sql.Date;

import lombok.Data;

@Data
public class EnterContent {
	private String service_serial_num;
	private String registration_number; //사업자등록번호?
	private String service_type;
	private String service_name;
	private String service_description;
	private String service_thumbnail;
	private String service_address;
	private String service_location;
	private String service_tel;
	private int service_capacity;
	private String service_approval;
	private String service_status;
	private Date service_start_time;
	private Date service_end_time;

}
