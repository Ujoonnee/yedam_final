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

</head>
<body>
	<div class='container'>
	 <div class="row">
	  <div class="col-md-12">
	   <canvas id = "myChartOne"></canvas>
	  </div>
	 </div>
	</div>
<c:forEach items="${productReservation }" var = "list">
	<input type ="text" id = "pickupDate" name="pickupDate" value = "${list }"data-pickupdate="${list.pickupDate }">
	<input type = "text" id = "paymentAmt" name="paymentAmt" value ="${list }" data-paymentAmt=" ${list.paymentAmt } ">
	
	 ${list.pickupDate } : ${list.paymentAmt } <br>
</c:forEach>
<script>
	var data = '${productReservation}'
	console.log(data)
	console.log(Object.keys(data).length)
	console.log(typeof data)
	
	var textd = document.getElementById('pickupDate').value;
	var texta = document.getElementById('paymentAmt').value;
	const selectedEld = document.querySelectorAll(textd);
	console.log(typeof selectedEld);
  	console.log(selectedEld);
	console.log(textd);
	console.log(texta);
	let myCahrtOne = document.getElementById('myChartOne').getContext('2d');
	
	let barChart = new Chart(myChartOne, {
		type : 'bar',//line
		data :{
			labels : ['학원', '연구원', '출판사','미디어사','위니브'],
			datasets : [{
				label : '바울랩 매출액',
				data : [
					10,
					100,
					100,
					200,
					1000
					
				],
				
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
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)'
		            ],
			
			
			}]
			
		}
		
	})
</script>
</body>
</html>