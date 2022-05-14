<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>

<h1>전시</h1>
	
	
	<div>
            <ul style="list-style: none;">
			<c:forEach items="${exhibitions }" var="exh">
                <li>
                <figure>
                <a href="exFindOne?exNo=${exh.exNo}">
	                <img width="150" height="150" src="resources/img/${exh.thumbnail}">                
	                   <figcaption>
	                           <span>${exh.name }</span><br>
	                           <span>${exh.showRoom }</span>
	                           <span>${exh.startDate }</span>
	                           <span>${exh.endDate }</span>
	                   </figcaption>
				</a>
	            </figure>
                </li>
			</c:forEach>
           </ul>
	</div>

</body>
</html>