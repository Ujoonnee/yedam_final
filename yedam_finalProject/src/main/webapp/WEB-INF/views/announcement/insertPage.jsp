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
	<label>제목</label>
	<div><input type="text" name="title"></div><br>
    <label>내용</label>
    <div><textarea  name="annContent"></textarea></div><br>
    <div>날짜<input type="date" name="annDate"></div>
	<br>
	<div>
		<select>
		<option value="" disabled="disabled" selected>공개여부</option>
		<option value="00201">공개</option>
		<option value="00202">비공개</option>
		<option value="00203">우선순위</option>
		<option value="00204">삭제</option>	
		</select>
	</div>
	<div>첨부파일</div>
	<br>
	<div>
	<input type="submit" value="작성">
	<input type="button" onclick="findAll" value="취소">
	</div>
	

   </form>
   
   
</body>
</html>