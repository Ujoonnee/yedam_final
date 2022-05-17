package com.yedam.finalPrj.facilityBusiness.web;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.yedam.finalPrj.facility.service.Facility;
import com.yedam.finalPrj.facilityBusiness.serviceImpl.FacBusinessMapper;

@Controller //컨트롤러 빈으로 등록
@RequestMapping("/fac_business/*")
public class FacBusinessController {
	
	@Autowired
	FacBusinessMapper mapper ;

	//controller일때는 (WebINf/views)-> 폴더/jsp
	//restController일때는 동일url에 리턴값 그대로 출력.
	@RequestMapping("/resList")
	public String resList(Model model) {
		//예약테이블
		model.addAttribute("resList", mapper.findAll2());
		
		return "facBusiness/resList";
	}
	
	@RequestMapping("/detail/{resNo}")
	public String detail(@PathVariable int resNo, Model model) {

		model.addAttribute("resDetail", mapper.findDetail(resNo));
		model.addAttribute("resMem", mapper.findNameTel(resNo));
		model.addAttribute("facName", mapper.FindFacName(resNo)); 
		
		return "facBusiness/detail";
	}
	
	//등록페이지
	@GetMapping("/register")
	public String register() {

		return "facBusiness/register";
	}
	
	//등록처리
	@PostMapping("/register")
	public String regDetail(Facility vo, Model model, MultipartFile singleFile, HttpServletRequest request) {
	
		// 2. 저장할 경로 가져오기
		String path = request.getSession().getServletContext().getRealPath("resources");
		System.out.println("path : " + path);
		String root = path + "\\uploadfile" ;
		
		File file = new File(root);
		
		// 만약 uploadFiles 폴더가 없으면 생성해라 라는뜻
		if(!file.exists()) file.mkdirs();
		
		// 업로드할 폴더 설정
		String originFileName = singleFile.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String ranFileName = UUID.randomUUID().toString() + ext;
		
		File changeFile = new File(root + "\\" + ranFileName);
		
		// 파일업로드
		try {
			singleFile.transferTo(changeFile);
			vo.setThumbnail(ranFileName);
			System.out.println("파일 업로드 성공");
		} catch (IllegalStateException | IOException e) {
			System.out.println("파일 업로드 실패");
			e.printStackTrace();
		}
		
		//DB에 등록하기.
		mapper.insert(vo);
		
		model.addAttribute("reg", vo);
		
		return "facBusiness/regDetail";
	}
	
	@RequestMapping("/regDetailUpdate")
	public String regDetailUpdate(Facility vo, Model model) {
		
		//DB에 수정저장.
		//시설정보수정
		mapper.update(vo);
		return "facBusiness/regDetail";
	}
	
	
	
}
