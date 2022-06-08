<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>exhibition register</title>

<div class="display-3">전시 등록 신청</div>
<hr>
<div align="center">
<div class="row justify-content-center" align="center" style="width:800px">
	<div class="col-10">
		<form id="frm" action="register" method="post" enctype="multipart/form-data">
			<table class="form-control">
				<colgroup>
					<col width="30%">
					<col width="50%">
					<col width="10%">
				</colgroup>
				<tr>
					<th>전시명</th>
					<td><input class="form-control mb-3 mt-3" name="name" style="width:200px" required value="test name"></td>
				</tr>
				<tr>
					<th>전시장명</th>
					<td><input class="form-control mb-3 mt-3" name="locationName" style="width:200px" required value="test locationName"></td>
				</tr>
				<tr>
					<th>티켓 가격</th>
					<td><input class="form-control mt-3 mb-3" name="price" style="width:100px" required value="100"></td>
				</tr>
				<tr>
					<th>전시 기간</th>
					<td class="input-group mt-3 me-2">
						<input style="height:40px" class="form-control datepicker-input" type="date" name="startDate" value="2022-05-11">  
							<p class="display-4 ms-1 me-1">&nbsp;~&nbsp;</p>
						<input style="height:40px" class="form-control datepicker-input" type="date" name="endDate" value="2022-05-18">
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<input class="mt-3 form-control" name="tel" placeholder="010-1234-5678" value="01012345678">
						<span class="mb-3">*미입력시 회원정보의 연락처로 자동 입력됩니다.</span>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<div class="row mt-4 justify-content-end">
							<input class="form-control col-6 me-1 ms-3" style="width:203px" id="zonecode" readonly="" required="" value="05696">
							<input class="col-4 me-3" type="button" id="postCodeBtn" value="우편번호 검색">
						</div> 
						<input class="form-control mt-2 mt-2" id="address" name="address" readonly required value="서울 송파구 가락로12길 5-6">
						<input class="form-control mt-2 mb-4" id="addressDetail" placeholder="상세주소 입력" value="test address">
					</td>
				</tr>
				<tr>
					<th>전시 설명</th>
					<td><textarea class="form-control" placeholder="에디터 적용예정" name="detail">test detail</textarea></td>
				</tr>
		
				<tr class="mb-5 mt-2">
					<th>썸네일</th>
					<td>
						<input id="fileUpload" class="mt-3 mb-3 form-control" type="file" name="fileUpload" style="width:250px">
					</td>
				</tr>
				
			</table>
			<hr>
			<div class="mt-3" align="right">
				<input class="btn btn-tertiary" type="button" id="submitBtn" value="신청">
				<input class="btn btn-tertiary" type="button" id="cancelBtn" value="취소">
			</div>
		</form>
	</div>
</div>
</div>

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
		
		if ($('#fileUpload').val() != '') {
			const address = $('#address').val() + ', ' + $('#addressDetail').val();
			$('#address').val(address);
			frm.submit();
		} else {
			alert('썸네일 이미지를 확인해 주세요.');
			
		}
	})
</script>