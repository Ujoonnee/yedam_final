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
	<div class="form-control" style="width:800px">
	<section id ="page_header" class="single-page-header">
<div align="left"><a class="display-3" href="http://localhost/finalPrj/store/list"> 매장 </a></div>
<hr>
	<div class="container display-3">${paging.cri.storeName}</div>
	</section>
	<hr>
<!-- 	상품검색 -->
	<form action ="searchProduct" method="get" name="searchForm" autocomplete="off">
	<div id = "searchBox row" align="center">
		<p class="row col-3" align="center" style="width:300px"><span class="display-5 me-2 mb-2">상품명</span>
		<input class="col-6 form-control" type = "text" id ="keyword" name = "keyword" value="${paging.cri.keyword }" placeholder="상품명 입력하세요." ></p>
		<p align="center" class="justify-content-center me-7" ><span class="display-5 col-2 ms-7">가격</span>
		<div class="row justify-content-center">
			<input class="form-control col-4" style="width:150px" type = "number" id ="lowPrice" name = "lowPrice" placeholder="최소가격." size="15"min = "0"  value="${paging.cri.lowPrice }"> 
			<span class="display-3 col-1">~</span><input class="form-control col-4" style="width:150px" type = "number" id = "highPrice" name = "highPrice" placeholder="최대가격"size="15"min = "0"value="${paging.cri.highPrice }" ></p>
		</div>
		<input type="hidden" id ="storeNo" name = "storeNo" value="${products[0].storeNo }"> 
		
	</div>		
	</form>
		<div align="center">
			<div class="row col-6 ms-3">
				<button id = "searchBtn" class="ms-6 btn btn-sm btn-primary col-3">검색</button>&nbsp;
				<button class="btn btn-sm btn-primary col-3" onclick="resetValue()">초기화</button>
			</div>
		</div>
	<hr>
	<div align="right">
		<button class="btn-open-popup  btn btn-sm btn-primary" onclick="getCheckboxValue()">예약하기</button>
	</div>
	
	<!-- 상품 목록 -->
		<c:if test = "${empty products }">
			<tr><td colspan ="3">등록된 상품이 없습니다.</td></tr>
		</c:if>
		<c:if test = "${not empty products }">
			<table id = "productList" class="w-100">
				<colgroup>
					<col width="10%">
					<col width="20%">
					<col width="20%">
					<col width="30%">
					<col width="20%">
				</colgroup>
				<tbody>
					<c:forEach items="${products }" var= "product">
						<tr>	
							<td>
								<input type ="checkbox" id = "checkf" class="form-check-input" name="checkf" value ="${product }" data-prodNo ="${product.prodNo }" data-stock ="1" data-name ="${product.prodName }"  data-thumbnail ="${product.prodThumbnail }"  data-price ="${product.price }">
							</td>
							<c:if test ="${product.prodThumbnail != null }">
								<td align = "center"><img src="/img/${product.prodThumbnail } " class="selected_img"  height="100px" width="100px"></td>
							</c:if>
							<c:if test ="${product.prodThumbnail == null }">
								<td align = "center"><img src="https://www.jindo.go.kr/themes/home/images/content/no_image.jpg" class="selected_img"  height="100px" width="100px"></td>
							</c:if>
							<td align = "center"  style=" vertical-align : middle;">${product.prodName }</td>
							<td align = "center" style=" vertical-align : middle;"> ${product.price } 원</td>
							<td align = "center" style=" vertical-align : middle;">남은 수량 : ${product.stock }</td>
						</tr>
						<tr><td>&nbsp;</td></tr>
					</c:forEach>
				</tbody>
			</table>	
		</c:if>
<!-- 	모달 -->
	<div id ="popup_mask" ></div> <!-- 팝업 배경 DIV -->
    <div id= "modal"class="modal"> 
        <div id="modal_body"class="modal_body">
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
	<hr>
	</div>

<!-- By jo, 리뷰목록 출력하기. -->
	<!-- 리뷰리스트 버튼 -->
	<div align="left" class="col-5 mt-3" >
		<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --><span>현재리뷰(<span id="reviewNums"></span>)</span>
		<button type="button" class="btn btn-sm btn-primary mb-1" id="reviewShow" onclick=openClose()>리뷰 보기</button>
	</div>

	<!-- 리뷰리스트 시작 -->
	<div id="reviewListStyle" align="left" class="col-5" style="display:none">
		<c:forEach var="list" items="${reviewList}" varStatus="status">
			<hr>
			<div class="row mb-3">
				<div class="col-2">${list.member.name}님 </div><br>
				<div> <fmt:formatDate value="${list.revTime}" pattern="yyyy.MM.dd. HH:mm"/>
					<span>평점(${list.score})</span><span class="tscore${status.index}">${list.score}</span>
				</div>
			</div>
			<div>	
				${list.content}
			</div>
		</c:forEach>
	</div>
	<!-- 리뷰리스트 끝 -->
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
// 		  input 0 일때 모달 창 X
  	    	// 선택된 목록 가져오기
    	  const query = 'input[name="checkf"]:checked';
    	  const selectedEls = document.querySelectorAll(query);
    	  // 선택된 목록에서 value 찾기
    	  let result = '';
    	  var obj_length = Object.keys(selectedEls).length;
		  
    	  if(obj_length == 0){
    		  alert("상품이없습니다.")
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
    	 if(document.getElementById('reviewListStyle').style.display === 'none') {
    	      document.getElementById('reviewListStyle').style.display = 'block';
    	      document.getElementById('reviewShow').textContent = '리뷰 접기';
    	    } else {
    	      document.getElementById('reviewListStyle').style.display = 'none';
    	      document.getElementById('reviewShow').textContent = '리뷰 보기';
    	    }
    }
   
      	
       	
	// 행 클릭하면 체크박스 체크
	$('tr').on('click', function(event) {
		this.childNodes[1].childNodes[1].click();
	})
      
    	
</script>
</body>
</html>