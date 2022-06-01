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

			<button type="button" id="replyWrite">답변작성</button>
			<div id="replyWriteDiv" style="display:none"><jsp:include page="../../member/reply.jsp"><jsp:param value="ok" name="flag"/>
			</jsp:include>
</div>

</div>
</c:if>

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
	
	//답변작성 버튼 클릭시 화면에 에디터 show.
	$("#replyWrite").on("click", function(){
		$("#replyWriteDiv").removeAttr("style");
		//$("#smartEditor").css("display", "block"); 안됨.
		//$("#smartEditor").removeAttr("style");
		//$("#smartEditor").css({'width': '100%', 'height': '412px'});
		
 		//$("#resNoInReply").val("${proRe.prodResNo }");
		/* $("#category").val("${detail.category}");
 		$("#serviceName").val("${detail.store.name}");
 		$("#pickupDate").html("${detail.pickupDate} ${detail.pickupTime}");
 		$("#serviceNameDiv").html("${detail.store.name}"); */
		
		//$("#smartEditor").focus();
		//$("#replyWriteDiv").load("reply.jsp");  안됨.
	})
	
	
	
	
	
	
</script>
</html>