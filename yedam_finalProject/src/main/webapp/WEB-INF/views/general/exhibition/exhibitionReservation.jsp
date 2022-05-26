<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>내 예약 정보</h3>

	<form name="frm" method="get" action="">
			<label class="hidden"></label>
				<select id="searchCondition" name="searchCondition">
					<option value="none">전체</option>
					<option value="show_no">전시등록번호</option>
					<option value="name">전시명</option>
				</select>
			<label></label>	
				<input type="text" id="searchKeyword" name="searchKeyword" />
				<input type="submit" value="검색">
	
	

	</form>

	<table>
		<thead>
			<tr>
				<th>예약번호</th>
				<th>전시명</th>
				<th>전시일</th>
				<th>결제여부</th>
				<th>금액</th>
				<th>리뷰</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${exhibitionReservationVO }" var="exRes">
				<tr class="list">
				
					<td>${exRes.exResNo }</td>
					<td>
					<a href="exhibitionReservationDetail?exResNo=${exRes.exResNo}">${exRes.name }	</a>
					
						<!--<c:out value="${exRes.name }"/> -->
					
					</td>
					<td><fmt:formatDate value="${exRes.startDate }" pattern="yyyy-MM-dd"/></td>
					<td>
						<c:set var="status" value="N"/>
							<c:choose>
								<c:when test="${exRes.paymentStatus eq 'N' }">
									미결제
								</c:when>
								
								<c:when test="${exRes.paymentStatus eq 'Y' }">
									결제
								</c:when>
								
								<c:otherwise>
									취소
								</c:otherwise>
							</c:choose>
					
					</td>
					<td>${exRes.payment }</td>
					<td><button>리뷰작성</button></td>
				</tr>
			
			</c:forEach>
		</tbody>
	</table>
</body>
</html>