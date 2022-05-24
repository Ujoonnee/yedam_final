package com.yedam.finalPrj.common;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FileVO {
	int fileNo;
	int annNo;
	String originalName;
	String replacedName;
	int fileSize;
	String status;
	String isNew;
}
