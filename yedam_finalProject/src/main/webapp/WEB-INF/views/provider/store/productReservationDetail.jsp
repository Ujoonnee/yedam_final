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

<h3>상품 예약 상세</h3>

	<table class="table">
		<tr>
			<td>예약번호</td>
			<td>${proRe.prodResNo }</td>
		</tr>
		<tr>
			<td>예약자명</td>
			<td>${proRe.name }</td>
		</tr>
		<tr>
			<td>예약자 연락처</td>
			<td>${proRe.tel }</td>
		</tr>
		<tr>
			<td>픽업일시</td>
			<td><fmt:formatDate value="${proRe.pickupTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
		</tr>
		
	</table>
	<h3 class="mt-5"> 예약상품 상세</h3>
	<table class="table">
	<thead>
		<tr>
			<th>썸네일</th>
			<th>상품명</th>
			<th>가격</th>
			<th>수량</th>
			<th>금액</th>
		</tr>
	</thead>
		<c:set var="total" value="0"/>
		<tbody>
		<c:forEach items="${proReDetail }" var="list" varStatus="status">
		<tr>
			<td>${list.prodThumbnail }</td>
			<td>${list.prodName }</td>
 			<td><fmt:formatNumber value="${list.price }" pattern="#,###" /></td> 
			<td>${list.count }</td>
			<td><fmt:formatNumber value="${list.payment }" pattern="#,###"/> </td>
		</tr>
		<c:set var="total" value="${total + list.payment }"/>
		
		</c:forEach>
		</tbody>
		<tfoot>
		<tr>
			<td>총 금액</td>
			<td colspan="4"><fmt:formatNumber value="${total }" pattern="#,###"/></td>
		</tr>
		</tfoot>
	</table>
<!-- 	<button class="btn btn-primary" type="button" id="list_btn">목 록</button> -->
	<input class="btn btn-outline-primary" type="button" value="목록" onclick="history.go(-1)">
	<button class="btn btn-primary" >주문취소</button>
</body>
<script>
	$("#list_btn").click(function(){
		self.location = "/provider/proReSelectAll?"
	})
</script>
</html>