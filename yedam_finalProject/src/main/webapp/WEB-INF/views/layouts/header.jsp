<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div>
	
	<div class="my-2" id="loginInfo" align="right">
		<c:if test="${empty user }">
			<a href="">로그인</a>　 |　 <a href="">회원가입</a> 
			<a href="${pageContext.request.contextPath}/tempLogin?email=admin&password=123456">관리자</a>
			<a href="${pageContext.request.contextPath}/tempLogin?email=provider&password=123456">사업자</a>
			<a href="${pageContext.request.contextPath}/tempLogin?email=general&password=123456">일반회원</a>
		</c:if>
		<c:if test="${not empty user }">
			<a href="${pageContext.request.contextPath}/myPage">${user.name }</a><span>님 안녕하세요!　 |　 </span><a href="${pageContext.request.contextPath}/logout">로그아웃</a>
		</c:if>
	</div>
	
	
	<div class="row justify-content-center">
		<div class="col-4 mb-3 text-center">
			<a href="${pageContext.request.contextPath}"><img src="<c:url value='/resources/img/logo.jpg'/>" width="200px"></a>
		</div>
	</div>
	
	<hr>
	
	
	<div class="row mt-4 text-center justify-content-center align-middle" id="topbar">
		<div class="col-2 px-3 h4 border-end">
			<a href="#">공연</a>
		</div>
		<div class="col-2 px-3 h4 border-start border-end">
			<a href="${pageContext.request.contextPath}/exhibition/list">전시</a>
		</div>
		<div class="col-2 px-3 h4 border-start border-end">
			<a href="#">시설</a>
		</div>
		<div class="col-2 px-3 h4 border-start">
			<a href="#">매장</a>
		</div>
	</div>
	
</div>
