<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="js/jquery.min.js"></script>
<style>
#container {
	padding: 0 0 100px;
}

table {
	margin-top: 50px;
	width: 60%;
	font-size: 1.3em;
	text-align : center;
}

#noticeBody>tr>td {
	padding-top: 10px;
}

th {
	text-align: center;
	border-style: none none solid none;
}

.pagelist {
	text-align: center;
}

.pagelist li {
	display: inline-block;
	list-style: none;
	padding: 10px;
}

#page_list {
	margin-top: 50px;
}

#page_list>ul>li>a {
	color: black;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align = "center" id = "container">
	<div id = "title">
		<h2>내 서비스 리스트</h2>
	</div>
	<table>
	<tr>
		<td>service_name</td><td>service_address</td><td>service_capacity</td><td>service_start_time</td><td>service_end_time</td>
	</tr>
	<c:forEach items= "${approval }" var ="list">
		<td>${list.service_name }</td>
		<td>${list.service_address }</td>
		<td>${list.service_capacity }</td>
		<td>${list.service_start_time }</td>
		<td>${list.service_end_time }</td>
	</c:forEach>
	<c:forEach items= "${approvals }" var ="list">
		<td>${list.service_name }</td>
		<td>${list.service_address }</td>
		<td>${list.service_capacity }</td>
		<td>${list.service_start_time }</td>
		<td>${list.service_end_time }</td>
	</c:forEach>
	</table>
</div>
</body>
</html>