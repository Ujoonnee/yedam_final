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
<form id="form2" name="form2">
<table border="1">
	<tr>
		<td></td>
		<td>시설명</td>
		<td>주소</td>
		<td>기간</td>
	</tr>
	
			<c:forEach var="fac" items="${facility}">
	<tr class="list">
				<td>${fac.thumbnail}  <input type="hidden" value="${fac.facNo}"></td>
				<td>${fac.name}  </td>
				<td>${fac.address}  </td>
				<td>${fac.startDate} ~ ${fac.endDate}</td>
				
				
	</tr>
			</c:forEach>
			
</table>
</form>
<script>


	$("table").on("click", ".list", function(){
		
		console.log($(this).find("input").val());

		const url = "detail.do/" + $(this).find("input").val();
		location.href = url;

	}) 

</script>

	
</body>
</html>