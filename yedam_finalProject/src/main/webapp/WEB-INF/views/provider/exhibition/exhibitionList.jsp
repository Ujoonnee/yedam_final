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
<form id="frm" method="get">
	<table>
	<c:if test = "${empty exhibitionList }">
		<tr><th>전시가 없습니다.</th></tr>
	</c:if>
	<c:if test = "${not empty exhibitionList }">
		<c:forEach items="${exhibitionList }" var = "list" >
		<tr onclick = "exhibitionView(${list.exNo})">
			<td>${list.exNo }</td>
			<td>${list.memNo }</td>
			<td>${list.name }</td>
			<td>${list.startDate }</td>
			<td>${list.endDate }</td>
			<td>${list.address }</td>
		</tr>
		</c:forEach>
	</c:if>
	
	</table>
	<input type="hidden" id = "exNo" name= "exNo"/>
</form>
</div>
<script>

	function exhibitionView(n){
		frm.exNo.value= n;
		frm.action = "DetailView.do";
		frm.submit();
	}
</script>
</body>
</html>