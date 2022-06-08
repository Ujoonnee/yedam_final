<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>exhibition registration list</title>
<div class="row justify-content-center">
	<div class="col-8">
		<div class="display-4">전시 등록 신청 목록</div>
		<hr>
		<c:if test = "${empty list }">
			<h3>신청목록이 없습니다.</h3>
		</c:if>
		
		
		<div class="card border-0 shadow mb-4">
						<div class="card-body">
							<div >
								<c:if test = "${not empty list }">
								<table class="table table-centered table-nowrap mb-0 rounded">
									<thead class="thead-light">
										<tr class="border-0 rounded-start">
											<th class="border-0 rounded-start">전시번호</th>
											<th class="border-0">전시명</th>
											<th class="border-0">전시기간</th>
											<th class="border-0">신청일</th>
											<th class="border-0 rounded-end">승인여부</th>
										</tr>
									</thead>
									<tbody>
											<c:forEach items="${list }" var="ex">
												<tr class="link">
													<td>${ex.exNo }</td>
													<td>${ex.name }</td>
													<td>
														${ex.startDate } <br>
														 ~ ${ex.endDate }
													</td>
													<td>${ex.applicationDate}</td>
													<td>${ex.approvalStatus }</td>
												</tr>
											</c:forEach>
									</tbody>
								</table>
							</c:if>
						</div>
					</div>
				</div>
				<hr>
				<div align="right">
					<input type="button" id="registerBtn" class="btn btn-tertiary" value="신청하기">
				</div>
	</div>
</div>
<script>
	$('.link').on('click', function() {
		location.href = 'registration/' + this.children[0].innerText;
	})
	
	$('#registerBtn').on('click', () => {
		location.href = 'register';
	})
</script>