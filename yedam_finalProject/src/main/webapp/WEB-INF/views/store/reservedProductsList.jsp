<<<<<<< HEAD
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
	<tbody>
		<%-- <c:forEach var="list" items="${reservedProductsList}">
			<tr>
				<td>${list.store.name }</td>
				<td>${list.product.name }</td>
				<td>${list.paymentAmt}</td>
				<td>${list.paymentStatus}</td>
				<td>${list.pickupTime}, ${list.pickupDate}</td>
			</tr>
		</c:forEach> --%>
	</tbody>
</table>
</body>
<script>
$("#search").on("click", function(){
	
	var selectedOpt = $("#sel option:selected").val();
	
	if(selectedOpt =="storeName"){
		console.log("매장명 데이터 전송예정")
		$.ajax({
			url : "resProdListByStoreName",
			method : "post",
			data : {
				"inputVal" : $("#input").val()
			},
			success: function(result){
				alert("result : " + result);				
			},
			error:function(error){
				alert("error : "+error);
			}
		})
	
	}else if(selectedOpt =="prodName"){
		console.log("상품명 데이터 전송예정");
		$.ajax({
			url:"resProdListByProdName",
			method:"POST",
			data:{
				"inputVal": $("#input").val()
			},
			success: function(result){
				alert("result : " + result);				
			},
			error:function(error){
				alert("error : "+error);
			}
		})
	}
});


</script>
=======
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
<table>
		<tr>
			<td>매장이름</td>
			<td>상품명</td>
			<td>총 가격</td>
			<td>픽업상태</td>
			<td>픽업시간</td>
		</tr>
	<tbody>
		<c:forEach var="list" items="${reservedProductsList}">
		<tr>
			<td>매장이름</td>
			<td>상품명</td>
			<td>${list.paymentAmt}</td>
			<td>${list.paymentStatus}</td>
			<td>${list.pickupTime}, ${list.pickupDate}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</body>
>>>>>>> branch 'JO' of https://github.com/Ujoonnee/yedam_final.git
</html>