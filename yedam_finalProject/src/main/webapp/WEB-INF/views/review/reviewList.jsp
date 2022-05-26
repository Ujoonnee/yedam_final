<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>내 리뷰 목록</h3>
	<ul>
		
		<c:forEach items="${reviewList }" var="list">
			<input type="hidden" name="resNo" value="${list.resNo }">
		

			<li>${list.serviceName }</li>
			<li>평점</li>
			<li>${list.score }</li>
			<li>${list.content }</li>
			<hr>
			<li>답변</li>
			<li>${list.replyContent }</li>
			<hr>
			
		</c:forEach>
	</ul>
</body>
<script>
	
	//댓글 수정
	$(".contentUpdate").on("submit", function(){
		var url = $(this).attr("action");
		var $(this) = $(this);
		$.ajax({
			url : url,
			method : "post",
			data : data,
			success : function(responseDate){
				if(responseData.isSuccess){
					$this.slideUp(200);
					var content = $this.find("textarea").val();
					$this.parent().find("pre").text(content);
				}
			}
		});
		return false;
	});
</script>
</html>