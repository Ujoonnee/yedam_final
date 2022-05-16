<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>예약내역상세</h3>
<table>
	<tr>
		<td>예약번호</td>
		<td>${detail.facResNo}</td>
	</tr>
	<tr>
		<td>시설명</td>
		<td>${facName.name}</td>
	</tr>
	<tr>
		<td>예약자명</td>
		<td>${person.name}</td>
	</tr>
	<tr>
		<td>예약일자</td>
		<td>${detail.startDate} ~ ${detail.endDate}</td>
	</tr>
	<tr>
		<td>예약자 연락처</td>
		<td>${person.tel}</td>
	</tr>
	<tr>
		<td>결제여부</td>
		<td>${detail.status}</td>
	</tr>
	<tr>
		<td>결제일자</td>
		<td>${detail.payDate}</td>
	</tr>
	<tr>
		<td>결제금액</td>
		<td>${detail.paymentAmt}</td>
	</tr>
</table>
<button type="button">예약취소</button>&nbsp;&nbsp;&nbsp;<button type="button">리뷰작성</button>
</body>
</html>