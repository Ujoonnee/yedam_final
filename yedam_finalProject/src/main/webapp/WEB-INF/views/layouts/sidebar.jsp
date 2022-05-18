<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 마이페이지 사이드바 -->


<%-- 사이드바 메뉴 --%>
<c:choose>
<%-- 	관리자 --%>
	<c:when test="${user.memType eq '00101' }">
	
		<div>
			회원정보 수정
		</div>
		
		<div>
			<ul>
				<li>서비스 등록 신청 목록</li>
				<li><a href="${pageContext.request.contextPath}/exhibition/exRegAppList">전시</a></li>
				<li></li>
				<li></li>
			</ul>
		</div>
		
	</c:when>
	
	
<%-- 	일반회원 --%>
	<c:when test="${user.memType eq '00102' }">
	
		<div>
			회원정보 수정
		</div>
		
		<ul>
			<li>내 예약 목록</li>
			<li><a href="${pageContext.request.contextPath}/exhibition/exSelectAllReservation">전시</a></li>
			<li></li>
			<li></li>
		</ul>
		
	</c:when>
	
	
<%-- 	사업자회원 --%>
	<c:otherwise>
	
		<%-- 변수 설정--%>
		<c:choose>
			<c:when test="${user.buisnessType eq '00201'}">
				<c:set var="buisness" value="show" />
				<c:set var="buisnessName" value="공연" />
			</c:when>
			<c:when test="${user.buisnessType eq '00202'}">
			<c:set var="buisness" value="exhibition" />
				<c:set var="buisnessName" value="전시" />
			</c:when>
			<c:when test="${user.buisnessType eq '00203'}">
			<c:set var="buisness" value="facility" />
				<c:set var="buisnessName" value="시설" />
			</c:when>
			<c:when test="${user.buisnessType eq '00203'}">
				<c:set var="buisness" value="store" />
				<c:set var="buisnessName" value="매장" />
			</c:when>
		</c:choose>

		
		<div>
			회원정보 수정
		</div>
		
		<div>
			<a href="${pageContext.request.contextPath}/${buisness }/registration">${buisnessName } 등록 신청</a>
		</div>
		
		<div>
			<a href="${pageContext.request.contextPath}/${buisness }/provider/exhibitionList">내 ${buisnessName } 목록</a>
		</div>
		
	</c:otherwise>
</c:choose>