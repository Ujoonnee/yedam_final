<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row justify-content-center">
	<div class="col-8">
		<h1>내 전시 예약자 목록</h1>
		<hr>
		<div class="card border-0 shadow mb-4">
			<div class="card-body">
				<div class="table-responsive">
					<form id="frm" method="get">
						<table>
							<c:if test = "${empty list }">
								<tr><th>예약이 없습니다.</th></tr>
							</c:if>
							<c:if test = "${not empty list }">
								<table class="table table-centered table-nowrap mb-0 rounded">
									<thead class="thead-light">
										<tr class="border-0 rounded-start">
											<th class="border-0 rounded-start">전시예약번호</th>
											<th class="border-0">전시번호</th>
											<th class="border-0">전시기간</th>
											<th class="border-0 rounded-end">결제상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list }" var="res">
										<tr onclick="getReservation(${res.exResNo})">
											<td>${res.exResNo }</td>
											<td>${res.exNo }</td>
											<td>${res.exDate }</td>
											<c:if test = "${res.paymentStatus == 'N' }">
												<td>결제대기</td>
											</c:if>
											<c:if test = "${res.paymentStatus == 'Y' }">
												<td>결제완료</td>
											</c:if>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	function getReservation(exResNo) {
		frm.action = 'reservation/' + exResNo;
		frm.submit();
	}
</script>
<%-- 				<c:if test = "${not empty list }"> --%>
<%-- 					<c:forEach items="${list }" var = "res" > --%>
<%-- 					<tr onclick="getReservation(${res.exResNo})"> --%>
<%-- 						<td>${res.exResNo }</td> --%>
<%-- 						<td>${res.exNo }</td> --%>
<%-- 						<td>${res.exDate }</td> --%>
<%-- 						<c:if test = "${res.paymentStatus == 'N' }"> --%>
<!-- 							<td>결제대기</td> -->
<%-- 						</c:if> --%>
<%-- 						<c:if test = "${res.paymentStatus == 'Y' }"> --%>
<!-- 							<td>결제완료</td> -->
<%-- 						</c:if> --%>
<!-- 					</tr> -->
<%-- 					</c:forEach> --%>
<%-- 				</c:if> --%>
</body>
</html>