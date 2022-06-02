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


<div>
	<form id="frm" method="post">
		<table>
			<c:if test = "${empty list }">
				<tr><th>전시가 없습니다.</th></tr>
			</c:if>
			<c:if test = "${not empty list }">
				<c:forEach items="${list }" var = "ex" >
				<tr onclick="getReservationList(${ex.exNo})">
					<td>${ex.exNo }</td>
					<td>${ex.memNo }</td>
					<td>${ex.name }</td>
					<td>${ex.startDate }</td>
					<td>${ex.endDate }</td>
					<td>${ex.address }</td>
				</tr>
				</c:forEach>
			</c:if>
		</table>
	</form>
</div>

<script>

	function getReservationList(exNo) {
		frm.action = exNo +'/reservation';
		frm.submit();
	}
</script>
</body>
</html>