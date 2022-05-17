<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form id="reserve" name="reserve">	
			<c:forEach var="fac" items="${facility}">
				<table border="1">
					<tr>
						<td>예약번호</td>
						<td></td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td>${fac.category} </td>
					</tr>
					<tr>
						<td>시설명</td>
						<td>${fac.name}</td>
					</tr>
					<tr>
						<td>예약자명</td>
						<td>${member.name}</td>
					</tr>
					<tr>
						<td>예약일자</td>
						<td></td>
					</tr>
					<tr>
						<td>예약자 연락처</td>
						<td>${fac.tel}</td>
					</tr>
					<tr>
						<td>결제금액</td>
						<td></td>
					</tr>
				</table>
			
				
				<input type="hidden" id="num" value="${fac.facNo}">
				
			</c:forEach>
</form>

<button>결제하기</button>

<script type="text/javascript">
		$("button").on("click", function(){
			const url = "confirm.do/" + $("#num").val();
			location.href = url;
		})
</script>
</body>
</html>