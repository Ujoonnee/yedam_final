<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>


		<table>
			<tr>
				<th>예약번호</th>
				<th>사진</th>
				<th>전시명</th>
				<th>오픈기간</th>
				<th>폐점기간</th>
				<th>승인여부</th>
			</tr>
			<c:forEach items="${exres}" var="exres">
				<tr onclick="location.href='exFindOne?='${exres.exNo}">
					<td>${exres.exNo }</td>
					<td><img src="resources/img/${exres.thumbnail}" width="100px" height="100px"></td>
					<td>${exres.name }</td>
					<td>${exres.startDate }</td>
					<td>${exres.endDate }</td>
					<td>${exres.approvalStatus }</td>
				</tr>
			</c:forEach>
		</table>


	</div>
</body>
</html>