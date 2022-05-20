<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
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
	<form action ="searchProduct" method="post" name="searchForm" autocomplete="off">
			<select id="type" name="type"
				onchange="allSelected()">
					<option value="1">전체</option>
					<option value="name"<c:out value="${paging.cri.type eq 'prod_name'? 'selected': '' }" />>상품명</option>
					<option value="prod_name"<c:out value="${paging.cri.type eq 'price'? 'selected': '' }" />>가격</option>
			</select>
			<input type="hidden" name = "store_no" value="${product.storeNo }">
			<input type="text" id="keyword" name="keyword" placeholder =" 검색어를 입력해주세요." value="${keyword}" size="40">&nbsp;
			<button id = "searchBtn" >버튼</button>&nbsp;
		</form>
	<!-- 상품 목록 -->
	<table id = "productList">
		<c:if test = "${empty products }">
			<tr><td colspan ="3">등록된 상품이 없습니다.</td></tr>
		</c:if>
			<c:if test = "${not empty products }">
				<c:forEach items="${products }" var= "product">
					<tr>	
						<td align = "center">${product.prodThumbnail }</td>
						<td align = "center"><input type ="checkbox" id = "checkf" name="checkf" value ="${product }">${product.prodName }</td>
						<td align = "center">가격 : ${product.price }</td>
					</tr>
				</c:forEach>
		</c:if>
	</table>	
<!-- 	모달 -->
	<div class="modal"> 
		<div class="modal_body">
			<div>픽업 예상 시간 <input type="time"  min="00:00" max="23:59"></div>
			<div id ="cart"></div>
		</div>
	</div> 
	<button class="btn-open-popup" onclick="getCheckboxValue()">장바구니</button>


	
	<form id="pagingFrm" name="pagingForm" action="storeView?store_no=${product.storeNo }" method="get">
		<input type="hidden" id="pageNum" name="pageNum" value="${paging.cri.pageNum }">
		<input type="hidden" id="pageNum" name="pageNum" value="${paging.cri.amount }">
		<input type="hidden" id="type" name="type" value="${paging.cri.type }">
		<input type="hidden" id="keyword" name="keyword" value="${paging.cri.keyword }">
	</form>
	
	<div id="pagingDiv">
		<!-- 이전페이지 -->
		<c:if test="${paging.prev }">
			<a href="${paging.startPage - 1}">이전</a>
		</c:if>
			<!-- 1 2 3 4   -->
		<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
		&nbsp;<a href="${num }">${num }</a>&nbsp;
		</c:forEach>
			<!-- 다음페이지 -->	
		<c:if test="${paging.next }">
			<a id="next" href="${paging.endPage + 1 }">다음</a>
		</c:if>
	</div>
</div>
<script>

	$(document).ready(function(){
		/* 페이지 번호 이동 id> pageNum > attr로 속성 href줌 */
		$('#pagingDiv a').click(function(e){
			e.preventDefault();
			$('#pageNum').val($(this).attr("href"));
			pagingForm.submit();
		})
	});
	
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
    	  selectedEls.forEach((el) => {
    	    result += el.value + "\n";
    	  });
    	  
    	  // 출력
    	  document.getElementById('cart').innerText = result;
    	}
    	
   // 검색 [전체] 선택 시 검색창 비우기
  	function allSelected() {
  		var selected = document.getElementById("type");
  		if (selected.options[selected.selectedIndex].value == 1) {
  			document.getElementById("keyword").value = '';
  		}
  	
  	}
</script>
</body>
</html>