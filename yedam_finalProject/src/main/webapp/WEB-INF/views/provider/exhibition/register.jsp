<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>exhibition register</title>

<h1>전시 등록 신청</h1>

<form id="frm" action="provider/register" method="post">
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
			<td><input name="name" required value="test name"></td>
		</tr>
		<tr>
			<th>전시장명</th>
			<td><input name="locationName" required value="test locationName"></td>
		</tr>
		<tr>
			<th>티켓 가격</th>
			<td><input name="price" required value="100"></td>
		</tr>
		<tr>
			<th>썸네일</th>
			<td>
				<div>
					<img src="resources/img/thumbnail.jpg" alt="thumbnail preview">
				</div>
				<input type="file" name="thumbnail">
			</td>
		</tr>
		<tr>
			<th>전시 기간</th>
			<td>
				<input type="date" name="startDate" value="2022-05-11"> ~ 
				<input type="date" name="endDate" value="2022-05-18">
			</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>
				<input name="tel" placeholder="010-1234-5678" value="01012345678"> <br>
				<span>*미입력시 회원정보의 연락처로 자동 입력됩니다.</span>
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input id="zonecode" readonly required value="05696"> <input type="button" id="postCodeBtn" value="우편번호 검색"> <br>
				<input id="address" name="address" readonly required value="서울 송파구 가락로12길 5-6"> <br>
				<input id="addressDetail" placeholder="상세주소 입력" value="test address">
			</td>
		</tr>
		<tr>
			<th>전시 설명</th>
			<td><textarea placeholder="에디터 적용예정" name="detail">test detail</textarea></td>
		</tr>
	</table>
	
	<input type="button" id="submitBtn" value="신청">
	<input type="button" id="cancelBtn" value="취소">
</form>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>

	// 주소검색 api
	function locationSearch() {
		new daum.Postcode({
			oncomplete : function(data) {
				$('#zonecode').val(data.zonecode);
				$('#address').val(data.address);
			}
		}).open();
	}
	
	$('#postCodeBtn').on('click', locationSearch);
	
	
	// 등록신청
	$('#submitBtn').on('click', () => {
		const address = $('#address').val() + ', ' + $('#addressDetail').val();
		$('#address').val(address);
		
		frm.submit();
	})
</script>