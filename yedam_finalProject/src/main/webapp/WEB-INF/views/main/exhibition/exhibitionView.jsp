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

<div align="center">
	<button id = "btnReservation" class="btn btn-lg btn-primary" >예약하기</button>
</div>


	<!-- 	메인모달 -->
		<div class="modal"> 
			<div class="modal_body">
				<div id ="관람일"><input type = "text" id = "exDate"> </div>
				<div id = "ticketAmt">수량 <input type =number id = "ticketCount"  placeholder="수량을 입력하세요.:)" max="30" min="0" style="width:150px;"> </div>
				<div id = "modalButton"><button class = "btn-sub-popup">결제정보확인</button></div>
			</div>
		</div> 
		

	
<!-- 	서브모달 -->
		<div class="sub_modal">
			<div class="sub_modal_body">
				<form id = "frm" >
					<p>예약정보확인</p>
					<p>------------------------------------------------</p>
					<p>예약일			: <input type="text" id = "exDate"name="exDate" value="" disabled></p>
					<p>카테고리			: ${exhibitionView.category }</p>
					<p>전시명			: ${exhibitionView.name } </p>
					<p>예약자명			: ${member.name }</p>
					<p>예약자  연락처	: ${member.tel }</p>
					<p>수량				: <input type ="text" id ="amount" name="amount" value ="" disabled></p>
					<p>결제금액 			: <input type ="text" id ="paymentAmt" name="paymentAmt" value ="" disabled></p>
				
					<input type = "hidden" name="exNo" value ="${exhibitionView.exNo }">
					<input type = "hidden" name="memNo" value ="${exhibitionView.memNo }">
					<input type = "hidden" name="status" value ="N">
					<input type = "hidden" name="category" value ="${exhibitionView.category }">
					<input type ="hidden" id = "price" value ="${exhibitionView.price }">
				</form>
				<button id="payBtn" >결제하기</button>
			</div>
		</div>

</div>
</div>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script type="text/javascript">
// 	결제 function

		
		
// 		var queryString = $('#frm').serialize();
		
// 		$.ajax({
// 			url : "payment",
// 			type : "post",
// 			data : {
// 				"exhibitionReservation" : queryString
// 			},
// 			success: function(result){
// 				alert("result : " + result);				
// 			},
// 			error:function(error){
// 				alert("error : "+error);
// 			}
// 		})
// 	}

var IMP = window.IMP;
IMP.init('imp73462839');


$('#payBtn').click(() => requestPay() );


function requestPay() {
		
		const memNo= '${user.memNo}';

		
		
		if (memNo == '') {
			alert("로그인 후 사용해주세요.")
			return;
		}else{
			
			
			var paymentAmtVal = document.getElementById('paymentAmt').value;
			var exDateVal = document.getElementById('exDate').value;
			
			var amountVal = document.getElementById('amount').value;
			console.log(amountVal);
			const tel= '${user.tel}';
			const name= '${user.name}';
			const email= '${user.email}';
			const address= '${user.address}';
			
			
		
			
			
			
			// IMP.request_pay(param, callback) 결제창 호출
		    IMP.request_pay({ // param
		        pg: "html5_inicis",
		        pay_method: "card",
		        merchant_uid:  'merchant_' + new Date().getTime(),
		        name: "예담통합플랫폼 결제",
		        amount: 100, //paymentAmtVal
		        buyer_email: email,
		        buyer_name: name,
		        buyer_tel: tel,
		        buyer_addr: address
		    }, function (rsp) { // callback
		        if (rsp.success) {
		            // 결제 성공 시 로직,
		        	console.log(rsp.success);
		        	
					$.ajax({
						url : "payment",
						type : "post",
						data : {
							"exNo" : ${exhibitionView.exNo },
							"memNo" : memNo	,
							"exDate" : exDateVal,
							"amount" : amountVal,
							"paymentAmt" : paymentAmtVal
						},
						success: function(result){
							alert("결제성공");				
							console.log(result);		
							location.reload();
						},
						error:function(error){
							alert("error : "+error);
							console.log(error);
						}
					})
					
					
		        	
		        } else {
		              // 결제 실패 시 로직,
		        	  console.log(data)
		        	 alert('결제실패')
		            
		            
		        }
		    });
			

			
		
		
		}
	}
		


// 모달처리

	const body = document.querySelector('body');
	const modal = document.querySelector('.modal'); 
	const btnOpenPopup = document.querySelector('#btnReservation'); 
	
	btnOpenPopup.addEventListener('click', () => {
	      modal.classList.toggle('show');
	
	      if (modal.classList.contains('show')) {
	        body.style.overflow = 'hidden';
	      }
	    });
	
	modal.addEventListener('click', (event) => {
	  if (event.target === modal) {
	    modal.classList.toggle('show');
	
	    if (!modal.classList.contains('show')) {
	      body.style.overflow = 'auto';
	    }
	  }
	});
	
// 	모달닫기(차례대로)
	$(document).mouseup(function (e){
		var subModal = $(".sub_modal");	
		var modal = $(".modal");	
		if (subModal.has(e.target).length === 0){
			subModal.removeClass("show");
		}
		
	});
	
	
// 	서브모달
	const sub_modal = document.querySelector('.sub_modal');
	const sub_btnOpenPopup = document.querySelector('.btn-sub-popup');
	
	sub_btnOpenPopup.addEventListener('click', () => {
		
// 		티켓 수, 날짜 입력받으며, 가격 계산
		var ticketCount = $('#ticketCount').val();
		var price = $('#price').val();
		var exdate = $('#exDate').val();
		
		var  multi = price * ticketCount;
		
		$('input[name=amount]').attr('value',ticketCount);
		$('input[name=paymentAmt]').attr('value',multi);
		$('input[name=exDate]').attr('value',exdate);
		
		if(exdate === "" ){
			alert("날짜를 입력하세요.");
			return;
		}else if (ticketCount === ""){
			alert("티켓 수량을 입력하세야합니다.")
			return;
		}
		
		
		
		
		sub_modal.classList.toggle('show');
		modal.classList.replace('show','hidden');
		
		if (sub_modal.classList.contains('show')) {
	        body.style.overflow = 'hidden';
	      }
	});
	
	sub_modal.addEventListener('click', (event) => {
		  if (event.target === modal) {
		    sub_modal.classList.toggle('show');
		
		    if (!modal.classList.contains('show')) {
		      body.style.overflow = 'hidden';
	    }
	  }
	});
	
	
	


	
	 $(document).ready(function () {
		 const today = new Date("${date}");
		 const dateStart = new Date("${sta}");
		 const dateEnd = new Date("${end}");
		 var startDate =  Math.floor((today.getTime() - dateStart.getTime())/(24*60*60*1000));
		 var endDate =  Math.floor((dateEnd.getTime() - today.getTime())/(24*60*60*1000));
		 console.log(startDate);
		 console.log(endDate);
         $.datepicker.setDefaults($.datepicker.regional['ko']); 
         $( "#exDate" ).datepicker({
              changeMonth: true, 
              changeYear: true,
              nextText: '다음 달',
              prevText: '이전 달', 
              dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
              dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
              monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
              monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
              dateFormat: "yymmdd",
              minDate : -startDate,
              maxDate : endDate,
              onClose: function( selectedDate ) {    
                   //시작일(startDate) datepicker가 닫힐때
                   //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                  $("#endDate").datepicker( "option", "minDate", selectedDate );
              }    

         });
  
 });


</script>
</body>
</html>