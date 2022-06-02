<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
      
      input[type="text"]:disabled{
     	 background-color:transparent;
     	 border: none;
     	 border-right: 0px;
     	 border-top: 0px;
     	 border-bottom: 0px;
     	 border-left: 0px;
      }
</style>
 
</head>
<body>
<div align = "center" id = "container">
	<section id ="page_header" class="single-page-header">
	<div class="container">
		<h2>상품목록</h2>
	 </div>
	</section>
<!-- 	상품검색 -->
	<form action ="searchProduct" method="get" name="searchForm" autocomplete="off">
	<div id = "searchBox">
		<p>상품명 : 
		<input type = "text" id ="keyword" name = "keyword" value="${paging.cri.keyword }" placeholder="상품명 입력하세요." ></p>
		<p>가격 :
		<input type = "number" id ="lowPrice" name = "lowPrice" placeholder="최소가격." size="15"min = "0"  value="${paging.cri.lowPrice }"  > 
		~ <input type = "number" id = "highPrice" name = "highPrice" placeholder="최대가격"size="15"min = "0"value="${paging.cri.highPrice }" ></p>
		
		<input type="hidden" id ="storeNo" name = "storeNo" value="${products[0].storeNo }"> 
		
		<button id = "searchBtn" >버튼</button>&nbsp;
	</div>		
	</form>
		<button  onclick="resetValue()">초기화</button>
	<!-- 상품 목록 -->
	<table id = "productList">
		<c:if test = "${empty products }">
			<tr><td colspan ="3">등록된 상품이 없습니다.</td></tr>
		</c:if>
		<c:if test = "${not empty products }">
			<c:forEach items="${products }" var= "product">
				<tr>	
				<c:if test ="${product.prodThumbnail != null }">
					<td align = "center"><img src="/img/${product.prodThumbnail } " class="selected_img"  height="100px" width="100px"></td>
				</c:if>
				<c:if test ="${product.prodThumbnail == null }">
					<td align ="center"></td>
				</c:if>
					<td align = "center"  style=" vertical-align : middle;"><input type ="checkbox" id = "checkf" name="checkf" value ="${product }"
					data-prodNo ="${product.prodNo }" data-stock ="1" data-name ="${product.prodName }"  data-thumbnail ="${product.prodThumbnail }"  data-price ="${product.price }"  
					>${product.prodName }</td>
					<td align = "center" style=" vertical-align : middle;">가격 : ${product.price }</td>
					<td align = "center" style=" vertical-align : middle;">재고 : ${product.stock }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>	
<!-- 	모달 -->
	<div class="modal"> 
		<div class="modal_body">
			<div>픽업 예상 시간 <input type="time" id="pickupTime" min="00:00" max="23:59"></div>
			<div id ="cart"></div>
			<div id = "management">
				<table style ="margin: auto;">
					<thead>
						<tr>
							<th>사진</th>
							<th>상품명</th>
							<th>가격</th>
							<th>수량</th>
						</tr>
					</thead>
					<tbody id="tbody"></tbody>
				</table>
			</div>
			<div id = 'priceCheck'>
				<p align="right">총가격 : <input type = "text" id="totalPrice" name = "totalPrice" disabled="disabled"></p>
				<button id="payBtn">결제하기</button>
			</div>
		</div>
	</div> 
	
	<button class="btn-open-popup" onclick="getCheckboxValue()">장바구니</button>

<%-- <!-- By jo, 리뷰목록 출력하기. ${reviewList }-->
<div  ><button type="button" id="review11">리뷰별표시 테스트</button>
	<c:forEach var="list" items="${reviewList}" varStatus="status">
		<div>${list.member.name}님  <fmt:formatDate value="${list.revTime}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/>
		<span class="vscore${status.index}">${list.score}</span>
		${list.content}</div><br>
		
		
	</c:forEach>
</div> --%>


</div>
 <!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script type="text/javascript">

	var IMP = window.IMP;
	IMP.init('imp73462839');
	
	
	$('#payBtn').click(() => requestPay() );
	
	
	 function requestPay() {
		
// 		날짜구하기
// 		let today = new Date();   
// 		let year = today.getFullYear(); // 년도
// 		let month = today.getMonth() + 1;  // 월
// 		let date = today.getDate();  // 날짜
// 		let yyyyMMdd = year + '-'+ month + '-'+ date
// 		console.log(yyyyMMdd);
		
		var mem_no = '${user.memNo}';
		var email = '${user.email}';
		var totalPrice = $('#totalPrice').val();
		var pickupTime = document.getElementById('pickupTime').value
		var store_no = document.getElementById('storeNo').value
		
		if(email == ''){
			alert("로그인을 해야 결제를 할 수 있습니다.")
			return;
		}
		
   	  	const selectedEls = document.querySelectorAll('input[name="checkf"]:checked');
		
   	  	console.log(selectedEls);
   	  	
   	  	selectedEls.forEach(product => {
   	  		console.log(product.dataset.prodno);
   	  	})
			
// 			$.ajax({
// 				url: '',
// 				method: 'post',
				
// 			})
				
		      // IMP.request_pay(param, callback) 결제창 호출
		      IMP.request_pay({ // param
		          pg: "html5_inicis",
		          pay_method: "card",
		          merchant_uid: 'merchant_' + new Date().getTime(),
		          name: "예담통합플랫폼 결제",
		          amount: 100, //amout에 넣으면됨 parseInt(totalPrice)
		          buyer_email : email,
	              buyer_name : '${user.name}',	
	              buyer_tel : '${user.tel}',
	              buyer_addr : '${user.address}'
		      }, function (rsp) { // callback
		          if (rsp.success) {
		        	  
		        	  alert(rsp.success);
		        	  console.log(rsp.success);
		        	  console.log(rsp);
		        	  console.log(mem_no);
		              // 결제 성공 시 로직,
		              
		               jQuery.ajax({
				            url: "paymenInformation", // 예: https://www.myservice.com/payments/complete
				            method: "POST",
				            headers: { "Content-Type": "application/json" },
				            data: JSON.stringify({
				                impUid: rsp.imp_uid,			//결제번호
				                merchantUid: rsp.merchant_uid,  //주문번호
				                amount : rsp.paid_amount,		//총금액
				                email : rsp.buyer_email,		//Id
				                name : rsp.buyer_name,			//이름
				                tel : rsp.buyer_tel,			//전화번호
				                address : rsp.buyer_addr,		//주소
				                time : pickupTime,				//픽업시간
				                pay_method : rsp.pay_method,	//결제방법
				                storeNo : store_no,				//매장등록번호
				                memNo : mem_no					//결제한 멤버 정보.
				            })
				        }).done(function (data) {
				          // 가맹점 서버 결제 API 성공시 로직
				          console.log(data);
			        	 alert('정보저장성공');
				        })
						alert("결제성공");        
				      
		          } else {
		        	  console.log(data)
		              // 결제 실패 시 로직,
		        	 alert('결제실패')
		          }
		      });
	    }

	
	 
	function resetValue(){
		document.getElementById('keyword').value = '';
		document.getElementById('lowPrice').value = '';
		document.getElementById('highPrice').value = '';
		
	}
	function selectChanged(e){
		if(e.value == 'name'){
			alert('name');
		}
		if(e.value == 'prod_name'){
			alert('prodname')	
		}
	}
	

	
	$(document).on("change",".productStock1",function(){
		var selectprice = document.querySelectorAll('.productPrice'); 
		var selectStock = document.querySelectorAll('.productStock1');
		console.log(selectprice)
		console.log(selectStock)
		var obj_length = Object.keys(selectprice).length;
		console.log(obj_length)
		
		var total = 0;
		var price;
		var cnt;
		var sum;
		
		for (var i = 0; i<obj_length; i++){
			price = selectprice[i].value;
			cnt = selectStock[i].value;
			
			price = Number(price);
			cnt = Number(cnt);
			
			sum = price *cnt
			total = Number(total);
			total += sum
		}
		$('#totalPrice').attr('value',total);
		
	})
	
// 	$(document).on("click",".payment",function(){
// // 		결제 클릭시 넘겨줘야 할 값 : 매장번호, 주문 일시, 결제 총 금액
// 		var dataSetVal = document.getElementById('checkf');
// 		var prodNo =prodNo.dataset.prodNo
// 		console.log(prodNo);
// 		let today = new Date();   
// 		let year = today.getFullYear(); // 년도
// 		let month = today.getMonth() + 1;  // 월
// 		let date = today.getDate();  // 날짜
// 		console.log(year)
// 		console.log(month)
// 		console.log(date)
// 		let yyyyMMdd = year + '-'+ month + '-'+ date
// 		console.log(yyyyMMdd);
// 		var pickupTime = yyyyMMdd +' '+  document.getElementById("pickupTime").value;
// 		console.log(pickupTime);
		
// 		alert("결제클릭")
// 	}
// 	)
	
		

		

	  $(document).ready(function() {
          $("#modal_show").click(function() {
              $("#exampleModal").modal("show");
          });

          $("#close_modal").click(function() {
              $("#exampleModal").modal("hide");
          });
      });
// 	  모달 생성	
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
      
//       체크처리한 값 모달로 가져오기
      function getCheckboxValue()  {
    	  // 선택된 목록 가져오기
    	  const query = 'input[name="checkf"]:checked';
    	  const selectedEls = document.querySelectorAll(query);
    	  
    	  // 선택된 목록에서 value 찾기
    	  let result = '';
    	  var obj_length = Object.keys(selectedEls).length;
    	  var checkList = [];
    	  var inputStock = document.createElement('input');
    		
    		
    		for(let obj of selectedEls){
    			
    			let checkValue ={
    				사진 : obj.dataset.thumbnail,
    				상품번호 :  obj.dataset.prodno,
    				상품명 : obj.dataset.name,
    				가격 : obj.dataset.price,
    				수량 : obj.dataset.stock,
    			};
    			checkList.push(checkValue);
    			
    		};
    		$('#tbody').html('');
    		var total = '';
    		for(let obj of checkList){
    			
    			const tr = $('<tr>').attr('name','checkVal');
    			
    			const imgVal = '/img/'+obj.사진
    			const img = $('<img>').attr('src', imgVal).attr('height','50px').attr('width','50px');
    			const price = $('<input>').attr('value',obj.가격).attr('type','text').attr('name','price').attr('disabled','disabled').attr('class','productPrice').attr('style','width:50px;')
    			const stock = $('<input>').attr('value',obj.수량).attr('type','number').attr('name','stock').attr('class','productStock1').attr('min','0').attr('style','width:50px;')
				const prod = $('<input>').attr('value',obj.상품번호).attr('type','hidden').attr('name','checkValProdNo').attr('style','width:50px;')

//     			var productStock = $('input[name=productStock]').val();
//     			console.log(productStock);
//     			var multi = productPrice * productStock
    			
    			tr.append($('<td>').append(img));
    			tr.append($('<td>').html(obj.상품명))
    			tr.append($('<td>').append(price))
    			tr.append($('<td>').append(stock));
    			tr.append($('<td>').append(prod));
    			
    			
    			$('#tbody').append(tr);
    			
    			
    			var productPrice = obj.가격
    			console.log(productPrice);
    			productPrice = Number(productPrice);
    			total = Number(total);
    			total += productPrice
    			
    		}
    		
    		$('input[name=totalPrice]').attr('value',total);
    		
    		
     }
     
     //JO 별 표시하기.
     /* $("#review11").on("click", function(){
    	 //var revNums = ${reviewList.revNo};
         console.log("11111111");
         console.log(revNums.length);
         console.log("11111111");
       //평점 ★로 출력하기
       //for(var n = 0; n<
     	var score = $(".vscore"+n).html();
     	var space ="";
     	
     	for(var i=0; i<score; i++){
     		space = space + "★";
     	} 
     	
     	$(".vscore"+n).html(space)
     }) */
      
    	
</script>
</body>
</html>