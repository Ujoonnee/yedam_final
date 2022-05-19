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
<table>
		<tr>
			<td>매장이름</td>
			<td>상품명</td>
			<td>총 가격</td>
			<td>픽업상태</td>
			<td>픽업시간</td>
		</tr>
	<tbody>
		<c:forEach var="list" items="${reservedProductsList}">
		<tr>
			<td>매장이름</td>
			<td>상품명</td>
			<td>${list.paymentAmt}</td>
			<td>${list.paymentStatus}</td>
			<td>${list.pickupTime}, ${list.pickupDate}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>