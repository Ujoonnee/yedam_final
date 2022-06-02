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
			<tr onclick="getReservation(${res.exResNo})">
				<td>${res.exResNo }</td>
				<td>${res.exNo }</td>
				<td>${res.exDate }</td>
				<td>${res.paymentStatus }</td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
	
</form>

<script>
	function getReservation(exResNo) {
		frm.action = 'reservation/' + exResNo;
		frm.submit();
	}
</script>
</body>
</html>