<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<h3>전시등록신청상세</h3>
<table>
	<tr>
		<td>카테고리</td>
		<td>전시</td>
	</tr>
	<tr>
		<td>서비스명</td>
		<td>${detail.name}</td>
	</tr>
	<tr>
		<td>썸네일</td>
		<td><img alt="" src="../../resources/img/${detail.thumbnail}">${detail.thumbnail}</td>
	</tr>
	<tr>
		<td>장소명</td>
		<td>${detail.locationName}</td>
	</tr>
	<tr>
		<td>기간</td>
		<td><fmt:formatDate value="${detail.startDate}" pattern="yyyy-MM-dd"/> 
			~ <fmt:formatDate value="${detail.endDate}" pattern="yyyy-MM-dd"/></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td>${detail.tel}</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>${detail.address}</td>
	</tr>
	<tr>
		<td>서비스설명</td>
		<td>${detail.detail}</td>
	</tr>
</table>

<input type="hidden" id="exNo" value="${detail.exNo}">
<button id="permit">승인</button>&nbsp;&nbsp;&nbsp;<button id="reject">반려</button>&nbsp;&nbsp;&nbsp;
<button onclick="location.href='${pageContext.request.contextPath}/exhibition/exRegAppList'">목록</button>

<script type="text/javascript">
	$("#permit").on("click", function(){
		
		$.ajax({
			url: "exhPermit",
			method: "POST",
			dataType:'json',
			data: {exNo: $("#exNo").val()},
			success: function (data) {
				alert("승인되었습니다.")
	        },
	        error:function(){
	        	alert("실패");
	        }
		})
	})
	
	$("#reject").on("click", function(){
			
			$.ajax({
				url: "exhReject",
				method: "POST",
				dataType:'json',
				data: {exNo: $("#exNo").val()},
				success: function (data) {
					alert("반려되었습니다.")
		        },
		        error:function(){
		        	alert("실패");
		        }
			})
		})
	
</script>
</body>
</html>