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
		<input name="resNo" type="hidden" value="${exresmem.exResNo}" />
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
                <h3>${exhibition.name}</h3>
      
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
	
	

<!-- 티켓 수량 및 날짜 다음페이지에 단순히 값만 db x 넘기기. -->
<form action="resConfirm" name=amount method="get">
	<input type="hidden" name="exNo" value="${exhibition.exNo }">
	<label>관람일</label>
	<div><input type="date" name="exDate" required></div>
	
    <label>수량</label><br>
    <input type=text name=amount value="" required>
    <input type=button value="+" onClick="javascript:this.form.amount.value++;">
    <input type=button value="-" onClick="javascript:this.form.amount.value--;">
    <br><br><button type="submit">결제하기</button>
</form>
		
</div>
</body>
</html>