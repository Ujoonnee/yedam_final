<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>exhibition register</title>

<h1>전시 등록 신청</h1>

<form id="frm" action="register" method="post" enctype="multipart/form-data">
	<table border="1" class="form-control">
		<colgroup>
			<col>
			<col width="500px">
		</colgroup>
		<tr>
			<th>카테고리</th>
			<td class="mb-3">전시</td>
		</tr>
		<tr>
			<th>전시명</th>
			<td><input class="form-control mb-3" name="name" required value="test name"></td>
		</tr>
		<tr>
			<th>전시장명</th>
			<td><input class="form-control mb-3" name="locationName" required value="test locationName"></td>
		</tr>
		<tr>
			<th>티켓 가격</th>
			<td><input class="form-control mb-3" name="price" required value="100"></td>
		</tr>
		<tr class="mb-3">
			<th>썸네일</th>
			<td>
				<input class="ms- mt-3 mb-3 form-control" type="file" name="fileUpload">
			</td>
		</tr>
		<tr>
			<th>전시 기간</th>
			<td class="input-group">
				<input class="ms-3 form-control datepicker-input" type="date" name="startDate" value="2022-05-11">  
					<p class="display-4">&nbsp;~&nbsp;</p>
				<input class="form-control datepicker-input" type="date" name="endDate" value="2022-05-18">
			</td>
		</tr>
		<tr class="mb-3">
			<th>연락처</th>
			<td>
				<input class="mt-3 form-control" name="tel" placeholder="010-1234-5678" value="01012345678">
				<span>*미입력시 회원정보의 연락처로 자동 입력됩니다.</span>
			</td>
		</tr>
		
		<tr>
			<th>주소</th>
			<td>
				<div class="row">
					&nbsp;&nbsp;&nbsp;<input class="form-control col-6" style="width:300px" class="form-control" id="zonecode" readonly required value="05696"> <input class="col-3 btn btn-sm btn-primary" type="button" id="postCodeBtn" value="우편번호 검색">
				</div> 
				<input class="form-control mt-2 mt-2" id="address" name="address" readonly required value="서울 송파구 가락로12길 5-6">
				<input class="form-control mt-2 mb-2" id="addressDetail" placeholder="상세주소 입력" value="test address">
			</td>
		</tr>
		<tr>
			<th>전시 설명</th>
			<td><textarea class="form-control" placeholder="에디터 적용예정" name="detail">test detail</textarea></td>
		</tr>
	</table>
	<div class="mt-3" align="right">
		<input class="btn btn-tertiary" type="button" id="submitBtn" value="신청">
		<input class="btn btn-tertiary" type="button" id="cancelBtn" value="취소">
	</div>
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