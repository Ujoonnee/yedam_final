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
			<div>제목<input type="text" name="announcementTitle"></div>
    		<div>내용<textarea name="announcementContent"></textarea></div>
    		<div>날짜<input type="date" name="announcementDate"></div>
	
		<input type="hidden" name="announcementSerial">
		<button type="submit">공지사항 수정</button>
		<!-- 교수님한테 물어보기 상세페이지를 2(관리자용 AND 일반이용자, 사업자, 비회원용)개를 만드는것과 수정페이지로 다시 한번 더 들어가는거 -->
	</form>
	
</body>
</html>