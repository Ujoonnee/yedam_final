<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>내 예약정보 > 전시 > 예약내역 상세</h3><br>
	<hr>
	<div class="row">
		<div class="col-2">예약번호</div>
		<div class="col">${exresmem.exNo }</div>
	</div>
	<br>

	<div class="row">
		<div class="col-3">상태</div>
		<div class="col">1234</div>
	</div>
	<br>

	<div class="row">
		<div class="col-3">카테고리</div>
		<div class="col">1234</div>
	</div>
	<br>
	<div class="row">
		<div class="col-3">전시명</div>
		<div class="col">1234</div>
		<br>
	</div>
	<div class="row">
		<div class="col-3">오픈기간</div>
		<div class="col">1234</div>
		<br>
	</div>
	<div class="row">
		<div class="col-3">마감기간</div>
		<div class="col">1234</div>
	</div>
	<div class="row">
		<div class="col-3">예약자명</div>
		<div class="col">1234</div>
	</div>
	<div class="row">
		<div class="col-3">예약일시</div>
		<div class="col">1234</div>
	</div>
	<div class="row">
		<div class="col-3">예약자 연락처</div>
		<div class="col">1234</div>
	</div>
	<div class="row">
		<div class="col-3">수량</div>
		<div class="col">1234</div>
	</div>

	<div class="row">
		<div class="col-3">결제금액</div>
		<div class="col">1234</div>
	</div>

	<input name="resNo" type="hidden" value="${exresmem.exResNo}" />
	<hr>
</body>
</html>