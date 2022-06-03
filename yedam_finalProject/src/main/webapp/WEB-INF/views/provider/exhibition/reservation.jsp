<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row justify-content-center" align="center" >
	<div class="col-8">
		<div class="col-6 form-control" style="width:500px">
		<h1 style="text-align: left;">예약자 정보</h1>
		<hr>
		<table>
			<colgroup>
				<col>
				<col width="500px">
			</colgroup>
			<tr><td>&nbsp;</td></tr>
			<tr style="width:400px" class="row mb-2">
				<th class="col-4">전시예약번호</th>
				<td class="col-6">${res.exResNo }</td>
			</tr>
			<tr class="row mb-2"style="width:400px">
				<th class="col-4">전시번호</th>
				<td class="col-6">${res.exNo }</td>
			</tr>
			<tr class="row mb-2"style="width:400px">
				<th class="col-4">전시날짜</th>
				<td class="col-6">${res.exDate }</td>
			</tr>
			<tr class="row mb-2"style="width:400px">
				<th class="col-4">티켓 수량</th>
				<td class="col-6">${res.amount }</td>
			</tr>
			<tr class="row mb-2"style="width:400px">
				<th class="col-4">결제금액</th>
				<td class="col-6">${res.paymentAmt }</td>
			</tr>
			<tr class="row mb-2"style="width:400px">
				<th class="col-4">결제상태</th>
				<td class="col-6">
					<c:if test = "${res.paymentStatus == 'N' }">
						결제대기
					</c:if>
					<c:if test = "${res.paymentStatus == 'Y' }">
						결제완료
					</c:if>
				</td>
			</tr>
			<tr class="row mb-2"style="width:400px">
				<th class="col-4">멤버번호</th>
				<td class="col-6">${res.memNo }
</td>
			</tr>
		
		</table>


<!-- 리뷰보기/답변달기 -->
	<c:if test="${not empty reviewList}">
<div	align = "left">
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
			<button type="button" id="replyWrite">답변작성</button>

			<div id="replyWriteDiv" style="display:none"><button id="insertReply" >답변등록</button>
				<form id="replyFrm" action="${pageContext.request.contextPath}/review/exhReplyInsert" method="post">
				<input type="hidden" name="resNo" value="${res.exResNo }">
				<textarea rows="10" style=width:100% id="replyContent" name="replyContent"></textarea>
				</form>
			</div>
			</c:if>
			
</div>
</c:if>
		</div>
	</div>
</div>
<script type="text/javascript">
		//평점 ★로 출력하기
		var score = $("#vscore").html();
		var space ="";
		
		for(var i=0; i<score; i++){
			space = space + "★";
		} 
		
		$("#vscore").html(space)

		//답변작성 버튼클릭시 textarea show.
			$("#replyWrite").on("click", function(){
				$("#replyWriteDiv").css("display", "block");
			});
		
		//답변 전송 등록.
		$("#insertReply").on("click", function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/review/exhReplyInsert",
				method:"post",
				data : $("#replyFrm").serialize(),
				success: function(){
					location.reload(true);
				},
				error : function(){
					alert("전송 실패");
				}
			})	
		})
		
				
		
</script>
</body>
</html>