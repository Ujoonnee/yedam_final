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
<select>
	<option value="">예약번호</option>
	<option value="">시설명</option>
	<option value="">결제여부</option>
</select>
<input type="text"><button type="button">검색</button>
<table>
	<tr>
		<td>예약번호</td>
		<td>시설명</td>
		<td>결제일자</td>
		<td>결제여부</td>
		<td>금액</td>
		<td><button>리뷰하기</button></td>
	</tr>
	<tbody class="list">
		<c:forEach var="MRL" items="${myResList}">
		<tr>
			<td>${MRL.facResNo}</td>
			<td></td>
			<td>${MRL.payDate}</td>
			<td>${MRL.status}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<script>
	$("table").on("click", ".list", function(){
		
			console.log($(this).find("td").first().html());

			const url = "detail.do/" + $(this).find("td").first().html()
			location.href = url;
			
		}) 
</script>
</body>
</html>