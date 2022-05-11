<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="updateFrm" name="updateFrm" action="update">
		<h1>공지사항 수정 페이지</h1>
			<label>제목</label>
			<div><input type="text" name="title"></div>
	    	<label>내용</label>
	    	<div><textarea name="annContent"></textarea></div>
	    	
	    	
	    	
	<div>
		<select>
			<option value="" disabled="disabled" selected>공개여부</option>
			<option value="00201">공개</option>
			<option value="00202">비공개</option>
			<option value="00203">우선순위</option>
			<option value="00204">삭제</option>	
		</select>
	</div>
		<input type="hidden" name="annNo">
		
		<button type="submit">공지사항 수정</button>
		
	</form>
	
</body>
</html>