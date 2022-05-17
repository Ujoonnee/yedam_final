package com.yedam.finalPrj.common;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.finalPrj.announcement.service.Announcement;

@Component("fileUtils")
public class FileUtils {
	//	파일경로 지정
	private static final String filePath = "C:\\image";
	
	//
	
	public List<Map<String, Object>> parseInsertFileInfo(Announcement announcement ,MultipartHttpServletRequest fileRequest) throws IllegalStateException, IOException{
		//선언해준 맵을 돌려서 원하는 파일 가져올 수 있게 해주는것 Iterator
		Iterator<String> iterator = fileRequest.getFileNames();
//		인터페이스는 업로드 한 파일 및 파일 데이터를 표현하기 위한 용도
		MultipartFile multipartFile = null;
		//원본 파일명
		String originalFileName = null; 
		//확장자 명
		String originalFileExtenstion =null;
		//업로드시 화면에 나오는 명칭
		String storedFileName = null; 
		
		// 파일리스트
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		Map<String, Object> listMap = null;
				
		int annNo = announcement.getAnnNo();
		
		File file = new File(filePath);
//		폴더가 없을 시 폴더 만들어주는거
		if(file.exists() == false) {
//			상위 디렉토리없으면 상위디렉토리까지 생성해줌. C:\base\want > base까지 만들어줌.mkdirs
			file.mkdirs();
		}
//		hasNext > 파일 불리언 타입으로 true false로 반환해줌.
//		next는 아무타입이나 다됨.
//		
		while(iterator.hasNext()) {
			multipartFile = fileRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				
				originalFileName = multipartFile.getOriginalFilename();
				
				originalFileExtenstion = originalFileName.substring(originalFileName.lastIndexOf("."));
				//화면 출력 되는 파일명 32개문자 랜덤으로 만들어서 반환해주는 메서드
				storedFileName = getRandomString() + originalFileExtenstion;
				// 파일 경로와 화면에 출력되는 파일명 
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				//정보 담겨진 정보를 put  annNo, 파일명, 화면에 출력되는 인코딩된 파일명, 파일 크기
				
				
				// vo가 카멜로 만들어져 있는데 페이지상으로는 스네이크로 되있어서 오류나면 1순위 확인해볼 것
				
				listMap = new HashMap<String, Object>();
				listMap.put("ann_No", annNo);
				listMap.put("ORIGINAL_FILE_NAME", originalFileName);
				listMap.put("STORED_FILE_NAME", storedFileName);
				listMap.put("STORED_FILE_NAME", file);
				listMap.put("FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}
		}
			
		return list;
		
	}
	
	// 32글자의 랜덤한 문자열을 만들어서 반환해주는 기능 
	// 파일명 변환 때문에 만들어져 있음.
	public static String getRandomString() {
		
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	//
}