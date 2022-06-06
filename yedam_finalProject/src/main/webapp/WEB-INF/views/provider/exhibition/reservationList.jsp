<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
<div class="row justify-content-center">
	<div class="col-8">
		<h1>내 전시 예약자 목록</h1>
		<hr>
		<div class="card border-0 shadow mb-4">
			<div class="card-body">
				<div>
					<form id="frm" method="get">
						<table>
							<c:if test = "${empty list }">
								<tr><th>예약이 없습니다.</th></tr>
							</c:if>
							<c:if test = "${not empty list }">
								<table class="table table-centered table-nowrap mb-0 rounded">
									<thead class="thead-light">
										<tr class="border-0 rounded-start">
											<th class="border-0 rounded-start">전시예약번호</th>
											<th class="border-0">예약자명</th>
											<th class="border-0">예약날짜</th>
											<th class="border-0">결제상태</th>
											<th class="border-0 rounded-end">결제취소</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list }" var="res" varStatus="status">
										<tr onclick="getReservation(${res.exResNo})">
											<td>${res.exResNo }</td>
											<td>${res.memName }</td>
											<td><fmt:formatDate var="exhDate" value="${res.exDate }" pattern="yyyy-MM-dd"/> ${exhDate }</td>
											<c:if test = "${res.paymentStatus == 'N' }">
												<td>결제대기</td>
											</c:if>
											<c:if test = "${res.paymentStatus == 'Y' }">
												<td>결제완료</td>
											</c:if>
											<c:if test = "${empty res.paymentStatus}">
												<td></td>
											</c:if>
											<td onclick="event.cancelBubble=true" ><button type = "button" class="cancelPay" onclick="cancelPay(${res.exResNo},${res.exNo })">환불하기</button></td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script> -->
<!-- <script -->
<!--   src="https://code.jquery.com/jquery-3.3.1.min.js" -->
<!--   integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" -->
<!--   crossorigin="anonymous"></script>jQuery CDN - -->

<script>
// $(".cancelPay").click(()=> cancelPay());

function cancelPay(n,m) {
	console.log(n);
	console.log(m);
		$.ajax({
			url : "refund",
			type : "POST",
			data : {
				"exResNo" :n,
				"exNo" : m
			},
			success: function(result){
				alert("환불성공")
				location.reload();
			},
			error:function(error){
				alert("error : "+error);
				console.log(error);
			}
		})
	
	}


// 	var IMP = window.IMP;
// 	IMP.init('imp73462839');
	
// 	alert("환불Function");
// 	const exNo = ${list[0].exNo};

// 	$.ajax({
// 		url: "pay/refund",
// 		type:"post",
// 		//datatype:"json",
// 		contentType : 'application/x-www-form-urlencoded; charset = utf-8',
// 		data : {
// 			"merchant_uid": "merchant_1654240739911", // 예: ORD20180131-0000011
// 	        "cancel_request_amount": 100, // 환불금액
// 	        "reason": "테스트 결제 환불", // 환불사유
// 	        "refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
// 	        "refund_bank": "88", // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
// 	        "refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
// 		}
// 	}).done(function(result){ //환불 성공
// 			 pay -= 5;
// 			 $('#pay_coupon').html(pay);	
// 			console.log("환불 성공 : "+ result);
// 		}).fail(function(error){
// 			console.log("환불 실패 : "+ error);
// 		});//ajax
//     jQuery.ajax({
    	
//       "url": "cancelPay", // 예: http://www.myservice.com/payments/cancel
//       "type": "POST",
//       "contentType": "application/json",
//       "data": JSON.stringify({
//         "merchant_uid": "merchant_1654240739911", // 예: ORD20180131-0000011
//         "cancel_request_amount": 100, // 환불금액
//         "reason": "테스트 결제 환불", // 환불사유
//         "refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
//         "refund_bank": "88", // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
//         "refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
//       }),
//       "dataType": "json"
//     });

//   }
	function getReservation(exResNo) {
		frm.action = 'reservation/' + exResNo;
		frm.submit();
	}
</script>
</body>
</html>