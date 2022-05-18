package com.yedam.finalPrj.home.serviceImpl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.finalPrj.home.service.HomeService;
import com.yedam.finalPrj.member.service.MemberVO;

@Service("homeService")
public class HomeServiceImpl implements HomeService {
	
	@Autowired HomeMapper map;
	
	@Override
	public String login(MemberVO member, HttpServletRequest request) {

		String pw = member.getPassword();
		
		member = map.selectMember(member);
		
		String result = (member == null)? "id" 
						: (!member.getPassword().equals(pw))? "pw" : "success";
		
		if (result.equals("success")) {
			HttpSession session = request.getSession();
			session.setAttribute("user", member);
		}
		
		return result;
	}
	
	@Override
	public Map<String, Object> getRecommendation() {
		Map<String, Object> result = new HashMap<>();
		
//		result.put("showList", map.getShowRecommendation());
//		result.put("exhibitionList", map.getExhibitionRecommendation());
//		result.put("facilityList", map.getFacilityRecommendation());
		
		
		return result; 
	}
}
