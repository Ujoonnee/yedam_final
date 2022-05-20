<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<select id="sel">
	<option value="storeName" selected="selected">매장이름</option>
	<option value="prodName">상품명</option>
</select>
<input type="text" id="input">
<button id="search">검색</button>
<table>
		<tr>
			<td>매장이름</td>
			<td>상품명</td>
			<td>총 가격</td>
			<td>픽업상태</td>
			<td>픽업시간</td>
		</tr>
	<tbody id="tbd">
		<c:forEach var="list" items="${reservedProductsList}">
			<tr class="list">
				<td>${list.store.name }<input type="hidden" value="${list.prodResNo}"></td>
				<td>${list.product.prodName }</td>
				<td>${list.paymentAmt}</td>
				<td>
				<c:set var="YN" value="${list.pickupStatus}"/>
					<c:choose>
						<c:when test="${YN eq 'Y'}">픽업완료</c:when>
						<c:when test="${YN eq 'N'}">픽업대기</c:when>
					</c:choose>
				</td>
				<td>${list.pickupTime} + ${list.pickupDate}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>


	
	<div id="pagingDiv">
		<!-- 이전페이지 -->
		<c:if test="${paging.prev }">
			<a href="${paging.startPage - 1}">이전</a>
		</c:if>
			<!-- 1 2 3 4   -->
		<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
		&nbsp;<a href="${num }">${num }</a>&nbsp;
		</c:forEach>
			<!-- 다음페이지 -->	
		<c:if test="${paging.next }">
			<a id="next" href="${paging.endPage + 1 }">다음</a>
		</c:if>
	</div>
	
	
<script>
// 리스트 클릭시 상세페이지로 이동(예약번호넘겨서)
$("#tbd").on("click", ".list", function(){
	var selectedResNo = $(this).find("input").val();
	console.log(selectedResNo);
	location.href="resProdListByProdName/" + selectedResNo;
});

//검색버튼 클릭 시.
$("#search").on("click", function(){
	
	var selectedOpt = $("#sel option:selected").val();
	
	//매장명으로 검색시 리스트 출력
	if(selectedOpt =="storeName"){
		console.log("매장명 데이터 전송예정")
		$.ajax({
			url : "resProdListByStoreName",
			method : "post",
			data : {
				"storeName" : $("#input").val()
			},
			success: function(result){
				$("#tbd").empty();
					 for(d of result){

						 var time = d.pickupTime;
						 var date = d.pickupDate;
						 /* console.log(date);
						console.log(convertDate2(time))
	 					console.log(convertDate1(date)) */
						var cd1 = convertDate1(date);
						var cd2 = convertDate2(time);
						
						if(d.pickupStatus=='Y'){
							var ps="픽업완료";
						}else{
							var ps="픽업대기"
						}
						
				var trs = $("<tr>").append(`<td>\${d.store.name}</td>`)
								   .append(`<input type="hidden" value="\${d.prodResNo}">`)
								   .append(`<td>\${d.product.prodName}</td>`)
								   .append(`<td>\${d.paymentAmt}</td>`)
								   .append(`<td>\${ps}</td>`)
								   .append(`<td>\${cd1}<br>\${cd2}</td>`)
					 }
					 trs.appendTo("#tbd");
					 
			},
			error:function(error){
				console.log(error);
				alert("error : "+error);
			}
		})
	//상품명으로 검색시 리스트 출력
	}else if(selectedOpt =="prodName"){
		console.log("상품명 데이터 전송예정");
		$.ajax({
			url:"resProdListByProdName",
			method:"POST",
			data:{
				"inputVal": $("#input").val()
			},
			success: function(result){
				$("#tbd").empty();
				 for(d of result){

					 var time = d.pickupTime;
					 var date = d.pickupDate;
					var cd1 = convertDate1(date);
					var cd2 = convertDate2(time);
					
					if(d.pickupStatus=='Y'){
						var ps="픽업완료";
					}else{
						var ps="픽업대기"
					}
					
			var trs = $("<tr>").append(`<td>\${d.store.name}</td>`)
							   .append(`<input type="hidden" value="\${d.prodResNo}">`)
							   .append(`<td>\${d.product.prodName}</td>`)
							   .append(`<td>\${d.paymentAmt}</td>`)
							   .append(`<td>\${ps}</td>`)
							   .append(`<td>\${cd1}<br>\${cd2}</td>`)
				 }
				 trs.appendTo("#tbd");		
			},
			error:function(error){
				alert("error : "+error);
			}
		})
	}
});




//밀리초를 날짜(yy-mm-dd)으로 변경.
function convertDate1(milliSecond) {

	  const data = new Date(milliSecond);
	  
	  const year = data.getFullYear();
	  const yy = year.toString().substring(2,4)
	  var month = data.getMonth() + 1;
	  var date = data.getDate();
	
	  if(month <10 || date <10){
		 var cmonth = "0"+month;
		 var cdate = "0"+date;
	 }

	  return `\${yy}-\${cmonth}-\${cdate}`;
	}
	
	
//밀리초를 시간(오전/오후 hh:mm)으로 변경	
function convertDate2(milliSecond) {
	 
	  const data = new Date(milliSecond);
	 
	  var hour = data.getHours();
	  var minute = data.getMinutes();
	
	  if(hour<10 || minute<10){
		  var chour = "0"+hour;
		  var cminute = "0"+minute;
	  }  
	  
	  if(hour>=12){
		  return `오후 \${chour}:\${cminute}`;
	  }else{
		  return `오전 \${chour}:\${cminute}`;
	  }
	  
	}



</script>
</body>

</html>