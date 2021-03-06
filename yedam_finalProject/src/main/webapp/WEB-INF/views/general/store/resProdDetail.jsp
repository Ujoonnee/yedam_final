<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
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
	.thumbNail {
	width:150px;
	height:150px;}
</style>
</head>
<body>



<h3>예약내역 상세</h3>
<div class="row justify-content-left" align=left >
	<div>
		<div class="col-6 form-control" style="width:80%">
			<table class="table-info">
				<colgroup>
					<col>
					<col width="500px">
				</colgroup>
				<tr><td>&nbsp;</td></tr>
				<tr style="width:450px"class="row mb-2">
					<th class="col-3">예약번호</th>
					<td class="col-6"><div class="col" id="prodResNo">${detail.prodResNo}</div></td>
				</tr>
				<tr class="row mb-2">
					<th class="col-3">예약자 이름</th>
					<td class="col-6">${detail.member.name}</td>
				</tr>
				<tr class="row mb-2">
					<th class="col-3">결제일자</th>
					<td class="col-6">${detail.orderDate}</td>
				</tr>
				<tr class="row mb-2">
					<th class="col-3">매장이름</th>
					<td class="col-6">${detail.store.name}</td>
				</tr> 
				<tr class="row mb-2">
					<th class="col-3">픽업 예정 일시</th>
					<td class="col-6"><fmt:formatDate value="${detail.pickupDate}" dateStyle="full"/><br>
					<fmt:formatDate value="${detail.pickupTime}" type="time"/> </td>
				</tr>
				<tr class="row mb-2">
					<th class="col-3">연락처</th>
					<td class="col-6">${detail.member.tel}</td>
				</tr>
			</table> 
		</div>
	</div>
</div>
<h3>상품 목록</h3>
<div class="row justify-content-left" align=left >
	<div>
		<div class="col-6 form-control" style="width:80%">
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

					<tr class="product" valign="middle" >
						<td class="thumbNail"><img src="/img/${list.product.prodThumbnail}"> </td>
						<td>${list.product.prodName}</td>
						<td><fmt:formatNumber value="${list.product.price}" pattern="#,###"/> 원 </td>
						<td>${list.reservedProduct.count}개</td>
						<td><fmt:formatNumber value="${list.product.price * list.reservedProduct.count}" pattern="#,###"/> 원</td>
						<td style="display:none">${list.product.prodNo}</td>
					</tr>
					</c:forEach>
				</tbody>
					<tr>
						<td colspan="4"></td>
						<td colspan="3">총 금액 : <fmt:formatNumber value="${detail.paymentAmt}" pattern="#,###"/> 원</td>
					</tr>
			</table>
		</div>
	</div>
</div>

<h3>내 리뷰</h3>
<div class="row justify-content-left" align=left >
	<div>
		<div class="col-6 form-control" style="width:80%">
			<c:if test="${not empty review}">
			<div>
				<div style="display:none">${review.serviceName }</div>
				<span>평점(${review.score })</span><span id="vscore">${review.score }</span>
				<div>${review.content }</div>
				<hr>
				<div>답변</div>
				<div>${review.replyContent }</div>
			</div>
			</c:if>
		</div>
	</div>
</div>

<!-- 	모달 -->
<div>
<!-- css적용 -->

<!-- css적용 -->

<input class="btn btn-block btn-outline-gray-800 mb-3" type="button" value="목록" onclick="location.href='../resProdList'">




<jsp:useBean id="now" class="java.util.Date"/>
<%-- <fmt:formatDate value="${now }" pattern="yyyy-MM-dd" var="today"/> --%>
<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="false" var="today"></fmt:parseNumber>
<fmt:parseNumber value="${detail.pickupDate.time / (1000*60*60*24)}" integerOnly="false" var="pickupDate"></fmt:parseNumber>

<!-- 리뷰 작성안했다면 작성버튼 show. -->
<c:if test="${detail.pickupStatus eq 'Y'}"> 
<c:if test="${empty review}" >
<button type="button" class="btn btn-block btn-gray-800 mb-3" id="btnModal" >리뷰작성</button>
</c:if>
</c:if>

<!-- 픽업상태 'N'이면 예약취소 버튼 show -->


<c:if test="${today - pickupDate <= 1 }">

	<c:if test="${detail.pickupStatus eq 'N' }">
	<button type="button" class="btn btn-block btn-gray-800 mb-3" data-bs-toggle="modal" data-bs-target="#modal-form" id>예약취소</button>
		<div class="modal fade" id="modal-form" tabindex="-1" aria-labelledby="modal-form" style="display: none;" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-body p-0">
						<div class="card p-lg-4">
								<button type="button" class="btn-close ms-auto" data-bs-dismiss="modal" aria-label="Close"></button>
								<form action="" class="" name="cancel">
									<div class="form-group">
										<div class="form-group mb-4">
											<label for="password">예약을 취소하려면 비밀번호를 입력하세요.</label>
											<div class="input-group">
												<span class="input-group-text" id="basic-addon2">
													<svg class="icon icon-xs text-gray-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
														<path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"></path>
													</svg> 
												</span>
												<input type="password" placeholder="비밀번호를 입력하세요." class="form-control" id="password12" required="">
											</div>
										</div>
										
									</div>
									<div class="d-grid">
										<button type="submit" id = "pwCheck" class="btn btn-gray-800">확 인</button>
									</div>
								</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
</c:if>
<!--리뷰작성하면 show, 답변아직 안달리면 리뷰수정가능-->
<c:if test="${not empty review }" >
<c:if test="${empty review.replyContent}">
<button type="button" class="btn btn-block btn-gray-800 mb-3" id="btnModalUpd" onclick=reviewUpd() >리뷰수정</button>

<button type="submit"  class="btn btn-block btn-gray-800 mb-3 delBtn" value="${review.revNo }">삭 제</button>
</c:if>
</c:if>




</div>

<div id="reviewModal"></div>
<div></div>
<script type="text/javascript">

	//평점 ★로 출력하기
	var score = $("#vscore").html();
	var space ="";
	
	for(var i=0; i<score; i++){
		space = space + "★";
	} 
	
	$("#vscore").html(space)
	
	//상품번호 배열에 담아서 넘기기.
		var prodNo = []
		<c:forEach items="${prodList}" var="list">
		
			prodNo.push(${list.product.prodNo})
			
		</c:forEach>
					console.log(prodNo)
	
	//예약취소(비밀번호입력)
	console.log(${detail.store.storeNo});
	 $("#resCancel").on("click", function(){
		 /* console.log("매장번호 : " +${detail.store.storeNo}) */
		 if(confirm("예약을 취소하시겠습니까?")){
			var text = prompt("비밀번호를 입력하세요.");
			if(text==${user.password}){
				$.ajax({
					url:"cancel/"+${detail.prodResNo},
					method:"POST",
					data:{
						storeNo : ${detail.store.storeNo},
						prodNo : prodNo
					},
					success: function(data){
						alert("예약이 취소되었습니다.");
						location.href="${pageContext.request.contextPath}/store/resProdList"
					},
					error : function(){
						alert("에러");
					}
				})
			}else{
				return alert("비밀번호가 틀립니다.");
			}
		}else{
			return alert("취소.");
		} 
	 }); 
	
	
	//리뷰모달 띄우기
	$('#btnModal').on("click", function(){
	 
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
	 });
	 
	
	 //리뷰수정 버튼 클릭시 모달띄우기
		function reviewUpd(){
		 
		var revNo = ${review.revNo}
		//등록된 리뷰내용 불러오기.
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
		 
	 	};

	
	 
	$(document).on('click', '.delBtn', function(e){
		e.preventDefault();
		let replyId = $(this).attr("href");
		
		$.ajax({
			url : '${pageContext.request.contextPath}/store/delete',
			method : 'POST',
			data : {
				revNo : '${review.revNo}'
			},
			success : () => location.reload()
		});
	});

	

</script>


</body>
</html>