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
View페이징
<div>
<pre>매장번호;${exhibitionView.exNo },
멤버번호;${exhibitionView.memNo },
이름;${exhibitionView.name },
쇼룸;${exhibitionView.showRoom },
날짜;${sta } ~ ${end },
카테고리;${exhibitionView.category }
</pre>
</div>

<div>
여기는댓글.
</div>

<!-- 	메인모달 -->
	<div class="modal"> 
		<div class="modal_body">
			<div id ="관람일"><input type = "text" id = "exDate"> </div>
			<div id = "ticketAmt">수량 <input type =number id = "ticketCount"  placeholder="수량을 입력하세요.:)" max="30" min="0" style="width:150px;"> </div>
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
		
		if(exdate === "" ){
			alert("날짜를 입력하세요.");
			return;
		}else if (ticketCount === ""){
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
			url : "payment",
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