<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>exhibition registration detail</title>

<h1>전시 등록 신청 상세</h1>
<div class="row justify-content-center" align="center" >
	<div>
		<div class="col-6 form-control" style="width:500px">
			<table>
				<colgroup>
					<col>
					<col width="500px">
				</colgroup>
				<tr><td>&nbsp;</td></tr>
				<tr style="width:400px"class="row mb-2">
					<th class="col-3">카테고리</th>
					<td class="col-6">전시</td>
				</tr>
				<tr style="width:400px"class="row mb-2">
					<th class="col-3">전시명</th>
					<td class="col-3">${exhibition.name }</td>
				</tr>
				<tr class="row mb-2">
					<th class="col-3">전시장명</th>
					<td class="col-6">${exhibition.locationName }</td>
				</tr>
				<tr class="row mb-2">
					<th class="col-3">티켓 가격</th>
					<td class="col-6">${exhibition.price }</td>
				</tr>
				<tr class="row mb-2">
					<th class="col-3">썸네일</th>
					<td class="col-6">
					<img width="300px" src="https://sunstat.com/wp-content/uploads/2019/01/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C-%EB%B0%B0%EA%B2%BD%EC%9D%B4%EB%AF%B8%EC%A7%80.png" alt="thumbnail preview">
					</td>
				</tr>
				<tr style="width:400px;" class="row mb-2">
					<th class="col-3">전시 기간</th>
					<td class="col-6">${exhibition.startDate }
						~ ${exhibition.endDate}</td>
				</tr>
				<tr style="width:400px;" class="row mb-2">
					<th class="col-3">연락처</th>
					<td class="col-6">${exhibition.tel }</td>
				</tr>
				<tr style="width:400px;" class="row mb-2">
					<th class="col-3">주소</th>
					<td class="col-6">${exhibition.address }</td>
				</tr>
				<tr style="width:400px;" class="row mb-2">
					<th class="col-3">전시 설명</th>
					<td class="col-6">${exhibition.detail }</td>
				</tr>
				<tr><td>&nbsp;</td></tr>
			</table>
		</div>
			<div class="mt-3" style="width:500px;" align="right">
				<input type="button" id="listBtn" class="btn btn-tertiary" value="목록">
			</div>
	</div>
</div>
<script>
	$('#listBtn').on('click', () => history.back() );
</script>