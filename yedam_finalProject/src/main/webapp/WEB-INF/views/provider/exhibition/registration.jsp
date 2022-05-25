<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>exhibition registration detail</title>

<h1>전시 등록 신청 상세</h1>

<table border="1">
	<colgroup>
		<col>
		<col width="500px">
	</colgroup>
	<tr>
		<th>카테고리</th>
		<td>전시</td>
	</tr>
	<tr>
		<th>전시명</th>
		<td>${exhibition.name }</td>
	</tr>
	<tr>
		<th>전시장명</th>
		<td></td>
	</tr>
	<tr>
		<th>티켓 가격</th>
		<td></td>
	</tr>
	<tr>
		<th>썸네일</th>
		<td>
			<div>
				<img src="resources/img/thumbnail.jpg" alt="thumbnail preview">
			</div>
		</td>
	</tr>
	<tr>
		<th>전시 기간</th>
		<td><input type="date" name="startDate" value="2022-05-11">
			~ <input type="date" name="endDate" value="2022-05-18"></td>
	</tr>
	<tr>
		<th>연락처</th>
		<td></td>
	</tr>
	<tr>
		<th>주소</th>
		<td></td>
	</tr>
	<tr>
		<th>전시 설명</th>
		<td></td>
	</tr>
</table>

<input type="button" id="submitBtn" value="신청">
<input type="button" id="cancelBtn" value="취소">