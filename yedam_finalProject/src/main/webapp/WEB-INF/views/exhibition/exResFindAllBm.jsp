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
	
	<div>
            
	<c:forEach items="${exresmems  }" var="exresm">
	<table>
		    <tr>
		      <th>예약번호</th>
		      <th>전시명</th>
		      <th>전시일</th>
		      <th>결제여부</th>
		      <th>금액</th>
		    </tr>
		    <%-- <tr>
		      <td>${ }</td>
		      <td>${ }</td>
		      <td>${ }</td>
		      <td>${ }</td>
		      <td>${ }</td>
		    </tr> --%>
	</table>
			</c:forEach>
        
	</div>
</body>
</html>