package com.yedam.finalPrj.review.service;

import org.springframework.web.multipart.MultipartFile;
import lombok.Data;

@Data
public class SmarteditorVO {
	private MultipartFile filedata;
	private String callback;
	private String callback_func;
}
