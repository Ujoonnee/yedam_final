<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>exhibition registration list</title>

<h1>전시 등록 신청 목록</h1>

<table>
	<thead>
		<tr>
			<th>전시번호</th>
			<th>전시명</th>
			<th>전시기간</th>
			<th>신청일</th>
			<th>승인여부</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list }" var="ex">
			<tr>
				<td>${ex.exNo }</td>
				<td>${ex.name }</td>
				<td>
					${ex.startDate } <br>
					 ~ ${ex.endDate }
				</td>
				<td>${ex.applicationDate}</td>
				<td>${ex.approvalStatus }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<script>
	$('tr').on('click', function() {
		location.href = 'registration/' + this.children[0].innerText;
	})
</script>