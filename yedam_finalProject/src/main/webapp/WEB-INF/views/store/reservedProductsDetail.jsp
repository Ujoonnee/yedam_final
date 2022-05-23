<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/Editor/js/HuskyEZCreator.js"></script>

<%-- <script src = "${path}/ckeditor/ckeditor.js"></script> --%>
 

<meta charset="UTF-8">
<title>Insert title here</title>
<style> 
#star a{
   text-decoration: none;
   color: gray;
  }
  #star a.on{
   color: yellow;
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
</style>
</head>
<body>

<c:forEach var="d" items="${detail }">

<h3>예약내역 상세</h3><hr>
 <table>
	<tr>
		<td>예약번호</td>
		<td>${d.prodResNo}</td>
	</tr>
	<tr>
		<td>예약자 이름</td>
		<td>${d.member.name}</td>
	</tr>
	<tr>
		<td>결제일자</td>
		<td>${d.orderDate}</td>
	</tr>
</table><hr>
<table>
	<tr>
		<td>상품목록</td>
	</tr>
	<c:forEach var="list" items="${prodList}">
	<tr>
		<%-- <td>${list.prodThumbnail}</td> --%>
		<td>${list.product.prodName}</td>
		<td>${list.product.price}</td>
		<td>${list.reservedProduct.count}개</td>
		<td>금액 : ${list.product.price * list.reservedProduct.count}</td>
	</tr>
	<tr>
		<td>총 금액</td>
		<td>${list.paymentAmt}</td>
	</tr>
	</c:forEach>
</table><hr>
<table>
	<tr>
		<td>매장이름</td>
		<td>${d.store.name}</td>
	</tr>
	<tr>
		<td>예약 일시</td>
		<td>${d.pickupTime} ${d.pickupDate}</td>
	</tr>
	<tr>
		<td>연락처</td>
		<td>${d.member.tel}</td>
	</tr>
</table> 
</c:forEach>
<!-- 	모달 -->

	
<button id="cancelRes">예약취소</button> <button id="review">리뷰작성</button>

<button type="button" class="btn btn-block btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#modal-default">Default</button>

<div class="modal fade" id="modal-default" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
            	<h5>리뷰</h5><br>
                <h2 class="h6 modal-title">평점</h2>
                <div>
<p id="star"> <!-- 부모 -->
	   <a href="#" value="1">★</a> <!-- 자식들-->
	   <a href="#" value="2">★</a>
	   <a href="#" value="3">★</a>
	   <a href="#" value="4">★</a>
	   <a href="#" value="5">★</a>
  	<p>
</div>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
						               <form id="smartEditorText" name="smartEditorText" >
							<div class="jsx-2303464893 editor">
								<div class="fr-box fr-basic fr-top" role="application">
									<div class="fr-wrapper show-placeholder" dir="auto"
										style="overflow: scroll;">
										<input type="text" name="content" id="smartEditor"
											style="width: 100%; height: 412px;">
									</div>
								</div>
							</div>
							<button type="button" id="saveBtn">전송</button>
							</form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary">Accept</button>
                <button type="button" class="btn btn-link text-gray ms-auto" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
$('#star a').click(function(){ 
	 $(this).parent().children("a").removeClass("on");    
	 $(this).addClass("on").prevAll("a").addClass("on");
	 console.log($(this).attr("value"));
});

$("#review").on("click",function(){
	
	
})
//show close 모달
$(document).ready(function() {
          $("#modal_show").click(function() {
              $("#exampleModal").modal("show");
          });

          $("#close_modal").click(function() {
              $("#exampleModal").modal("hide");
          });
      });
// 	  모달 생성
	  
//    체크처리한 값 모달로 가져오기
      function getCheckboxValue()  {
	
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
	// 선택된 목록 가져오기
    	  const query = 'input[name="checkf"]:checked';
    	  const selectedEls = document.querySelectorAll(query);
    	  
    	  // 선택된 목록에서 value 찾기
    	  let result = '';
    	  selectedEls.forEach((el) => {
    	    result += el.value + "\n";
    	  });
    	  
    	  // 출력
    	  document.getElementById('cart').innerText = result;
    	}	
      function submitContents(){
    		oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD",[]);
    	};
</script>

<!-- SmartEditor2 --> 
<script type="text/javascript" src = "${pageContext.request.contextPath}/resources/Editor/js/notice-write.js"></script>
</body>
</html>