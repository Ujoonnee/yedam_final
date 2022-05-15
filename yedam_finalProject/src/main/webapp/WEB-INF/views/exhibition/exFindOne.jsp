<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>전시 상세페이지</title>
	<script src="resources/jQuery/jquery-3.4.1.min.js"></script>
	   <style type="text/css">
	   img{
             width: 300px;
             float:left
         }
         
       </style>
</head>
<body>
	<h1>전시 상세페이지</h1>
	<hr>
	<form id="frm" action="update" method="post">
		<input name="seq" type="hidden" value="${exhibition.exNo}" />
	<div>

<dl>
    <dd>
        <p>
            <a href=""><img src="resources/img/${exhibition.thumbnail}"/> </a>
        </p>
    </dd>
   
    <dl align="right" >
        <ul style="list-style: none;">
            <li>
                <h3>${exhibition.exName}</h3>
      
            </li><br>
            <li>
                <span>전시장</span><br>
                <span>${exhibition.showRoom }</span>
            </li><br>
            
            <li>
                <span>기간</span><br>
                <span>${exhibition.startDate } ~ ${exhibition.endDate }</span>
            </li><br>
            
            <li>
                <span>전시장 주소</span><br>
                <span>${exhibition.address }</span>
            </li><br>
        </ul>
    </dl>
</dl>
<br>
<hr>
<h1></h1>    
</div>
	</form>
	<div align="right">
	<button type="button" onclick="location.href='exFindAll'">글 목록</button>
</div>
<br>
<h2>상세정보</h2>

<div><p><span>${exhibition.detail}</span></p></div>
<hr>
<h1  align="center">리뷰 들어올 자리</h1>
<div align="center">예약하기</div>
<hr>
<div>
	<h1 align="center">예약 페이지</h1>
	
	
	<label>관람일</label>
	<div><input type="date"></div>
	

<!-- update형식으로 티켓 수량만 다음페이지에 넘기기. -->
<!-- form태그 거슬려서 막아둠 -->
<form action="exResAmtUpdate">
    <label>수량</label><br>
    <input type=text name=amount value=0>
    <input type=button value="+" onClick="javascript:this.form.amount.value++;">
    <input type=button value="-" onClick="javascript:this.form.amount.value--;">
    <br><br><input type="submit" value="결제하기" onclick="location.href='exResFindOne?exResNo=${ExResMem.exResNo }'">
</form>
		<input name="resNo" type="hidden" value="${ExResMem.exResNo}" />
</div>
</body>
</html>