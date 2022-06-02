package com.yedam.finalPrj.store.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yedam.finalPrj.member.service.MemberVO;
import com.yedam.finalPrj.store.serviceImpl.StoreServiceImpl;
import com.yedam.finalPrj.store.vo.jo.ProductVO;
import com.yedam.finalPrj.store.vo.jo.ResProdListPageMaker;
import com.yedam.finalPrj.store.vo.jo.ResProdListPagingCriteria;
import com.yedam.finalPrj.store.vo.park.Store;
import com.yedam.finalPrj.store.vo.park.StorePageMaker;
import com.yedam.finalPrj.store.vo.park.StorePagingCriteria;

@Controller
@RequestMapping("/store/*")
public class StoreController {
	
	@Autowired StoreServiceImpl service;

	
//	Park
	
//	매장신청 양식 페이지
	@RequestMapping("register")
	public String register(HttpServletRequest request,Model model) {
		HttpSession session =  request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		
		if(user == null) {
			return "main/unusalApproach";
		}
//		관리자, 일반회원일시 메시지 출력 후 홈으로 이동 
		if(!user.getMemType().equals("00103")) {
			return "main/unusalApproach";
		}else {
			String vo = service.checkStoreNo(user, request, model);
			System.out.println("resgister========================"+vo);
			System.out.println(vo.length());
			if(vo.length() > 0) {
				return "main/unusalApproach"; //계정에 기존에 가게가 있다면 등록폼으로 이동 불가.
			}else {
				return "provider/store/storeRegister"; // 계정에 등록된 가게가 없을 시 등록폼으로 이동
			}
		}
	}
//	매장신청 양식 전송
	@RequestMapping("regist")
	public String regist(Store vo,Model model,HttpServletRequest request,@RequestParam("fileUpload") MultipartFile multi) {
		HttpSession session =  request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
//		세션없을시 메시지 출력 후 홈으로 이동.
		if(user == null) {
			return "main/unusalApproach";
		}
//		관리자, 일반회원일시 메시지 출력 후 홈으로 이동 
		if(!user.getMemType().equals("00103")) {
			return "main/unusalApproach";
		}else {
			
//		매장등록 번호 입력.
			service.regist(vo, request,multi,model);
			return "home/home";
		}
		
	}
	@RequestMapping("approvalList")
	public String approvalList(StorePagingCriteria cri,Model model, HttpServletRequest request ) {
		HttpSession session =  request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		if(user == null) {
			return "main/unusalApproach";
		}
		if(user.getMemType().equals("00101")) {
			model.addAttribute("regList", service.selectStoreRegList(cri,request));
			model.addAttribute("paging", new StorePageMaker(cri, service.totalCnt()));
			return "admin/store/storeWaitingApprovalList";
		}
		
		return "main/unusalApproach";
		
	}
	@RequestMapping(value ="searchApprovalList", method= {RequestMethod.GET})
	public String serachApprovalList(StorePagingCriteria cri,Model model, HttpServletRequest request) {
		service.searchApprovalList(cri, model,request);

		return "admin/store/storeWaitingApprovalList";
	}
	
	@PostMapping("updateStatus")
	public String updateStatus(@RequestBody List<HashMap<String,String>> vo,StorePagingCriteria cri,Model model, HttpServletRequest request) {
		System.out.println("======================updateStatus"+vo);
		service.updateStatus(vo);
		
		model.addAttribute("regList", service.selectStoreRegList(cri,request));
		model.addAttribute("paging", new StorePageMaker(cri, service.totalCnt()));

		return "admin/store/storeWaitingApprovalList";
	}
	
//	매장 리스트 출력
	@GetMapping("list")
	public String list(StorePagingCriteria cri,Model model) {
//		storeList출력
		model.addAttribute("storeList", service.storeList(cri));
		model.addAttribute("paging",new StorePageMaker(cri, service.totalCnt()));
		return "main/store/storeList";
	}
	

//	매장에서의 검색처리
	@RequestMapping(value ="searchList", method= {RequestMethod.GET})
	public String search(StorePagingCriteria cri,Model model, HttpServletRequest request ) {
		service.search(cri, model);
		return "main/store/storeList";
	}
	
		
	
//	Hong

//	댓글 삭제
//	@PostMapping("delete")
//	@ResponseBody
//	public void replyDelete(String revNo) {
//		service.deleteReply(Integer.parseInt(revNo));
//
//	public void replyDeletePOST(com.yedam.finalPrj.store.vo.jo.ProductReservationVO vo) {
//		service.deleteReply(vo);
//
//	}

	
//	Jo
	
//	예약한 상품 리스트 출력/ 검색처리
	@GetMapping("resProdList")
	public String reservedProductsList(ResProdListPagingCriteria cri,Model model,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		System.out.println(session);
		MemberVO user = (MemberVO) session.getAttribute("user");
		cri.setMemNo(user.getMemNo());
		
		if(cri.getType().isEmpty()) {
			model.addAttribute("resProdList", service.resProdList(cri));
			model.addAttribute("paging",new ResProdListPageMaker(cri,service.resTotalCnt(cri)));
		}else {
			//
			service.search(cri, model);
		}
		
		return "general/store/resProdList";
	}
	
// 	(예약번호 받아서)예약내역 상세페이지로 이동
	@GetMapping("resProdListByProdName/{selectedResNo}")
	public String reservedProductsDetail(@PathVariable("selectedResNo") int selectedResNo,Model model) {
			
		model.addAttribute("detail", service.resProdDetail(selectedResNo));
		model.addAttribute("prodList", service.resProdDetailList(selectedResNo));
		model.addAttribute("review", service.reviewLoad(selectedResNo));
		
		return "general/store/resProdDetail";

	}
//	예약한 상품 리스트 출력(예약취소후)
	@GetMapping("resProdListByProdName/cancel/{prodResNo}")
	public String resProductsList(@PathVariable int prodResNo, ResProdListPagingCriteria cri,
			Model model,HttpServletRequest request,@RequestParam("storeNo") int storeNo, @RequestParam(value="prodNo[]") List<String> prodNo) {
		
		service.CancelRes(prodResNo); // update(product_reservation테이블에서 결제상태 'N'으로, reserved_product테이블에서 반환한만큼 product테이블에서 재고수량 증가) 

		service.CancelRes2(storeNo, prodNo);

		return "redirect:/store/resProdList";
	}
	
//	Yoon
	
	
	
//	Lee
	
}
