<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="form1" name="form1" method="post" action="regDetail" enctype="multipart/form-data">
<table>
	<tr>
		<td>카테고리</td>
		<td>시설대관</td>
	</tr>
	<tr>
		<td>시설명</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>썸네일</td>
		<td><input type="file" name="thumbnail"></td>
	</tr>
	<tr>
		<td>대관비용</td>
		<td><input type="text" name="price"></td>
	</tr>
	<tr>
		<td>등록기간</td>
		<td><input type="date" name="startDate"> ~ <input type="date" name="endDate"></td>
	</tr>
	<tr>
		<td>이용가능시간</td>
		<td><input type="time" name="startTime"> ~ <input type="time" name="endTime"></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><input type="text" name="tel"></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><input type="text" name="address"></td>
	</tr>
	<tr>
		<td>시설대관 설명</td>
		<td><textarea cols="50" rows="20" name="detail"></textarea></td>
	</tr>
</table>
<input type="submit" value="등록">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="취소">
</form>

</body>
</html>