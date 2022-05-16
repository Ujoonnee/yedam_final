package com.yedam.finalPrj.facilityBusiness.web;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
		
		return "fac_business/detail";
	}
	
	@RequestMapping("/register")
	public String register() {

		return "facBusiness/register";
	}
	
	@RequestMapping("/regDetail")
	public String regDetail(Facility vo, Model model) {
		//DB에 등록하기.
		mapper.insert(vo);
		
		model.addAttribute("reg", vo);
		
		return "fac_business/regDetail";
	}
	
	@RequestMapping("/regDetailUpdate")
	public String regDetailUpdate(Facility vo, Model model) {
		
		//DB에 수정저장.
		//시설정보수정
		mapper.update(vo);
		return "fac_business/regDetail";
	}
	
	//////////////////////////////////////////////////////////////////////////////////////
	//다시 확인....
	@RequestMapping(value = "regDetail2")
    public String requestupload1(MultipartHttpServletRequest mRequest) {
        String src = mRequest.getParameter("src");
        MultipartFile mf = mRequest.getFile("file");

        String path = "C:\\image\\";

        String originFileName = mf.getOriginalFilename(); // 원본 파일 명
        long fileSize = mf.getSize(); // 파일 사이즈

        System.out.println("originFileName : " + originFileName);
        System.out.println("fileSize : " + fileSize);

        String safeFile = path + originFileName;

        try {
            mf.transferTo(new File(safeFile));
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "redirect:/";
    }
	
	
}
