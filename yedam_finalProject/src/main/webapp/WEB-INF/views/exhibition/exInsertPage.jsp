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
	<h1>전시 등록 페이지</h1>
	<form id="insertFrm" name="insertFrm" action="insert" method="POST">
	<label>제목</label>
	<div><input type="text" name=""></div><br>
    <label>내용</label>
    <div><textarea  name=""></textarea></div><br>
    <div>날짜<input type="date" name=""></div>
	<br>
	<div>
		<select name="">
			<option value="" disabled="disabled" selected>공개여부</option>
			<option value="00501">공개</option>
			<option value="00502">우선순위</option>
			<option value="00503">비공개</option>
			<option value="00504">삭제</option>	
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