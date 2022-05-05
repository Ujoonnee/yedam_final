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
<h1>공지사항</h1>
	<div align="center">
		<div>
			<h1>공지사항</h1>
		</div>
		<div>
								<!-- 검색 자동완성 기능은 아직 보류 -->
		<form name="search-form" autocomplete="off">
			<table border="1" id="boardtable">
				<thead>
					<tr>
						<th width="50">N O</th>
						<th width="150">제목</th>
						<th width="150">작성자</th>
						<th width="150">등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${announcements}" var="announcement">
						<c:if test="${announcement.announcementStatus eq 'Y'}">
							<tr>
								<td>${announcement.announcementSerial }</td>
								<td>${announcement.announcementTitle }</td>
								<td>${announcement.announcementWriter }</td>
								<td>${announcement.announcementDate }</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
									
	
				<select name="type">
					<option selected value="">전체</option>
					<option value="announcementTitle">제목</option>
					<option value="announcementContent">내용</option>
				</select>
			<div>
				<input type="text" name="keyword">
				<input type="button" onclick="searchList()" value="검색">
				
			</div>
		</form>
		</div><br>
	
</div>

</body>
</html>