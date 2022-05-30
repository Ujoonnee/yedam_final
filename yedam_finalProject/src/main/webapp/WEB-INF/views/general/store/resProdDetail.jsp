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
  #vscore {
   color: red;
  } 
	
</style>
</head>
<body>



<h3>예약내역 상세</h3><hr>

	<div class="row">
		<div class="col-2">예약번호</div>
		<div class="col" id="prodResNo">${detail.prodResNo}</div>
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
		<td>${list.product.prodThumbnail}</td>
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
<c:if test="${not empty reviewList}">
<div>
<h3>내 리뷰</h3>
			<div>${reviewList.serviceName }</div>
			<hr>
			<span>평점(${reviewList.score })</span><span id="vscore">${reviewList.score }</span>
			<div>${reviewList.content }</div>
			<hr>
			<div>답변</div>
			<div>${reviewList.replyContent }</div>
			<hr>
</div>
</c:if>
<!-- 	모달 -->
<div>

<input class="btn btn-block btn-outline-gray-800 mb-3" type="button" value="목록" onclick="history.go(-1)">

<!-- 리뷰 작성안했다면 작성버튼 show. -->
<c:if test="${detail.pickupStatus eq 'Y'}"> 
<c:if test="${empty reviewList}" >
<button type="button" class="btn btn-block btn-gray-800 mb-3" id="btnModal" >리뷰작성</button>
</c:if>
</c:if>

<!-- 픽업상태 'N'이면 예약취소 버튼 show -->
<c:if test="${detail.pickupStatus eq 'N'}"> 
<button type="button" class="btn btn-block btn-gray-800 mb-3" id="resCancel">예약취소</button>
</c:if>

<!--수정버튼은 상의 필요...  -->
<c:if test="${not empty reviewList}" >
<button type="button" class="btn btn-block btn-gray-800 mb-3" id="btnModalUpd" >리뷰수정</button>

<button type="submit"  class="btn btn-block btn-gray-800 mb-3 delBtn" value="${reviewList.revNo }">삭 제</button>

</c:if>


<!-- hong -->
<%-- <c:if test="${user.memNo == memNo}"> --%>
	
<%-- </c:if> --%>



</div>

<div id="reviewModal"></div>

<script type="text/javascript">

	//평점 ★로 출력하기
	var score = $("#vscore").html();
	var space ="";
	
	for(var i=0; i<score; i++){
		space = space + "★";
	} 
	
	$("#vscore").html(space)
	
	//예약취소(비밀번호입력)
	 $("#resCancel").on("click", function(){

		 if(confirm("예약을 취소하시겠습니까?")){
			var text = prompt("비밀번호를 입력하세요.");
			
			if(text==${user.password}){
				
			location.href="cancel/"+${detail.prodResNo};
			
			}else{
				return alert("비밀번호가 틀립니다.");
			}
			
		}else{
			return alert("취소되었습니다.");
		} 
	 }); 

	//리뷰모달 띄우기
	<%-- btnModal.addEventListener("click", function(){
	 
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
	 }) --%>
	 //리뷰수정 버튼 클릭시 모달띄우기
	 /* $("#btnModalUpd").on("click", function(){
		 if(${reviewList.revNo}!=null){
		 
		var revNo = ${reviewList.revNo};
		 $("#reviewModal").load("${pageContext.request.contextPath}/review/rev_update/"+revNo, function(){
		 		const myModal = new bootstrap.Modal('#modal-default');
		 		
		 		myModal.show();
		 		
		 		//모달뜨고 나서 모달 안에 폼태그에 값 입력.
		 		$("#category").val("${detail.category}");
		 		$("#resNo").val("${detail.prodResNo}");
		 		$("#serviceName").val("${detail.store.name}");
		 		$("#pickupDate").html("${detail.pickupDate} ${detail.pickupTime}");
		 		$("#serviceNameDiv").html("${detail.store.name}");
		 		
		 	})
		 }
	 }) */
	
	 
	$(document).on('click', '.delBtn', function(e){
		e.preventDefault();
		let replyId = $(this).attr("href");
		
		$.ajax({
			data : {
				replyId : replyId,
				revNo : '${reviewList.revNo}'
			},
			url : '/delete',
			type : 'POST',
			success : function(result){
					alert('삭제가 되었습니다.')
			}
		});
	});

	

</script>


</body>
</html>