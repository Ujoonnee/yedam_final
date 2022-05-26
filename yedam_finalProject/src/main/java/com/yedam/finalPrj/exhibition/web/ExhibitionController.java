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
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.finalPrj.exhibition.service.ExhibitionService;
import com.yedam.finalPrj.exhibition.vo.hong.ExhibitionReservationVO;
import com.yedam.finalPrj.exhibition.vo.hong.PageMaker;
import com.yedam.finalPrj.exhibition.vo.hong.PagingVO;
import com.yedam.finalPrj.exhibition.vo.lee.ExhibitionVO;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionPageMaker;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionPagingCriteria;
import com.yedam.finalPrj.exhibition.vo.park.ParkExhibitionVO;
import com.yedam.finalPrj.member.service.MemberVO;
import com.yedam.finalPrj.member.serviceImpl.MemberServiceImpl;

@Controller
@RequestMapping("/exhibition/*")
public class ExhibitionController {

	@Autowired
	ExhibitionService service;

	
	// 홍제

	// 내 예약 목록
	@GetMapping("/exSelectAllReservation")
	public String exSelectAllReservation(PagingVO vo, Model model) {
		List<ExhibitionReservationVO> exhibitionReservationVO = service.selectAllExhibitionReservattion();
		int total = service.totalCnt(vo);

		model.addAttribute("exhibitionReservationVO", exhibitionReservationVO);
		model.addAttribute("paging", new PageMaker(vo, total));

		return "general/exhibition/exhibitionReservation";
	}

	// 예약목록 상세페이지
	@RequestMapping(value = "exhibitionReservationDetail", method = RequestMethod.GET)
	public String exhibitionReservationDetail(Model model, ExhibitionReservationVO vo) {
		System.out.println("값확인" + model.getAttribute("exResNo"));
		System.out.println(vo.getExResNo());
		ExhibitionReservationVO detail = service.exDetail(vo);
		model.addAttribute("exRes", detail);
		return "general/exhibition/exhibitionReservationDetail";
	}

	// 준우
	// 모든 등록신청목록조회.
	@GetMapping("exRegAppList")
	public String exRegAppList(String approvalStatus, Model model) {
		model.addAttribute("regList", service.selectAllExh());
		return "admin/exhibition/exRegAppList";
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

	// 전시등록번호에 따라 상세내용 출력하는 페이지로 넘어감
	@GetMapping("exRegAppDetail/{exNo}")
	public String selectOneByExNo(@PathVariable int exNo, Model model) {
		model.addAttribute("detail", service.selectOneByExNo(exNo));
		return "exhibition/exRegAppDetail";
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
	@GetMapping("register")
	public String registerForm(Model model) {

		// TODO session 에서 받는 member 정보로 교체할 것
		MemberVO member = new MemberVO();
		member.setMemNo(2);
		model.addAttribute("member", member);

		return "provider/exhibition/register";
	}

	// 전시 등록 신청
	@PostMapping("register")
	public String register(ExhibitionVO vo) {
		System.out.println(vo);
		service.insertExhibition(vo);

		// TODO 사업자의 등록 신청 목록 페이지로 이동시킬 것
		return "provider/exhibition/registrationList";
	}

	// 로그인한 사업자의 전시 등록 신청 목록
	@GetMapping("registration")
	public String getRegistrationList(Model model, HttpServletRequest request) {
		model.addAttribute("list", service.getRegistrationList(request));

		return "provider/exhibition/registrationList";
	}

	// 전시 등록 신청 상세
	@GetMapping("registration/{exNo}")
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

	// TODO 전시 상세
	@GetMapping("provider/exhibitionList/{exNo}")
	public String getProviderExhibition(@PathVariable("exNo") int exNo, Model model) {

		// 서비스의 전시 상세 페이지로 연결할 것
		return "";
	}

	// 전시 예약자 목록
	@RequestMapping("provider/exhibitionList/{exNo}/reservation")
	public String getProviderReservationList(@PathVariable("exNo") int exNo, HttpServletRequest request) {

		return "";
	}

	// TODO 예약정보 상세

	// 사업자 끝 ===================

	// 성준
//	전시 출력
	@RequestMapping("list")
	public String list(ParkExhibitionPagingCriteria cri, Model model) {

		model.addAttribute("exhibitionList", service.exhibition(cri));
		model.addAttribute("paging", new ParkExhibitionPageMaker(cri, service.totalExCnt(cri)));

		return "main/exhibition/exhibitionList";
	}

//	전시 목록 검색
	@RequestMapping(value = "searchExhibition", method = { RequestMethod.GET })
	public String searchEx(ParkExhibitionPagingCriteria cri, Model model) {
		System.out.println(cri.getExVO().getAddress());
		System.out.println(cri.getExVO().getStartDate());
		System.out.println(cri.getExVO().getEndDate());
		model.addAttribute("exhibitionList", service.searchEx(cri));
		model.addAttribute("paging", new ParkExhibitionPageMaker(cri, service.totalExCnt(cri)));
		return "main/exhibition/exhibitionList";
	}

//	전시 상세보기

	@RequestMapping(value = "detailView", method = RequestMethod.GET)
	public String exhibitionView(ParkExhibitionVO vo, HttpServletRequest request, Model model) {
//		이건 추후에 삭제할거임 
		System.out.println(vo.getExNo());
		HttpSession session =  request.getSession();
		MemberVO mem = (MemberVO) session.getAttribute("user");
		model.addAttribute("member", mem);
		model.addAttribute("exhibitionView", service.findExVO(vo));
		return "main/exhibition/exhibitionView";
	}

//	결제하기
	@RequestMapping(value = "payment", method = RequestMethod.POST)
	public String payment(Model model, ParkExhibitionVO vo) {
		System.out.println("paymentDo");
		service.insertExhibitionReservation(vo);
		return "";
	}

	
	
	
}
