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
	<table id ="contents">
		<c:if test="${empty storeReservation }">
			<tr><td align ="center">등록된 매장이 없습니다.</td></tr>
		</c:if>
		
		<c:if test="${not empty storeReservation }">
			<c:forEach items="${storeReservation }" var = "list">
				<tr height="150px" onclick ="reservationView(${list.storeNo})" >
					<td align = "center">${list.storeNo3 }</td>
					<td align = "center">${list.prodNo2 }</td>
					<td align = "center">${list.count }</td>
					<td align = "center">${proResVO.memNo }</td>
					<td align = "center">${proResVO.pickupTime }</td>
					<td align = "center">${storeVO.address }</td>
					<td align = "center">${productVO.prodName }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>