<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




<form id="frm" method="get">
	<table>
		<c:if test = "${empty list }">
			<tr><th>예약이 없습니다.</th></tr>
		</c:if>
		<c:if test = "${not empty list }">
			<c:forEach items="${list }" var = "res" >
			<tr onclick="getReservation(${res.exNo})">
				<td>${res.exResNo }</td>
				<td>${res.exNo }</td>
				<td>${res.exDate }</td>
				<td>${res.startDate }</td>
				<td>${res.endDate }</td>
				<td>${res.paymentStatusCodeName }</td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
	
	
	
</form>
	
</body>
</html>