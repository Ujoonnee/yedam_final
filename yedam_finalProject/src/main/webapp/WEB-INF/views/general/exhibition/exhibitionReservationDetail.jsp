<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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



	<div id="reviewModal"></div>
	
	<!-- 리뷰 작성안했다면 작성버튼 show. -->
<%-- <c:if test="${exRes.paymentStatus eq 'Y' }"> --%>
<c:if test="${empty reviewList}" >
<button type="button" class="btn btn-block btn-gray-800 mb-3" id="btnModal" >리뷰작성</button>
</c:if>
<%-- </c:if> --%>

<!-- 픽업상태 'N'이면 예약취소 버튼 show -->
<c:if test="${exRes.paymentStatus eq 'Y' }">
<button type="button" class="btn btn-block btn-gray-800 mb-3" id="resCancel">예약취소</button>
</c:if>

<!--수정버튼은 상의 필요...  -->
<c:if test="${not empty reviewList}" >
<button type="button" class="btn btn-block btn-gray-800 mb-3" id="btnModalUpd" onclick=reviewUpd() >리뷰수정</button>

<button type="submit"  class="btn btn-block btn-gray-800 mb-3 delBtn" value="${reviewList.revNo }">삭 제</button>

</c:if>

<hr>
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
	
<script type="text/javascript">
	//리뷰모달 띄우기
	$('#btnModal').on("click", function(){
	 
		 $("#reviewModal").load("${pageContext.request.contextPath}/review/rev_insert", function(){
	 		const myModal = new bootstrap.Modal('#modal-default');
	 		
	 		myModal.show();
	 		
	 		//모달뜨고 나서 모달 안에 폼태그에 값 입력.
	 		$("#category").val("${exRes.category}");
	 		$("#resNo").val("${exRes.exResNo}");
	 		$("#serviceName").val("${exRes.name}");
	 		$("#resDate").html("${exRes.exDate}");
	 		$("#serviceNameDiv").html("${exRes.name}");
	 		
	 	})
	 });
	//평점 ★로 출력하기
	var score = $("#vscore").html();
	var space ="";
	
	for(var i=0; i<score; i++){
		space = space + "★";
	} 
	
	$("#vscore").html(space)

	
	//예약취소(비밀번호입력)
	console.log(${detail.store.storeNo});
	 $("#resCancel").on("click", function(){
		
		 if(confirm("예약을 취소하시겠습니까?")){
			var text = prompt("비밀번호를 입력하세요.");
			if(text==${user.password}){
				
				$.ajax({
					url:"../cancel",
					method:"POST",
					data:{
						exResNo : ${exRes.exResNo },
					},
					success: function(){
						alert("성공");
						location.href="${pageContext.request.contextPath}/exhibition/exSelectAllReservation"
					}
				})
				
				
			/* location.href="cancel/"+${detail.prodResNo}; */
			}else{
				return alert("비밀번호가 틀립니다.");
			}
		}else{
			return alert("취소되었습니다.");
		} 
	 }); 
	

	
	 
	
	 //리뷰수정 버튼 클릭시 모달띄우기
		function reviewUpd(){
		 
		var revNo = ${reviewList.revNo}
		 $("#reviewModal").load("${pageContext.request.contextPath}/review/rev_update/"+revNo, function(){
		 		const myModal = new bootstrap.Modal('#modal-default');
		 		
		 		myModal.show();
		 		
		 		//모달뜨고 나서 모달 안에 폼태그에 값 입력.
		 		$("#category").val("${exRes.category}");
		 		$("#resNo").val("${exRes.exResNo}");
		 		$("#serviceName").val("${exRes.name}");
		 		$("#resDate").html("${exRes.exDate}");
		 		$("#serviceNameDiv").html("${exRes.name}");
		 		
		 	})
		 
	 	};

	
	 
		$(document).on('click', '.delBtn', function(e){
			e.preventDefault();
			let replyId = $(this).attr("href");
			
			$.ajax({
				url : '${pageContext.request.contextPath}/store/delete',
				method : 'POST',
				data : {
					revNo : '${reviewList.revNo}'
				},
				success : () => location.reload()
			});
		});

	
	
	
</script>
</body>
</html>