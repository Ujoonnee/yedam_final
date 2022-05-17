<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>서비스등록신청상세</h3>
	
<form id="form1" name="form1" method="get" action="regDetail" >
<table>
	<tr>
		<td>카테고리</td>
		<td>시설대관</td>
	</tr>
	<tr>
		<td>시설명</td>
		<td><input name="name" value="${reg.name}" style=border:0px; readonly></td>
	</tr>
	<tr>
		<td>썸네일</td>
		<td><input type="file" name="thumbnail" value="${reg.thumbnail}" type="hidden">${reg.thumbnail}</td>
	</tr>
	<tr>
		<td>대관비용</td>
		<td><input name="price" value="${reg.price}" style=border:0px; readonly></td>
	</tr>
	<tr>
		<td>등록기간</td>
		<td><input type="date" value="${reg.startDate}" name="startDate" readonly> ~ <input type="date" value="${reg.endDate}" class="class" name="endDate" readonly></td>
	</tr>
	<tr>
		<td>이용가능시간</td>
		<td><input type="time" value="${reg.startTime}" name="startTime" readonly> ~ <input type="time" value="${reg.endTime}" name="endTime" readonly></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><input type="text" value="${reg.tel }" name="tel" readonly></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><input type="text" value="${reg.address}" name="address" readonly></td>
	</tr>
	<tr>
		<td>시설대관 설명</td>
		<td><textarea cols="50" rows="20" name="detail" readonly>${reg.detail}</textarea></td>
	</tr>
</table>
<input type="button" id="updBtn" value="수정하기">&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" id="updCompleBtn" value="수정완료">&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" value="등록취소">
</form>
	
<script>
	//수정하기버튼, input readonly 비활성화.
	$("#updBtn").on("click", function(){
		$("input").attr("readonly", false);
		$("textarea").attr("readonly", false);
	});
	
	//수정완료버튼, DB에 업데이트/alert 수정이완료되었습니다.
	$("#updCompleBtn").on("click", function(){
		
	});
	/* 
	submit 후에 데이터 db에 update처리하기. */
</script>
</body>
</html>