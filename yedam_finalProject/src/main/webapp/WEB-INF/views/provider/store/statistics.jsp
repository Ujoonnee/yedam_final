<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"  >
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
</head>
<body>
<form action = "searchDate" method ="post">
	<div id ="날짜선택" align="center">
	<input type="hidden" id = "storeNo" name = "storeNo" value ="${productReservation[0].storeNo }">
	<input type = "text" id = "startDate" name = "startDate"placeholder="날짜를 입력하세요."> ~
	<input type = "text" id = "endDate" name="endDate" placeholder="날짜를 입력하세요.">
	<button type ="submit">검색</button> </div>
</form>

	<div class='container'>
	 <div class="row">
	  <div class="col-md-12">
	   <canvas id = "myChartOne"></canvas>
	  </div>
	 </div>
	</div>
<c:forEach items="${productReservation }" var = "list">
	<input type ="hidden" id = "salesData" name="salesData" value = "${list }"
	data-pickupDate="${list.pickupDate } " data-paymentAmt = "${list.paymentAmt }">
</c:forEach>


<script>
// 	salesDate value값 전체 받아오기.
	const salesData = 'input[name="salesData"]';
	const selectedEls = document.querySelectorAll(salesData);
  	console.log(typeof selectedEls);
  	console.log(selectedEls);
	
  	let result = '';
  	let prodList = [];
//  받아온 값들 obj의 list로 처리
  	for(let obj of selectedEls) {
 		 console.log(obj);
 		 console.log( obj.dataset.pickupdate);
 		 console.log( obj.dataset.paymentamt);
 		 let prod = {
 				pickupDate : obj.dataset.pickupdate,
 				paymentAmt : obj.dataset.paymentamt,
 		 };
 		 prodList.push(prod);
 	 }
//   	Json처리
  	 const jsonDate = JSON.stringify(prodList,['pickupDate']);
  	 const jsonAmt = JSON.stringify(prodList,['paymentAmt']);
//   	 Json.parse
  	 const dateVal = JSON.parse(jsonDate);
  	 const dateAmt = JSON.parse(jsonAmt);
// 		날짜, 하루매출량 갯수 
  	 const dateValLength = Object.keys(dateVal).length;
  	 const dateAmtLength = Object.keys(dateAmt).length;
  	 
//   	 날짜, 하루매출액 배열로 치환
  	 var resultDate = new Array();
  	 var resultAmt = new Array();
  	 
  	for (var i=0 ; i< dateValLength; i++){
  		resultDate.push(dateVal[i].pickupDate);
  	}
  	
  	for (var i=0 ; i<dateAmtLength; i++ ){
  		resultAmt.push(dateAmt[i].paymentAmt);
  	}
  	 console.log(resultDate);
  	 console.log(resultAmt);
  	 
  	 console.log(dateAmtLength);
  	 
//   	if(dateAmtLength <= 1){
//   		alert ('차트를 생성하기 위한 자료가 부족합니다.');
//   		window.history.go(-1);
//   	}
  	 
  	 
//   	const list = [dateVal[0].pickupDate,dateVal[1].pickupDate]
//   	console.log(list);
//   	 차트생성
	const myChartOne = document.getElementById('myChartOne').getContext('2d');
	
	let chartType = (resultDate.length >= 7)? 'line' : 'bar';
	
	const barChart = new Chart(myChartOne, {
		type : chartType,
		data :{
			labels : resultDate,
			datasets : [{
				label : '가게 매출',
				data : resultAmt,
				plugins : {
					legend : {
						display : false
					}	
				},
				backgroundColor:[
					   'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)'
			
					
				],
				   borderColor: [
		                'rgba(255, 99, 132, 1)',
		                'rgba(255, 99, 132, 1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)'
		            ],
			
			
			}]
			
		}
		
	})
	
	
	 $(document).ready(function () {
		 const today = new Date("${date}");
		 const dateStart = new Date("${sta}");
		 const dateEnd = new Date("${end}");
		 var startDate =  Math.floor((today.getTime() - dateStart.getTime())/(24*60*60*1000));
		 var endDate =  Math.floor((dateEnd.getTime() - today.getTime())/(24*60*60*1000));
		 console.log(startDate);
		 console.log(endDate);
         $.datepicker.setDefaults($.datepicker.regional['ko']); 
         $( "#startDate" ).datepicker({
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
	
	 $(document).ready(function () {
		 const today = new Date("${date}");
		 const dateStart = new Date("${sta}");
		 const dateEnd = new Date("${end}");
		 var startDate =  Math.floor((today.getTime() - dateStart.getTime())/(24*60*60*1000));
		 var endDate =  Math.floor((dateEnd.getTime() - today.getTime())/(24*60*60*1000));
		 console.log(startDate);
		 console.log(endDate);
         $.datepicker.setDefaults($.datepicker.regional['ko']); 
         $( "#endDate" ).datepicker({
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