<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  #vscore {
   color: red;
  } 
</style>
</head>
<body>
<div class="row justify-content-center">
	<div class="col-6">
		<h3>내 리뷰 목록</h3>
		<div class="card border-0 shadow mb-4">
			<div class="card-body">
				<dl>
					<c:forEach items="${reviewList }" var="list" varStatus="status">
						<input type="hidden" id = "resNo" name="resNo" value="${list.resNo }" data-reviewVal="${list.score }" >
					<dt>내 리뷰</dt>
						<dd>${list.serviceName }</dd>
						<dd>평점</dd>
						<dd class="vscore"><div class="reviewValue${status.index }"></div></dd>
						<dd>${list.content }</dd>
						<hr>
					<dt>답변</dt>
						<dd>${list.replyContent }</dd>
						<hr>
					</c:forEach>
				</dl>
			</div>
		</div>
	</div>
</div>
</body>
<script>
// 	$(document).ready(function(){
		
// 		var resNo = document.getElementById('resNo');
// 		console.log(resNo.dataset.reviewVal)
// 		var valueReview = document.getElementById('valueReview').val;
		
		
		
// 	})
	//평점 ★로 출력하기
	$.ajax({
		url : "${pageContext.request.contextPath}/review/reviewListAjax"
	}).done(function(response){
		console.log(response)
		console.log(response[0].score)
		
		var IntegerScore = parseInt(response[0].score)
		console.log(response.length)
		for(let i=0; i<response.length; i++){
			var val= "";
			for(let z=0 ; z< response[i].score; z++){
				val += "★";
			}
				console.log(val);
			$('.reviewValue'+i).html(val);
				
				
		}
		
	})

</script>
</html>