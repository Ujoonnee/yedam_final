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
            <ul style="list-style: none;">
			<c:forEach items="${exresmems  }" var="exresm">
                <li>
                <figure>
                <a href="">
	                   <figcaption>
	                         <span>${exresm.startDate }</span>
	                         <span>${exresm.endDate }</span>
			                 <span>${exresm.category }</span><br>
	                         <span>${exresm.memName }</span>
	                         <span>${exresm.exName }</span><br>
	                         <span>${exresm.buisnessNum }</span>
	                   </figcaption>
				</a>
	            </figure>
                </li>
			</c:forEach>
           </ul>
	</div>
</body>
</html>