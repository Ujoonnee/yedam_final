<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	#popup_mask { /* 팝업 배경 css */
	        position: fixed;
	        width: 100%;
	        height: 1000px;
	        top: 0px;
	        left: 0px;
	         display: none; 
	         background-color:#000;
	         opacity: 0.8;
	    }
	#popup_sub_mask { /* 팝업 배경 css */
	        position: fixed;
	        width: 100%;
	        height: 1000px;
	        top: 0px;
	        left: 0px;
	         display: none; 
	         background-color:#000;
	         opacity: 0.8;
	    }
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
      /* 상단으로 올라가기  */
  	 #back_to_top {  
     	position: absolute;
        top: 50%;
        right: 0%;
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
	<div class = "col-8" style="width:900px;">
		<div class="display-4 mt-3">전시</div>
		<hr>
<div class="card border-0 shadow mb-4">
	<div class="row row-cols-1 row-cols-sm-2 g-2" style="padding :15px;">
		<div class="col-3" style="width: 35%; padding: 15px">
			  <c:if test = "${empty exhibitionView.thumbnail }">
		          <div class="card shadow-sm">
		            <img src ="https://www.jindo.go.kr/themes/home/images/content/no_image.jpg" class="bd-placeholder-img card-img-top" width="314px" height="384px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: صورة مصغرة" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">사진</text></img>
		          </div>
	          </c:if>
			  <c:if test = "${not empty exhibitionView.thumbnail }">
		          <div class="card shadow-sm">
		            <img src ="/exhibition/${exhibitionView.thumbnail }" class="bd-placeholder-img card-img-top" width="314px" height="384px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: صورة مصغرة" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em"></text></img>
		          </div>
	          </c:if>
	    </div>
		<div class="col-3" style="padding : 25px;">
				<div class="display-4" style="padding-bottom: 10px;">${exhibitionView.name }</div>
	       	<small class="text-muted">
				주소 :${exhibitionView.address }
			</small>
			<p></p>
	       	<small class="text-muted">
				날짜 : ${sta } ~ ${end }
			</small>
			<p></p>
	       	<small class="text-muted">
				가격 : ${exhibitionView.price }&nbsp;원
			</small>
			<p></p>
	       	<small class="text-muted">
				전화번호 : ${exhibitionView.tel }
			</small>
		</div>
	</div>
	<hr>
	<div align="right" class="me-2">
		<button id = "btnReservation" class="btn btn-sm btn-primary mt-2" >예약하기</button>
	</div>
	<hr>
	<div style = "padding-left : 30px; padding-right: 30px;">
		<div class="display-4 row"> 
			<div class="col-6 mb-3">상세정보</div>
			<div align="right" class="display-5 col-6 justify-content-right">현재리뷰(<span id="reviewNums"></span>)</span>&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-sm btn-primary" id="reviewShow" onclick="openClose()">리뷰 보기</button></div>
		</div>
		<p class = "text-muted">
			${exhibitionView.detail }
		</p>
	</div>
	<hr>
</div>

</div>
				<!-- By jo, 리뷰목록 출력하기 -->
				<!-- <div class="card border-0 shadow mb-4" id="exhReviewList"> -->
				
				<div id="reviewListStyle" class="col-3 mt-10 mb-10 ms-3 form-control" style="display:none; width:400px;" align="left">
				<c:forEach var="list" items="${reviewList}" varStatus="status">
					<hr>
					<div>
						<div><span class="display-5 me-2">평점(${list.score})</span>
							<span class="tscore${status.index} display-5" style="color:#FFA500">${list.score}</span>
						</div><br>
						<div class="display-6">${list.content}</div>
							<br>
						<div><span class="display-6 me-1" style="border-right:2px solid;">${fn:substring(list.member.email, 0,3)}*** 님</span><span class="display-6"><fmt:formatDate value="${list.revTime}" pattern="yyyy.MM.dd. HH:mm"/></span></div>
					</div>
				</c:forEach>
				<hr>

						<%-- <c:if test="${fn:length(reviewList) == 0 } ">
						    <h1>아직 리뷰가 없습니다!</h1>
						</c:if> --%>
				</div>		
				<!-- </div> -->
</div>



	<!-- 	메인모달 -->
	<div id ="popup_mask" ></div> <!-- 팝업 배경 DIV -->
	    <div id= "modal"class="modal"> 
	        <div id="modal_body"class="modal_body">
				<div id ="관람일">
				<div id = "exDate"></div></div>
				<hr>
				<div id = "ticketAmt" class="row justify-content-center" >
					<div class="col-3 mt-2 " style="padding:0px;">수&nbsp;량 :</div>	
					<div class="col-4" style="padding:0px;">
				 	<input type =number id = "ticketCount" class="form-control"  placeholder="수량" max="30" min="0"></div>
				 </div>
				<p></p>
				<div id = "modalButton"><button id = "btn-sub-popup" class="btn btn-primary">결제정보확인</button></div>
			</div>
		</div> 
	

	
<!-- 	서브모달 -->
<div id ="popup_sub_mask" ></div> <!-- 팝업 배경 DIV -->

<div id = "sub_modal"class="sub_modal">
	<div id="sub_modal_body" class="sub_modal_body">
		<form id = "frm" >
		<div align= "left">
			<small class = "display-5">예약정보확인</small><br>
			<hr>
			<p class = "text-muted">예약일			: <input type="text" id = "exDate"name="exDate" value="" disabled style="background-color: white; border: none;"></p> 
			<p class = "text-muted">전시명			: ${exhibitionView.name } </p> 
			<p class = "text-muted">예약자명			: ${member.name }</p> 
			<p class = "text-muted">예약자  연락처	: ${member.tel }</p> 
			<p class = "text-muted">수량				: <input type ="text" id ="amount" name="amount" value ="" disabled style="background-color: white; border: none;"></p> 
			<p class = "text-muted">결제금액 			: <input type ="text" id ="paymentAmt" name="paymentAmt" value ="" disabled style="background-color: white; border: none;"></p> 
		
			<input type = "hidden" name="exNo" value ="${exhibitionView.exNo }">
			<input type = "hidden" name="memNo" value ="${exhibitionView.memNo }">
			<input type = "hidden" name="status" value ="N">
			<input type = "hidden" name="category" value ="${exhibitionView.category }">
			<input type ="hidden" id = "price" value ="${exhibitionView.price }">
		</div>
		</form>
		<hr>
		<br>
		<button id="payBtn" class="btn btn-primary">결제하기</button>
	</div>
</div>

<!-- 상단으로 올라가기. -->
<div align="center">
	<a class="btn btn-sm btn-primary" href="javascript:window.scrollTo(0,0);" id="back_to_top" style="position:fixed; color:white; background-color:ellowGreen; block-size:50px; vertical-align:center;">
		<span>▲</span><br>
		<span>TOP</span>
	</a>
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

		
		
		if (memNo == '' || memNo == null) {
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
		        amount: paymentAmtVal, //paymentAmtVal
		        buyer_email: email,
		        buyer_name: name,
		        buyer_tel: tel,
		        buyer_addr: address
		    }, function (rsp) { // callback
		    	console.log(rsp.merchant_uid);
		    	console.log(rsp);
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
							console.log(result);		
							alert("결제성공");
							location.reload();
						},
						error:function(error){
							console.log(error);
						}
					})
					
					
		        	
		        } else {
		              // 결제 실패 시 로직,
		        	  console.log(data)
		        	 alert('결제가 취소되었습니다.')
		            
		            
		        }
		    });
			

			
		
		
		}
	}
		


// 모달처리

	const body = document.querySelector('body');
	const modal = document.querySelector('.modal'); 
	const btnOpenPopup = document.querySelector('#btnReservation'); 
	
	btnOpenPopup.addEventListener('click', () => {
		
		

		
		const memNo= "${user.memNo}";
		const memType = "${user.memType}";
		if(!memNo ){
			alert("비로그인일시 이용이 불가합니다.")
			return;
		}else if(memType != "00102"){
			alert("일반회원만 결제가 가능합니다.")
			return;
		}
		
		
	      modal.classList.toggle('show');
	      $("#modal").css({
              "top": (($(window).height()-$("#modal").outerHeight())/2+$(window).scrollTop())+"px",
              "left": (($(window).width()-$("#modal").outerWidth())/2+$(window).scrollLeft())+"px"
              //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정

           }); 

        $("#popup_mask").css("display","block"); //팝업 뒷배경 display block
        $("#modal").css("display","block"); //팝업창 display block

        $("body").css("overflow","hidden");//body 스크롤바 없애기
	      if (modal.classList.contains('show')) {
	        body.style.overflow = 'hidden';
	      }
	    });
	
	modal.addEventListener('click', (event) => {
	  if (event.target === modal) {
	    modal.classList.toggle('show');
	    $("#popup_mask").css("display","none"); //팝업창 뒷배경 display none
        $("#modal").css("display","none"); //팝업창 display none
        $("body").css("overflow","auto");//body 스크롤바 생성
	
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
	const sub_btnOpenPopup = document.querySelector('#btn-sub-popup');
	
	
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
			alert("티켓 수량을 입력하셔야 합니다.")
			return;
		}
		
		$("#modal").css("display","none"); //팝업창 display none
		
		$("#sub_modal").css({
            "top": (($(window).height()-$("#sub_modal").outerHeight())/2+$(window).scrollTop())+"px",
            "left": (($(window).width()-$("#sub_modal").outerWidth())/2+$(window).scrollLeft())+"px"
            //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
         }); 
		
        $("#sub_modal").css("display","block"); //팝업창 display block
        $("body").css("overflow","hidden");//body 스크롤바 없애기


		
		
		sub_modal.classList.toggle('show');
		modal.classList.replace('show','hidden');
		
		if (sub_modal.classList.contains('show')) {
	        body.style.overflow = 'hidden';
	   
	      }
	});
	
	sub_modal.addEventListener('click', (event) => {

		  if (event.target === sub_modal) {
		    sub_modal.classList.toggle('show');
	        $("body").css("overflow","auto");//body 스크롤바 생성
		    $("#popup_mask").css("display","none"); //팝업창 뒷배경 display none
	        $("#sub_modal").css("display","none"); //팝업창 display none
		    if (!modal.classList.contains('show')) {
// 		      body.style.overflow = 'hidden';
		        $("body").css("overflow","auto");//body 스크롤바 생성

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

	//JO 리뷰 여러개일때 별출력 하기.
 	//리뷰 갯수(length)구하기.
	 var revNo = [];	
	 	 <c:forEach var="list" items="${reviewList}">
	 	 	revNo.push("1");
	 	 </c:forEach>
	 var reviewLength = revNo.length;
	$("#reviewNums").html(reviewLength);
    	for(var j=0; j<reviewLength; j++){
    		var space ="";
    		
		   	for(var i=0; i<$(".tscore"+j).html(); i++){
		   		space = space + "★";
	   		} 
		   	
	    	console.log($(".tscore"+j).html())
	    	console.log($(".tscore"+j).html(space))
		   	$(".tscore"+j).html(space)

    	}
  	//리뷰보이기/숨기기
      function openClose(){
      	 if($("#reviewListStyle").css("display") == "none") {
      	      $("#reviewListStyle").fadeIn(400);
      	      $("#reviewShow").html('리뷰 접기');
      	    } else {
      	      $("#reviewListStyle").fadeOut(400);
      	      $("#reviewShow").html('리뷰 보기');
      	    }
      } 		

</script>
</body>
</html>