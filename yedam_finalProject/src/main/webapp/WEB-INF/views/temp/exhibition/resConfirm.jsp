<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>예약정보확인</h1>
	<hr>
		<div>
			<table>
	            <ul>
		            <li>${er.exDate }</li><br>
					<li>${ex.name }</li><br>
					<li>${ex.category }</li><br>			
					<li>${mem.name }</li><br>
					<li>${er.amount }</li><br>
	           </ul>
	     	</table>
		</div>
		<input name="resNo" type="hidden" value="${exresmem.exResNo}" />
	<hr>
</body>
</html>