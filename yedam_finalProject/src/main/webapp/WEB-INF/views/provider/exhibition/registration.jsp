<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>exhibition regisdlation detail</title>

<div class="row justify-content-center" align="center" >
	<div class="col-6" align="left">
<div class="display-4">전시 등록 신청 상세</div>
<hr>
			<div class="form-control ms-1" style="width:800px;">
				<div class="display-4">${exhibition.name }</div>			
					<hr>
						<div class="row mb-2">
								<div class="col-6"><img style="width:382px; height:314px;" src="/exhibition/${exhibition.thumbnail }" alt=""></div>
								<div class="vr ms-2" style="padding-left: 1px; padding-right: 1px;"></div>
						<div class="col-5 ms-2">
			
							<dl class="mb-3">
								<dt class="display-5">전시장명</dt>
								<dd>${exhibition.locationName }</dd>
							</dl>
							
							<dl class="mb-4">
								<dt class="display-5">티켓 가격</dt>
								<dd>${exhibition.price }</dd>
							</dl>
							
							<dl class="mb-4">
								<dt class="display-5">전시 기간</dt>
								<dd >${exhibition.startDate }
									~ ${exhibition.endDate}</dd>
							</dl>
							
							<dl class="mb-3">
								<dt class="display-5">연락처</dt>
								<dd>${exhibition.tel }</dd>
							</dl>
							<dl class="mb-2">
								<dt class="display-5">주소</dt>
								<dd>${exhibition.address }</dd>
							</dl>
						</div>
					</div>
							<dl><dd>&nbsp;</dd></dl>
					<hr>
					<div align="left">
						<dl style="widdt:400px;" class="mb-2">
							<dt class="col-3 display-5">전시 설명</dt>
							<dd class="col-6 ms-2">${exhibition.detail }</dd>
						</dl>
					</div>
				</div>
			<div class="mt-3" align="right">
					<input type="button" id="listBtn" class="btn btn-tertiary" value="목록">
			</div>
		</div>
	</div>
<script>
	$('#listBtn').on('click', () => history.back() );
</script>