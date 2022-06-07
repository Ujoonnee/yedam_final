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

<div class="row justify-content-center">
	<div class="col-6">
		<h3>상품 예약 상세</h3>
			<div class="card border-0 shadow mb-4">
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-centered table-nowrap mb-0 rounded" id="boardtable">
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
					</div>
				</div>
			</div>
			<h3 class="mt-5"> 상품 목록</h3>
			<div class="card border-0 shadow mb-4">
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-centered table-nowrap mb-0 rounded" id="boardtable">
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
					</div>
				</div>
			</div>
		<!-- 	<button class="btn btn-primary" type="button" id="list_btn">목 록</button> -->
			<input class="btn btn-outline-primary" type="button" value="목록" onclick="location.href='proReSelectAll'">
			
			<!-- 결제취소하면 버튼 안보이기 -->
			<c:if test="${proRe.paymentStatus eq 'Y'}">
			
			<!-- 픽업상태 N이면 버튼 보이기 -->
			<c:if test="${pickupStatus.pickupStatus eq 'N' }">
			<button class="btn btn-primary" id="cancelRes">주문취소</button>
			<button id="pickupComplete" class="btn btn-primary" >픽업완료처리</button>
			</c:if>
			</c:if>
			<!-- 리뷰보기/답변달기 -->
			<c:if test="${not empty reviewList}">
		<div>
		<br>
		<br>
		<br>
		<h3>리뷰/답변</h3>
					<div>${reviewList.serviceName }</div>
					<hr>
					<span>평점(${reviewList.score })</span><span id="vscore">${reviewList.score }</span>
					<div>${reviewList.content }</div>
					<hr>
					<div>답변</div>
					<div>${reviewList.replyContent }</div>
					<hr>
					
					<c:if test="${empty reviewList.replyContent  }">
					<button type="button" id="replyWrite" class="btn btn-sm btn-primary">답변작성하기</button>
		
					<div id="replyWriteDiv" style="display:none">
						<form id="replyFrm" action="${pageContext.request.contextPath}/review/replyInsert" method="post">
						<input type="hidden" name="prodResNo" value="${proRe.prodResNo }">
						<textarea rows="10" style=width:100% id="replyContent" name="replyContent"></textarea>
						</form>
						<div align="right"><button onclick="replySend()" class="btn btn-sm btn-primary">답변등록</button></div>
					</div>
					</c:if>
					
			</div>
		</c:if>
	</div>
</div>

</body>
<script>
//평점 ★로 출력하기
	var score = $("#vscore").html();
	var space ="";
	
	for(var i=0; i<score; i++){
		space = space + "★";
	} 
	
	$("#vscore").html(space)

	$("#list_btn").click(function(){
		self.location = "/provider/proReSelectAll?"
	})
	
	//답변작성 버튼 클릭시 에디터모달 show.
	$("#replyWrite").on("click", function(){
		$("#replyWriteDiv").css("display", "block");
	 		
	 		//모달뜨고 나서 모달 안에 폼태그에 값 입력.
	 		
	 		//$("#resNoForReply").val("${proRe.prodResNo }");
	 		
	 	});
	
	//답변 전송 등록.
	function replySend(){
		
			replyFrm.submit();
		
		//$("#replyEnd").css("display", "none");
	}
	
	//픽업완료 처리
	$("#pickupComplete").on("click", function(){
		console.log(${proRe.prodResNo })
		$.ajax({
			url:"pickupComplete",
			method:"POST",
			data: "prodResNo="+${proRe.prodResNo },
			success:function(data){
				alert("픽업완료!")
				location.reload(true);
			},
			error:function(){
				alert("실패")
			}
		})
	})
	//주문취소 
	$("#cancelRes").on("click", function(){
		$.ajax({
			url:"cancelRes",
			method:"POST",
			data: "prodResNo="+${proRe.prodResNo },
			success:function(data){
				alert("주문취소 완료.")
				location.reload(true);
			},
			error:function(){
				alert("실패")
			}
		})
	})
	
	
</script>
</html>