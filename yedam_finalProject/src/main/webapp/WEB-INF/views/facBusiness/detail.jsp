<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>예약내역 상세</h3>

	<table border="1">
		
			<tr>
				<td>예약번호</td>
				<td>${resDetail.facResNo}</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>시설대관</td>
			</tr>
			<tr>
				<td>시설명</td>
				<td>${facName}</td>
			</tr>
			<tr>
				<td>예약자명</td>
				<td>${resMem.name}</td>
			</tr>
			<tr>
				<td>예약날짜</td>
				<td>${resDetail.startDate} ~ ${resDetail.endDate}</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${resMem.tel}</td>
			</tr>
			<tr>
				<td>결제일시</td>
				<td>${resDetail.payDate}</td>
			</tr>
			<tr>
				<td>결제금액</td>
				<td>${resDetail.paymentAmt}</td>
			</tr>
		
	</table>
<button type="button">예약취소</button>
			
</body>
</html>