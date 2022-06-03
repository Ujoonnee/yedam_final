<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>전시목록</h2>
<hr>
<div class="row justify-content-center">
	<div class="col-10">
		<div>
			<form id="frm" method="post">
				<div class="card border-0 shadow mb-4">
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-centered table-nowrap mb-0 rounded">
								<c:if test = "${empty list }">
									<tr><th>전시가 없습니다.</th></tr>
								</c:if>
								<c:if test = "${not empty list }">
								<thead class="thead-light">
									<tr class="border-0 rounded-start">
										<th class="border-0 rounded-start">전시번호</th>
										<th class="border-0">전시명</th>
										<th class="border-0">시작일자</th>
										<th class="border-0">종료일자</th>
										<th class="border-0 rounded-end">주소</th>		
									</tr>
								</thead>
									<c:forEach items="${list }" var = "ex" >
									<tr onclick="getReservationList(${ex.exNo})">
										<td>${ex.exNo }</td>
										<td>${ex.name }</td>
										<td>${ex.startDate }</td>
										<td>${ex.endDate }</td>
										<td>${ex.address }</td>
									</tr>
									</c:forEach>
								</c:if>
							</table>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script>

	function getReservationList(exNo) {
		frm.action = exNo +'/reservation';
		frm.submit();
	}
</script>
</body>
</html>