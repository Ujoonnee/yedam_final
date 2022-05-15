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
<h1>예약페이지</h1>
	<hr>
		<div>
			<table>
	            <ul>
		            <li>${exresmem.exDate }</li><br>
					<li>${exresmem.exName }</li><br>
					<li>${exresmem.category }</li><br>			
					<li>${exresmem.memName }</li><br>
					<li>${exresmem.startDate }</li><br>
					<li>${exresmem.endDate }</li><br>
					<li>${exresmem.buisnessNum }</li><br>
					<li>${exresmem.amount }</li><br>
					<li>${exresmem.paymentAmt }</li><hr>
	           </ul>
	     	</table>
		</div>
	<hr>
</body>
</html>