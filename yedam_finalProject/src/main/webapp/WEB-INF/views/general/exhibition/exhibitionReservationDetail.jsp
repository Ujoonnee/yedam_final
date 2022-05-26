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

<h2>내 예약 정보</h2>
	<table>
		<tr>
			<td>예약번호</td>
			<td>${exRes.exResNo }</td>
		</tr>
		<tr>
			<td>상태</td>
			<td>
				<c:set var="status" value="N"/>
					<c:choose>
						<c:when test="${exRes.paymentStatus eq 'N' }">
							취소
						</c:when>
						
						<c:when test="${exRes.paymentStatus eq 'Y' }">
							결제
						</c:when>
				
					</c:choose>
				
			</td>
		</tr>
		<tr>
			<td>카테고리</td>
			<td>
				<c:set var="category" value="00202"/>
					<c:if test="${exRes.category eq '00202' }">
						전시
					</c:if>
			</td>
		</tr>
		<tr>
			<td>전시명</td>
			<td>${exRes.name }</td>
		</tr>
		<tr>
			<td>오픈일</td>
			<td><fmt:formatDate value="${exRes.startDate }" pattern="yyyy-MM-dd"/></td>
		</tr>
		<tr>
			<td>마감일</td>
			<td><fmt:formatDate value="${exRes.endDate }" pattern="yyyy-MM-dd"/></td>
		</tr>
		<tr>
			<td>예약자명</td>
			<td>${exRes.memName }</td>
		</tr>
		<tr>
			<td>예약일시</td>
			<td><fmt:formatDate value="${exRes.exDate }" pattern="yyyy-MM-dd"/></td>
		</tr>
		<tr>
			<td>예약자 연락처</td>
			<td>${exRes.memTel }</td>
		</tr>
		<tr>
			<td>수량</td>
			<td>${exRes.amount }</td>
		</tr>
		<tr>
			<td>결제금액</td>
			<td>${exRes.payment }</td>
		</tr>
	</table>
	<hr>
	<c:if test="${exRes.paymentStatus eq 'Y' }">
	<button>예약취소</button><button>리뷰작성</button>
	</c:if>
</body>
</html>