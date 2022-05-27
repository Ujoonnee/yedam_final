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



<h3>예약내역 상세</h3><hr>

	<div class="row">
		<div class="col-2">예약번호</div>
		<div class="col">${detail.prodResNo}</div>
	</div>
	<div class="row">
		<div class="col-2">예약자 이름</div>
		<div class="col">${detail.member.name}</div>
	</div>
	<div class="row">
		<div class="col-2">결제일자</div>
		<div class="col">${detail.orderDate}</div>
	</div>
<hr>
<table class="table">
<thead>
	<tr>
		<th>썸네일</th>
		<th>상품명</th>
		<th>단품가격</th>
		<th>개수</th>
		<th>금액</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="list" items="${prodList}">
	<tr>
	<%--<td> <c:if test="${list.prodThumbnail eq null }"> 
            <h2> 
                없음
            </h2> 
    </c:if> <td> --%>
		<td><%-- ${list.prodThumbnail} --%></td>
		<td>${list.product.prodName}</td>
		<td>${list.product.price}</td>
		<td>${list.reservedProduct.count}개</td>
		<td>금액 : ${list.product.price * list.reservedProduct.count}</td>
	</tr>
	</c:forEach>
	</tbody>
	<tr>
		<td colspan="4"></td>
		<td colspan="3">총 금액 : ${detail.paymentAmt}</td>
	</tr>
</table>

<table>
	<tr>
		<td>매장이름</td>
		<td>${detail.store.name}</td>
	</tr>
	<tr>
		<td>예약 일시</td>
		<td>${detail.pickupTime} ${detail.pickupDate}</td>
	</tr>
	<tr>
		<td>연락처</td>
		<td>${detail.member.tel}</td>
	</tr>
</table> 
<div>
<h3>내 리뷰</h3>
	<ul>
		
			<li>${reviewList.serviceName }</li>
			<li>평점</li>
			<li>${reviewList.score }</li>
			<li>${reviewList.content }</li>
			<hr>
			<li>답변</li>
			<li>${reviewList.replyContent }</li>
			<hr>
			<hr>
		
	</ul>

</div>

<!-- 	모달 -->
<div>
<button type="button" class="btn btn-block btn-gray-800 mb-3" id="btnModal" >리뷰작성</button>
<button id="cancelRes" class="btn btn-block btn-gray-800 mb-3">예약취소</button>
</div>
<div id="reviewModal"></div>

<script type="text/javascript">

 btnModal.addEventListener("click", function(){
 
	 $("#reviewModal").load("${pageContext.request.contextPath}/review/rev_insert", function(){
 		const myModal = new bootstrap.Modal('#modal-default');
 		
 		myModal.show();
 		
 		//모달뜨고 나서 모달 안에 폼태그에 값 입력.
 		$("#category").val("${detail.category}");
 		$("#resNo").val("${detail.prodResNo}");
 		$("#serviceName").val("${detail.store.name}");
 		$("#pickupDate").html("${detail.pickupDate} ${detail.pickupTime}");
 		$("#serviceNameDiv").html("${detail.store.name}");
 		
 	})
 }) 


</script>


</body>
</html>