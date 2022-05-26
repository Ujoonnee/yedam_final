package com.yedam.finalPrj.announcement.web;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.finalPrj.announcement.service.AnnouncementPageMaker;
import com.yedam.finalPrj.announcement.service.AnnouncementPagingCriteria;
import com.yedam.finalPrj.announcement.service.AnnouncementService;
import com.yedam.finalPrj.announcement.service.AnnouncementVO;
import com.yedam.finalPrj.common.FileVO;

@Controller
public class AnnouncementController {

	@Autowired
	private AnnouncementService service;
	
	
	// 공지사항 목록
	@RequestMapping("admin/announcement")
	public String adminFindAll(AnnouncementPagingCriteria cri,AnnouncementVO announcement,Model model) throws Exception {

		int total = service.totalCnt(cri);

		// 전체목록
		model.addAttribute("list", service.adminFindAll(cri));
		// 상단고정목록
		model.addAttribute("topList", service.getTopList());
		// 페이징
		model.addAttribute("paging", new AnnouncementPageMaker(cri, total));
		//파일업로드
		
		
		List<Map<String, Object>> fileList = service.selectFileList(announcement.getAnnNo());
		
		model.addAttribute("file", fileList);
		 
		return "admin/announcement/list";
	}
	
	// 공지사항 목록
		@RequestMapping("main/announcement")
		public String userFindAll(AnnouncementPagingCriteria cri,AnnouncementVO announcement,Model model) throws Exception {

			int total = service.totalCnt(cri);

			// 전체목록
			model.addAttribute("list", service.adminFindAll(cri));
			// 상단고정목록
			model.addAttribute("topList", service.getTopList());
			// 페이징
			model.addAttribute("paging", new AnnouncementPageMaker(cri, total));
			//파일업로드
			List<Map<String, Object>> fileList = service.selectFileList(announcement.getAnnNo());
			
			model.addAttribute("file", fileList);
			 
			return "main/announcement/list";
		}
	
	// 공지사항 등록
	
	  @RequestMapping(value = "admin/annInsert", method = RequestMethod.POST) 
	  public String anninsert(AnnouncementVO announcement, MultipartHttpServletRequest fileRequest) throws IOException {
		  System.out.println(fileRequest.getSession().getServletContext().getRealPath("/resources/announcement"));
		  service.annInsert(announcement,fileRequest);
		  
		  return "redirect:announcement";
	  }
	 
	
	// 공지사항 등록하는 페이지
	@RequestMapping("admin/insertPage")
	public String insertPage() {

		return "admin/announcement/insertPage";

	}

	// 공지사항 상세페이지(일반)
	@RequestMapping("main/annDetail")
	public String findOne(AnnouncementVO announcement, Model model,
			@ModelAttribute("cri") AnnouncementPagingCriteria cri) throws Exception {
		service.updateView(announcement);

		model.addAttribute("announcement", service.findOne(announcement));
		
		List<Map<String, Object>> fileList = service.selectFileList(announcement.getAnnNo());
			
		model.addAttribute("file", fileList);
		  
		return "main/announcement/annDetail";

	}


	// 공지사항 수정
	@RequestMapping("admin/annUpdate")
	public String annUpdate(AnnouncementVO announcement,
			@RequestParam(value="fileNoDel[]") String[] files,
			@RequestParam(value="fileNameDel[]") String[] fileNames,
			MultipartHttpServletRequest fileRequest,
			@ModelAttribute AnnouncementPagingCriteria cri, FileVO file) throws Exception {

		service.annUpdate(announcement, files, fileNames, fileRequest);
		
		return "redirect:announcement";
	}
	// 공지사항 다중 수정
	@RequestMapping("admin/statusUpdates")
	public String statusUpdates(String[] lists, String status) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("status", status);
		paramMap.put("list", lists);
		System.out.println("list------------------------------------------"+lists.length);
		System.out.println("status------------------------------------------"+status);
		service.statusUpdates(paramMap);
		
		return "redirect:announcement";
	}
//	상단고정 해제	
	@RequestMapping("admin/topStatus")
	public String topStatus(String[] lists, String status) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("status", "00501");
		paramMap.put("list", lists);
		service.statusUpdates(paramMap);
		
		return "redirect:announcement";
	}
	@RequestMapping("admin/fileUpdate")
	public void fileUpdate(FileVO file,HttpServletRequest fileRequest) {
		
		
		
		service.fileUpdate(file,fileRequest);
		
	}
	
//	상단삭제
	@RequestMapping("admin/statusDelete")
	public String statusDelete(String[] lists, String status) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("status", "00504");
		paramMap.put("list", lists);
		
		service.statusUpdates(paramMap);
		
		return "redirect:announcement";
	}
	
	// 공지사항 수정페이지이동
	@RequestMapping("admin/annDetail")
	public String annDetail(AnnouncementVO announcement, Model model) throws Exception {

		model.addAttribute("announcement", service.findOne(announcement));		

		
		List<Map<String, Object>> fileList = service.selectFileList(announcement.getAnnNo());
		model.addAttribute("file",fileList);
		
		
		return "admin/announcement/annDetail";
	}
	
	// 파일 다운로드
	@RequestMapping("main/fileDown")
	public void fileDown(@RequestParam Map<String, Object> maps, HttpServletResponse response,HttpServletRequest request) throws Exception {
		Map<String, Object> resultMap = service.selectFileInfo(maps);
		String replaceName = (String) resultMap.get("REPLACED_NAME");
		String originalFileName = (String) resultMap.get("ORIGINAL_NAME");
		System.out.println("-----------------------------------"+replaceName);
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\image\\"+replaceName));
		System.out.println("===================================================="+originalFileName);

		// 서버에서 다루는 확장자명이 어떤형식의 자료인지 알려주는거
		response.setContentType("application/octet-stream");
		// 파일 길이 설정.
		response.setContentLength(fileByte.length);
		// attachment : 로컬에 다운로드 & 저장 대부분의 브라우저에서는 바로 다운로드가 되거나, “Save As” 다이얼로그가 표시됨
		//다운로드 시 파일이름을 정해줄 수 있음.
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		
		// 파읽읽어 응답
		response.getOutputStream().write(fileByte);
		//버퍼에 저장되어있는 내용 클라이언트로 전송 후 버퍼 비움.
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	


		
}	
