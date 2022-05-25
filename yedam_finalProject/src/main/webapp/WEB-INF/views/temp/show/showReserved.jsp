<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




	<table>
		<thead>
			<tr>
				<th>예약번호</th>
				<th>예약자명</th>
				<th>예약일시</th>
				<th>수량</th>
				<th>금액</th>
				<th>결제여부</th>
				<th>리뷰</th>
				
			</tr>
			
		</thead>
	
		<tbody>
		
		
			<c:forEach items="${seat }" var="show">
				<tr class="list">
					<td>${seat.showResNo }</td>
					<td>${show.showNo }</td>
					<td>${show.name }</td>
					<td>${show.startDate }</td>
					<td>
						<c:set var="status" value="00401"/>
							<c:choose>
								
								<c:when test="${show.approvalStatus eq '00401' }">
								진행중
								</c:when>

								<c:when test="${show.approvalStatus eq '00402' }">
								승인거절
								</c:when>

								<c:otherwise>
								승인대기
								</c:otherwise>
							
							</c:choose>
					</td>
					<td></td>
				</tr>

			</c:forEach>
		
		</tbody>

	</table>


</body>
</html>