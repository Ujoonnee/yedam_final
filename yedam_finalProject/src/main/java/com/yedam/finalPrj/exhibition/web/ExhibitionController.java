package com.yedam.finalPrj.exhibition.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yedam.finalPrj.exhibition.service.ExhibitionService;
import com.yedam.finalPrj.exhibition.vo.hong.HongExhibitionReservationVO;
import com.yedam.finalPrj.exhibition.vo.hong.PageMaker;
import com.yedam.finalPrj.exhibition.vo.hong.PagingVO;
import com.yedam.finalPrj.exhibition.vo.lee.ExhibitionReservationVO;
import com.yedam.finalPrj.exhibition.vo.lee.ExhibitionVO;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionPageMaker;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionPagingCriteria;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionReservationVO;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionVO;
import com.yedam.finalPrj.member.service.MemberVO;

@Controller
@RequestMapping("/exhibition/*")
public class ExhibitionController {

	@Autowired
	ExhibitionService service;

	
	// 홍제

	// 내 예약 목록
	@RequestMapping("exSelectAllReservation")
//	@ResponseBody
	public String exSelectAllReservation(PagingVO vo, Model model) {
		System.out.println(vo.getPageNum());
		List<HongExhibitionReservationVO> exhibitionReservationVO = service.selectAllExhibitionReservattion(vo);
		int total = service.totalCnt(vo);
		System.out.println("================================"+vo.getType());
		model.addAttribute("exhibitionReservationVO", exhibitionReservationVO);
		model.addAttribute("paging", new PageMaker(vo, total));

		return "general/exhibition/exhibitionReservation";
	}

	// 예약목록 상세페이지
	@RequestMapping(value = "exhibitionReservationDetail/{selectedResNo}", method = RequestMethod.GET)
	public String exhibitionReservationDetail(@PathVariable("selectedResNo") int selectedResNo,Model model) {

		model.addAttribute("exRes", service.exDetail(selectedResNo));
		model.addAttribute("reviewList", service.selectReview(selectedResNo));
		
		return "general/exhibition/exhibitionReservationDetail";
	}

	// 예약번호로 검색
	@GetMapping("searchExhibitionByNo")
	@ResponseBody
	public List<HongExhibitionReservationVO> searchExhibitionByNo(int exResNo) {
		return service.searchExhibitionByNo(exResNo);
	}
	// 예약 취소
	@PostMapping("cancel")
	@ResponseBody
	public void cancelOneReservation(int exResNo) {
		service.cancelOneReservation(exResNo);
	}
	
	// 준우
//(admin 전시등록신청목록보기 페이지 + 상세 페이지.)	
	// 모든 등록신청목록조회.
	@GetMapping("exRegAppList")
	public String exRegAppList(String approvalStatus, Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		if(user.getMemNo()==0) {
			model.addAttribute("regList", service.selectAllExh());
			return "admin/exhibition/exRegAppList";
		}else {
			return null; //404에러페이지 출력.
		}
	}

	// 승인여부로 검색.
	@GetMapping("exRegAppList2")
	@ResponseBody
	public List<ExhibitionVO> exRegAppList2(String approvalStatus) {
		return service.selectAllExhByStatus(approvalStatus);
	}

	// 전시명으로 검색.
	@GetMapping("exRegAppListByExhName")
	@ResponseBody
	public List<ExhibitionVO> selectAllByExhName(String exhName) {
		return service.selectAllByExhName(exhName);
	}

	// 사업자명으로 검색.
	@GetMapping("exRegAppListByMemName")
	@ResponseBody
	public List<ExhibitionVO> selectAllByMemName(String memName) {
		return service.selectAllByMemName(memName);
	}

	// 전시등록번호받아서 상세내용 출력하는 페이지로 넘어감
	@GetMapping("exRegAppDetail/{exNo}")
	public String selectOneByExNo(@PathVariable int exNo, Model model) {
		model.addAttribute("detail", service.selectOneByExNo(exNo));
		return "admin/exhibition/exRegAppDetail";
	}

	// 전시등록 승인(00401로 update)
	@PostMapping("exRegAppDetail/exhPermit")
	@ResponseBody
	public int exhPermit(int exNo) {
		return service.exhPermit(exNo);
	}

	// 전시등록 반려(00402로 update)
	@PostMapping("exRegAppDetail/exhReject")
	@ResponseBody
	public int exhReject(int exNo) {
		return service.exhReject(exNo);
	}

	// 성환

	// 우준

	// 사업자 시작 ===================

	// 전시 등록 신청 폼
	@GetMapping("provider/register")
	public String registerForm(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		
		
		model.addAttribute("member", (MemberVO) session.getAttribute("user"));

		return "provider/exhibition/register";
	}

	// 전시 등록 신청
	@PostMapping("provider/register")
	public String register(ExhibitionVO vo, HttpServletRequest request,@RequestParam("fileUpload") MultipartFile multi,Model model) {
		
		System.out.println("multtipart==========================="+multi);
		
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		vo.setMemNo(user.getMemNo());

		
		service.insertExhibition(vo,multi,model);

		// TODO 사업자의 등록 신청 목록 페이지로 이동시킬 것	
		return "redirect:registration";
	}

	// 로그인한 사업자의 전시 등록 신청 목록
	@GetMapping("provider/registration")
	public String getRegistrationList(Model model, HttpServletRequest request) {
		model.addAttribute("list", service.getRegistrationList(request));

		return "provider/exhibition/registrationList";
	}

	// 전시 등록 신청 상세
	@GetMapping("provider/registration/{exNo}")
	public String getRegistration(@PathVariable("exNo") int exNo, Model model) {
		
		model.addAttribute("exhibition", service.getRegistration(exNo));

		return "provider/exhibition/registration";
	}

	// 전시 목록 (승인완료)
	@GetMapping("provider/exhibitionList")
	public String getProviderExhibitionList(HttpServletRequest request, Model model) {
		model.addAttribute("list", service.getExhibitionList(request));
		return "provider/exhibition/exhibitionList";
	}

	// 전시 상세
	@GetMapping("provider/{exNo}")
	public String getProviderExhibition(@PathVariable("exNo") int exNo, Model model) {
		ParkExhibitionVO vo = new ParkExhibitionVO();
		vo.setExNo(exNo);
		model.addAttribute("exhibitionView", service.findExVO(vo));
		return "main/exhibition/exhibitionView";
	}

	// 전시 예약자 목록
	@RequestMapping("provider/{exNo}/reservation")
	public String getProviderReservationList(@PathVariable("exNo") int exNo, HttpServletRequest request, Model model) {
		model.addAttribute("list", service.getReservationList(exNo, request));
		return "provider/exhibition/reservationList";
	}

	// TODO 예약정보 상세
	@RequestMapping("provider/{exNo}/reservation/{exResNo}")
	public String getReservationDetail(@PathVariable("exNo") int exNo, @PathVariable("exResNo") int exResNo, Model model) {
		ExhibitionReservationVO vo = new ExhibitionReservationVO();
		vo.setExResNo(exResNo);
		
		model.addAttribute("reviewList", service.selectReview(exResNo));
		model.addAttribute("res", service.getReservation(vo));
		return "provider/exhibition/reservation";
	}

	// 사업자 끝 ===================

	// 성준
//	전시 출력
	@RequestMapping("list")
	public String list(ParkExhibitionPagingCriteria cri, Model model) {

		model.addAttribute("exhibitionList", service.exhibition(cri));
		model.addAttribute("paging", new ParkExhibitionPageMaker(cri, service.listTotalCnt(cri)));
		
		return "main/exhibition/exhibitionList";
	}

//	전시 목록 검색
	@RequestMapping(value = "searchExhibition", method = { RequestMethod.GET })
	public String searchEx(ParkExhibitionPagingCriteria cri, Model model,HttpServletRequest request) {
		model.addAttribute("exhibitionList", service.searchEx(cri));
		model.addAttribute("paging", new ParkExhibitionPageMaker(cri, service.totalExCnt(cri)));
		return "main/exhibition/exhibitionList";
	}

//	전시 상세보기
	@RequestMapping(value = "detailView", method = RequestMethod.GET)
	public String exhibitionView(ParkExhibitionVO vo, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		System.out.println("=========user"+user);
		
		model.addAttribute("member", user);
		model.addAttribute("exhibitionView", service.findExVO(vo));
		
		//전시번호 받아서 리뷰리스트 출력.
		int exNo = service.findExVO(vo).getExNo();
		model.addAttribute("reviewList",service.exhReviewLoad(exNo) );
		
		return "main/exhibition/exhibitionView";
	}

//	결제하기
	@RequestMapping(value = "payment", method = RequestMethod.POST)
	public String payment(Model model, ParkExhibitionReservationVO vo,ParkExhibitionVO exhibitionVo) {
		System.out.println("paymentDo");
		service.insertExhibitionReservation(vo);
		
		exhibitionVo.setExNo(vo.getExNo());
		model.addAttribute("exhibitionView", service.findExVO(exhibitionVo));
		return "main/exhibition/"+vo.getExNo()+"/exhibitionView";
	}

//  판매자 -> 결제취소 기능
	@PostMapping("provider/{exNo}/refund")
	public String exhibitionRefund(@RequestParam("exResNo") int exResNo,@RequestParam("exNo") int exNo, Model model, HttpServletRequest request) {
		System.out.println("===========Controller refund");
		System.out.println(exResNo);
		System.out.println(exNo);
		ParkExhibitionReservationVO vo = new ParkExhibitionReservationVO();
		vo.setExNo(exNo);
		vo.setExResNo(exResNo);
		
		service.updatePayStatus(vo);
		
		model.addAttribute("list", service.getReservationList(exNo, request));
		
		return "provider/exhibition/reservationList";
	}
	
	
	
	@RequestMapping(value = "pay/refund")
	@ResponseBody
	public String cancel(@RequestParam(value= "merchant_uid") String merchant_uid) {
		System.out.println("biz_email = " + merchant_uid);
//		Payed_listVO pvo = paySV.recentlyPay(merchant_uid);
//					
//		PaymentCheck obj = new PaymentCheck();
//		String token = obj.getImportToken();
//		System.out.println("merchant_uid :" + pvo.getMerchant_uid());
//		int res = obj.cancelPayment(token, pvo.getMerchant_uid());
//		
//		if(res == 1) {
//			Biz_memberVO bvo = memberSV.selectBizMember(pvo.getBiz_email());
//			bvo.setPay_coupon(bvo.getPay_coupon()-5);
//			System.out.println("paycoupon: " + bvo.getPay_coupon());
//			res = paySV.updateBiz_refund(bvo);
//			if(res ==1) {
//				res = paySV.refund_pay(pvo.getMerchant_uid());
//				if(res ==1) { return "Success";}
//			}else {	return "biz_refund Failure"; }
//			return "thanks";
//		}
//		else 
//			return "anyway Failure";
		return "help";
	}
	
	
}
