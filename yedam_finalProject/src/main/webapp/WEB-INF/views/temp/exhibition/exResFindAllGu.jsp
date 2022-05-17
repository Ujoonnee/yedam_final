<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jQuery/jquery-3.4.1.min.js"></script>
</head>
<body>
	
	<div>
            
	
	<table>
		    <tr>
		      <th>예약번호</th>
		      <th>전시명</th>
		      <th>전시일</th>
		      <th>결제여부</th>
		      <th>금액</th>
		      <th>리뷰</th>
		    </tr>
		<c:forEach items="${exres }" var="exRes">
		   <tr>
		      <td>${exRes.exResNo }</td>
		      <td>${exRes.name }</td>
		      <td>${exRes.exDate }</td>
		      <td>${exRes.status }</td>
		      <td>${exRes.paymentAmt }</td>
		      <td><button>리뷰버튼 들어올 칸 아직 안적음.</button></td>
		    </tr>
		</c:forEach>  
	</table>
		
        
	</div>
</body>
</html>