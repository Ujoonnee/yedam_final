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
	<h1>공지사항 등록 페이지</h1>
	<form id="insertFrm" name="insertFrm" action="insert" method="POST">
	<div>제목<input type="text" name="announcementTitle"></div>
    <div>내용<textarea name="announcementContent"></textarea></div>
    <div>날짜<input type="date" name="announcementDate"></div>
	
	<div>
		<select>
		<option value="">공개여부</option>
		<option value="Y">공개</option>
		<option value="N">비공개</option>	
		</select>
	</div>
	<div><input type="submit" value="공지사항 등록"></div>

   </form>
   
   
</body>
</html>