<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>Insert title here</title>
</head>
<body>

<h3>예약자 목록</h3><br>
<select name="resNo">
	<option value="none">예약번호</option>
	<option value="">예약자명</option>
	<option value="">결제여부</option>
	<option value="">리뷰</option>
	
</select>

<input type="text" >
<button type="button">검색</button>



<table>
	<tr>
		<td>예약번호</td>
		<td>예약자명</td>
		<td>결제일자</td>
		<td>금액</td>
		<td>결제상태</td>
		<td>리뷰</td>
	</tr>
	<tbody >
	<c:forEach var="res" items="${resList}">
		<tr class="list">
			<td>${res.facResNo}</td>
			<td>${res.member.name}</td>
			<td>${res.payDate}</td>
			<td>${res.paymentAmt}</td>
			<td>${res.resStatus}</td>
			<td>${res.revStatus}</td>
		</tr>
	</c:forEach>
	</tbody>

</table>

<script>

$("table").on("click", ".list", function(){
	console.log($(this).children().first().html());

	
	const url = "detail/" + $(this).children().first().html();
	location.href = url;
	
}) 

</script>

</body>
</html>