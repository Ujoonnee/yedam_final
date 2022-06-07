package com.yedam.finalPrj.announcement.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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

// 윤성환
@Controller
@RequestMapping("announcement/*")
public class AnnouncementController {

	@Autowired
	private AnnouncementService service;

	// 공지사항 목록(관리자)
	@RequestMapping("adminList")
	public String adminFindAll(AnnouncementPagingCriteria cri, AnnouncementVO announcement, Model model)
			throws Exception {

		int total = service.totalCnt(cri);

		// 전체목록
		model.addAttribute("list", service.adminFindAll(cri));
		// 상단고정목록
		model.addAttribute("topList", service.getTopList());
		// 페이징
		model.addAttribute("paging", new AnnouncementPageMaker(cri, total));
		// 파일업로드
//		List<Map<String, Object>> fileList = service.selectFileList(announcement.getAnnNo());

//		model.addAttribute("file", fileList);

		return "admin/announcement/list";
	}

	// 공지사항 목록(이용자)
		@RequestMapping("list")
		public String userFindAll(AnnouncementPagingCriteria cri,AnnouncementVO announcement,Model model) throws Exception {

		int total = service.totalCnt(cri);

		// 전체목록
		model.addAttribute("list", service.adminFindAll(cri));
		// 상단고정목록
		model.addAttribute("topList", service.getTopList());
		// 페이징
		model.addAttribute("paging", new AnnouncementPageMaker(cri, total));
		// 파일업로드
//			List<Map<String, Object>> fileList = service.selectFileList(announcement.getAnnNo());

//			model.addAttribute("file", fileList);

		return "main/announcement/list";
	}

	// 공지사항 등록

	@RequestMapping(value = "annInsert", method = RequestMethod.POST)
	public String anninsert(AnnouncementVO announcement, MultipartHttpServletRequest fileRequest) throws IOException {
		System.out.println(fileRequest.getSession().getServletContext().getRealPath("/resources/announcement"));
		service.annInsert(announcement, fileRequest);

		return "redirect:adminList";
	}

	// 공지사항 등록하는 페이지
	@RequestMapping("insertPage")
	public String insertPage() {

		return "admin/announcement/insertPage";

	}

	// 공지사항 상세페이지(일반)
	@RequestMapping("mainAnnDetail")
	public String findOne(AnnouncementVO announcement, Model model,
			@ModelAttribute("cri") AnnouncementPagingCriteria cri) throws Exception {

		AnnouncementVO rannouncement = service.findOne(announcement);
		String con = rannouncement.getAnnContent().replace("\r\n", "<br>");
		rannouncement.setAnnContent(con);
		model.addAttribute("announcement", rannouncement);

		service.updateView(rannouncement);
		List<Map<String, Object>> fileList = service.selectFileList(announcement.getAnnNo());

		model.addAttribute("file", fileList);

		return "main/announcement/annDetail";

	}

	// 공지사항 수정페이지이동
	@RequestMapping("annDetail")
	public String annDetail(AnnouncementVO announcement, Model model) throws Exception {

		model.addAttribute("announcement", service.findOne(announcement));

		service.updateView(announcement);

		List<Map<String, Object>> fileList = service.selectFileList(announcement.getAnnNo());
		model.addAttribute("file", fileList);

		return "admin/announcement/annDetail";
	}

	// 공지사항 수정
	@RequestMapping("annUpdate")
	public String annUpdate(AnnouncementVO announcement, @RequestParam(value = "fileNoDel[]") String[] files,
			@RequestParam(value = "fileNameDel[]") String[] fileNames, MultipartHttpServletRequest fileRequest,
			@ModelAttribute AnnouncementPagingCriteria cri, FileVO file) throws Exception {
		service.annUpdate(announcement, files, fileNames, fileRequest);

		return "redirect:adminList?pageNum=" + cri.getPageNum();
	}

	// 공지사항 다중 수정
	@RequestMapping("statusUpdates")
	public String statusUpdates(String[] lists, String status) throws Exception {

		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("status", status);
		paramMap.put("list", lists);
		System.out.println("list------------------------------------------" + lists.length);
		System.out.println("status------------------------------------------" + status);
		service.statusUpdates(paramMap);
		return "redirect:adminList";
	}

//	상단고정 해제	
	@RequestMapping("topStatus")
	public String topStatus(String[] lists, String status) throws Exception {

		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("status", "00501");
		paramMap.put("list", lists);
		service.statusUpdates(paramMap);

		return "redirect:adminList";
	}

//  파일 업데이트
	@RequestMapping("fileUpdate")
	public void fileUpdate(FileVO file, HttpServletRequest fileRequest) {

		service.fileUpdate(file, fileRequest);
	}

//	삭제
	@RequestMapping("statusDelete")
	public String statusDelete(String[] lists, String status) throws Exception {

		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("status", "00504");
		paramMap.put("list", lists);

		service.statusUpdates(paramMap);

		return "redirect:adminList";
	}

	// 파일 다운로드
	@RequestMapping("fileDown")
	public void fileDown(@RequestParam Map<String, Object> maps, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		String filePath="C:\\announcement\\";
		Map<String, Object> resultMap = service.selectFileInfo(maps);
		String replaceName = (String) resultMap.get("REPLACED_NAME");
		String originalFileName = (String) resultMap.get("ORIGINAL_NAME");
		System.out.println("-----------------------------------" + replaceName);
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\announcement\\" + replaceName));
		System.out.println("====================================================" + originalFileName);

		
		 
		System.out.println("---------------------------------file");
		File file = new File(filePath + replaceName);
			// attachment : 로컬에 다운로드 & 저장 대부분의 브라우저에서는 바로 다운로드가 되거나, “Save As” 다이얼로그가 표시됨
			// 다운로드 시 파일이름을 정해줄 수 있음.
			try {
				response.setHeader("Content-Disposition",
						"attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8") + "\";");
				// 서버에서 다루는 확장자명이 어떤형식의 자료인지 알려주는거
				// 이부분이
				response.setContentType("application/octet-stream");
				// 파일 길이 설정.
				response.setContentLength(fileByte.length);

				// 파읽읽어 응답
				response.getOutputStream().write(fileByte);
				// 버퍼에 저장되어있는 내용 클라이언트로 전송 후 버퍼 비움.
				response.getOutputStream().flush();
				response.getOutputStream().close();

			} catch (Exception e) {
//				java단에서 js 알럴트 띄워주는 거 
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().print("<script language='javascript'>alert('관리자에게 문의해주세요.');history.back();</script>");	
			}
			
			
		}

	// 파일 ZIP 다운로드
	/*
	 * @RequestMapping("main/zipFileDown") public void zipFileDown(@RequestParam
	 * List<String> maps, HttpServletResponse response,HttpServletRequest request)
	 * throws Exception { String path = "c:\\image";
	 * 
	 * 
	 * 
	 * 
	 * 
	 * // 먼저 파라매터로 넘기고 그값 받아서 폴문 돌리면 바로 해결 될듯 넘기는걸 map? 배열선언해서? // File file = new
	 * File(path+replaceName);
	 * 
	 * // 폴더 zip파일로 내릴때 사용하는거. // File[] listFiles = file.listFiles();
	 * FileOutputStream fos = null; ZipOutputStream zipOut = null; FileInputStream
	 * fis = null;
	 * System.out.println("-----------------------------------"+replaceName); //임시
	 * zip 파일 만드는거 지워줘야함. 다운로드랑 다름. 한단계가 더 있어서 zip파일도 지워줘야함. fos = new
	 * FileOutputStream("D:\\준우형님.zip"); zipOut = new ZipOutputStream(fos); // 지금
	 * 리스트 파일로 담겨있는걸 파일 이름으로 체크박스에 체크한거 넘겨서 하면 될듯 배열로?
	 * 
	 * for(File fileToZip : file) { List<String> resultMap =
	 * service.selectZipFileInfo(maps);
	 * 
	 * String replaceName = (String) resultMap.get(0);
	 * 
	 * String originalFileName = (String) resultMap.get("ORIGINAL_NAME");
	 * System.out.println(
	 * "---------------------------------------------------------zipfile"+resultMap.
	 * get("REPLACED_NAME")); fis = new FileInputStream(fileToZip); ZipEntry
	 * zipEntry = new ZipEntry(fileToZip.getName()); zipOut.putNextEntry(zipEntry);
	 * byte fileByte[] = new byte[1024]; int length; while((length =
	 * fis.read(fileByte)) >=0) { zipOut.write(fileByte, 0, length); } fis.close();
	 * zipOut.closeEntry();
	 * 
	 * }
	 * 
	 * zipOut.close(); fos.close();
	 * 
	 * }
	 */
	/*
	 * @RequestMapping("/zipDown") public void zipDown(@RequestParam Map<String,
	 * Object> maps, HttpServletResponse response,HttpServletRequest request) throws
	 * Exception { String filePath = "C:\\image"; //대상 파일 경로 File fileDir = new
	 * File(filePath); //파일 경로 객체 생성
	 * 
	 * String zipFileTmp = "C:"; // 고정경로 C:할지 아니면 다른거 할지 고민 먼저 임시생성 경로임 String
	 * zipFileName = "test_zip.zip"; //되면 replacedName+확장자 할것 String zipFileFullName
	 * = filePath + File.separator + zipFileName; File zipFile = new
	 * File(zipFileFullName); ZipOutputStream zipOut = new ZipOutputStream(new
	 * FileOutputStream(zipFileFullName));
	 * 
	 * 
	 * for(String fileName : fileDir.list()) { zipOut.putNextEntry(new
	 * ZipEntry(fileName));
	 * 
	 * File file = new File(filePath, fileName); FileInputStream fis = new
	 * FileInputStream(file); byte[] buffer = new byte[1024]; int readLen = 0;
	 * while((readLen = fis.read(buffer))> 0){ zipOut.write(buffer, 0, readLen); }
	 * zipOut.closeEntry(); fis.close(); } zipOut.close();
	 * 
	 * InputStream is = new FileInputStream(zipFile); OutputStream os =
	 * response.getOutputStream(); String downloadFileName =
	 * URLEncoder.encode(zipFileName);
	 * 
	 * re }
	 */

}
