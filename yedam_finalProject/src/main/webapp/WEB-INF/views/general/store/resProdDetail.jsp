<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style> 
#star a{
   text-decoration: none;
   color: gray;
  }
  #star a.on{
   color: yellow;
  } 
	
</style>
</head>
<body>

<c:forEach var="d" items="${detail }">

<h3>예약내역 상세</h3><hr>
 <table>
	<tr>
		<td>예약번호</td>
		<td>${d.prodResNo}</td>
	</tr>
	<tr>
		<td>예약자 이름</td>
		<td>${d.member.name}</td>
	</tr>
	<tr>
		<td>결제일자</td>
		<td>${d.orderDate}</td>
	</tr>
</table><hr>
<table>
	<tr>
		<td>상품목록</td>
	</tr>
	<c:forEach var="list" items="${prodList}">
	<tr>
	<%--<td> <c:if test="${list.prodThumbnail eq null }"> 
            <h2> 
                없음
            </h2> 
    </c:if> <td> --%>
		<%-- <td>${list.prodThumbnail}</td> --%>
		<td>${list.product.prodName}</td>
		<td>${list.product.price}</td>
		<td>${list.reservedProduct.count}개</td>
		<td>금액 : ${list.product.price * list.reservedProduct.count}</td>
	</tr>
	</c:forEach>
	<tr>
		<td>총 금액</td>
		<td>${d.paymentAmt}</td>
	</tr>
</table><hr>
<table>
	<tr>
		<td>매장이름</td>
		<td>${d.store.name}</td>
	</tr>
	<tr>
		<td>예약 일시</td>
		<td>${d.pickupTime} ${d.pickupDate}</td>
	</tr>
	<tr>
		<td>연락처</td>
		<td>${d.member.tel}</td>
	</tr>
</table> 
<input type="hidden" value="${d.category}" id="category">

</c:forEach>
<!-- 	모달 -->
<button type="button" class="btn btn-block btn-gray-800 mb-3"   id="btnModal" >리뷰작성</button>
<div id="reviewModal"></div>

<button id="cancelRes">예약취소</button>

<!-- <div id="reviewLoad"></div> -->
<%-- ${review.score} --%>



<script type="text/javascript">

 btnModal.addEventListener("click", function(){
 	$("#reviewModal").load("${pageContext.request.contextPath}/member/rev_insert", function(){
 		const myModal = new bootstrap.Modal('#modal-default');
 		myModal.show();
 	})
 }) 
/*  
 function reviewLoad(){
	 $("#reviewLoad").html(${review.content})
 } */
	 
/* 
 function submitContents(){
    		oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD",[]);
    	}; */

</script>


</body>
</html>