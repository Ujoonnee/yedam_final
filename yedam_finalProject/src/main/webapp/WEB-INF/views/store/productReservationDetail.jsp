<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>상품 예약 상세</h3>

	<table>
		<tr>
			<td>예약번호</td>
			<td>${proRe.prodResNo }</td>
		</tr>
		<tr>
			<td>예약자명</td>
			<td>${proRe.name }</td>
		</tr>
		<tr>
			<td>예약자 연락처</td>
			<td>${proRe.tel }</td>
		</tr>
		<tr>
			<td>픽업일시</td>
			<td><fmt:formatDate value="${proRe.pickupTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
		</tr>
		
	</table>
	<hr>
	<table>
		<tr>
			<th>썸네일</th>
			<th>상품명</th>
			<th>수량</th>
			<th>금액</th>
		</tr>
		<c:set var="total" value="0"/>
		<c:forEach items="${detailList }" var="list" varStatus="status">
		<tr>
			<td>${list.prodThumbnail }</td>
			<td>${list.prodName }</td>
			<td>${list.price }</td>
			<td>${list.payment }</td>
		</tr>
		<c:set var="total" value="${total + list.payment }"/>
		<tr>
			<td>총 금액</td>
			<td><c:out value="${total }"/></td>
		</tr>
		</c:forEach>
	</table>
	<button align="center">주문취소</button>
</body>
</html>