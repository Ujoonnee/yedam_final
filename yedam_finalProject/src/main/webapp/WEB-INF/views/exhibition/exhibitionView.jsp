<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
View페이징
<div>
<pre>매장번호;${exhibitionView.exNo },
멤버번호;${exhibitionView.memNo },
이름;${exhibitionView.name },
쇼룸;${exhibitionView.showRoom },
날짜;${exhibitionView.startDate } ~ ${exhibitionView.endDate },
카테고리;${exhibitionView.category }
</pre>
</div>

<div>
여기는댓글.
</div>

<!-- 	메인모달 -->
	<div class="modal"> 
		<div class="modal_body">
			<div id ="관람일"><input type = "date" id = "exDate"> 달력이미지</div>
			<div id = "ticketAmt">수량 <input type =number id = "ticketCount"  placeholder="수량을 입력하세요.:)" max="30" min="0"> </div>
			<div id = "modalButton"><button class = "btn-sub-popup">결제하기</button></div>
		</div>
	</div> 
	<button class="btn-open-popup" >예약하기</button>
	
<!-- 	서브모달 -->
	<form id = "frm" >
	<div class="sub_modal">
		<div class="sub_modal_body">
			<p>예약정보확인</p>
			<p>-------------------------------------------------------------</p>
			<p>예약일			: <input type="text" name="exDate" value="" disabled></p>
			<p>카테고리			: ${exhibitionView.category }</p>
			<p>전시명			: ${exhibitionView.name } </p>
			<p>예약자명			: ${member.name }</p>
			<p>예약자  연락처	: ${member.tel }</p>
			<p>수량				: <input type ="text" id ="amount" name="amount" value ="" disabled></p>
			<p>결제금액 			: <input type ="text" id ="paymentAmt" name="paymentAmt" value ="" disabled></p>
			<button onclick = "payment()" >결제하기</button>
			
	
			
			
			
		</div>
		<input type = "hidden" name="exNo" value ="${exhibitionView.exNo }">
		<input type = "hidden" name="memNo" value ="${exhibitionView.memNo }">
		<input type = "hidden" name="status" value ="N">
		<input type = "hidden" name="category" value ="${exhibitionView.category }">
		<input type ="hidden" id = "price" value ="${exhibitionView.price }">
	</div>
	</form>
<script>

// 모달처리

	const body = document.querySelector('body');
	const modal = document.querySelector('.modal'); 
	const btnOpenPopup = document.querySelector('.btn-open-popup'); 
	
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
		
		if(exdate === null ){
			alert("날짜를 입력하세요.");
			return;
		}else if (ticketCount === null){
			alert("티켓 수량을 입력하세야합니다.")
			return;
		}
		
		
		
		
		sub_modal.classList.toggle('show');
		
		
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
	
	
	
	// 	결제 function

	function payment(){
		var queryString = $('#frm').serialize();
		$.ajax({
			url : "payment.do",
			type : "post",
			data : {
				"exhibitionReservation" : queryString
			},
			success: function(result){
				alert("result : " + result);				
			},
			error:function(error){
				alert("error : "+error);
			}
		})
	}
	
</script>
</body>
</html>