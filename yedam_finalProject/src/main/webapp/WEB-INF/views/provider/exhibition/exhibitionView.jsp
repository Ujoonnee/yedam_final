<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!-- 날짜 구하는 함수 -->
 <c:set var="today" value="<%=new java.util.Date()%>" />
 
<%--  <fmt:parseDate var="startDate" value="${exhibitionView.startDate}"  pattern="E MMM dd HH:mm:ss z yyyy"/> --%>
<%--  <fmt:parseDate var="endDate" value="${exhibitionView.endDate}" pattern="E MMM dd HH:mm:ss z yyyy "/> --%>
<%--  <fmt:formatDate value="${startDate }" pattern="yyyy-mm-dd"/> --%>
<%--  <fmt:formatDate value="${endDate }" pattern="yyyy-mm-dd"/> --%>
 <c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></c:set>
 <c:set var="sta"><fmt:formatDate value="${exhibitionView.startDate}" pattern="yyyy-MM-dd " /></c:set>
 <c:set var="end"><fmt:formatDate value="${exhibitionView.endDate}" pattern="yyyy-MM-dd" /></c:set>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style> 
	.modal { 
		position: absolute; 
		top: 0; 
		left: 0; 
		width: 100%; 
		height: 100%; 
		display: none; 
		background-color: rgba(0, 0, 0, 0.4); 
	} 
	.modal.show {
	        display: block;
	      }
	
      .modal_body {
        position: absolute;
        top: 50%;
        left: 50%;

        width: 400px;
        height: 600px;

        padding: 40px;

        text-align: center;

        background-color: rgb(255, 255, 255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

        transform: translateX(-50%) translateY(-50%);
      }
      
      	.sub_modal { 
		position: absolute; 
		top: 0; 
		left: 0; 
		width: 100%; 
		height: 100%; 
		display: none; 
		background-color: rgba(0, 0, 0, 0.4); 
		} 
		.sub_modal.show {
		        display: block;
	      	}
	
      .sub_modal_body {
        position: absolute;
        top: 50%;
        left: 50%;

        width: 400px;
        height: 600px;

        padding: 40px;

        text-align: center;

        background-color: rgb(255, 255, 255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

        transform: translateX(-50%) translateY(-50%);
      }
</style>
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<!-- 날짜 -->
<jsp:useBean id="today" class="java.util.Date" />
</head>
<body>
<div class = "row justify-content-center">
	<div class = "col-8">
		<h5 class="display-5"><a href = "http://localhost/finalPrj">메인화면</a> > <a href="list">전시</a> > <a href = "detailView?exNo=${exhibitionView.exNo }">전시상세페이지</a></h5>
		<hr>
	
	
<div class="card border-0 shadow mb-4">
	<div class="row row-cols-1 row-cols-sm-2 g-2" style="padding :15px;">
		<div class="col" style="width: 35%; padding: 15px">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: صورة مصغرة" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">사진</text></svg>
	            쇼룸 : ${exhibitionView.showRoom }
	          </div>
	    </div>
		<div style="padding : 25px;">
				<h4 class="display-4" style="padding-bottom: 10px;">${exhibitionView.name }</h4>
	       	<small class="text-muted">
				주소 :${exhibitionView.address }
			</small>
			<p></p>
	       	<small class="text-muted">
				날짜 : ${sta } ~ ${end }
			</small>
			<p></p>
	       	<small class="text-muted">
				가격 : ${exhibitionView.price }
			</small>
			<p></p>
	       	<small class="text-muted">
				전화번호 : ${exhibitionView.tel }
			</small>
		</div>
	</div>
	<hr>
	<div style = "padding-left : 30px; padding-right: 30px;">
		<h4 class="display-4"> 상세정보</h4>
		<p class = "text-muted">
			${exhibitionView.detail }
		</p>
	</div>
	
</div>
<div class="card border-0 shadow mb-4">
		<div>
		여기는댓글.
		</div>
</div>

</div>
</div>

</body>
</html>