<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row justify-content-center">
	<div class="col-8">
		<h3>내 예약 정보</h3>
		
<form action="resProdList" method="get">
<div align="center" class="mb-5">	
<div class="input-group" align="center" style="width:500px">
<select class="form-select" style="width: 20%" id="type" name="type">
	<option value="name" <c:out value="${paging.cri.type eq 'name'? 'selected': '' }" />>매장이름</option>
	<option value="prodName" <c:out value="${paging.cri.type eq 'prodName'? 'selected': '' }" />>상품명</option>
</select>
<input class="form-control" style="width: 60%" placeholder="검색어를 입력하세요." type="text" id="keyword" name="keyword" value="${keyword}">
<button class="input-group-text" id="search">
	<svg class="icon icon-xs text-gray-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
		<path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd">
		</path>
	</svg>
</button>
</div>
</div>

</form>
<div class="card border-0 shadow mb-4">
				<div class="card-body">
					<div class="table-responsive">
<table class="table table-centered table-nowrap mb-0 rounded">
	<thead class="thead-light">
		<tr class="border-0 rounded-start">
			<th class="border-0 rounded-start display-3">매장이름</th>
			<th class="border-0">상품명</th>
			<th class="border-0">총 가격</th>
			<th class="border-0">픽업상태</th>
			<th class="border-0 rounded-end" >픽업예정일시</th>
		</tr>
	</thead>
	<tbody id="tbd">
		<c:forEach var="list" items="${resProdList}">
			<tr class="list">
				<td>${list.store.name }<input type="hidden" value="${list.prodResNo}"></td>
				<td>${list.product.prodName } 등</td>
				<td><fmt:formatNumber value="${list.paymentAmt}" pattern="#,###"/></td>
				<td>
				<c:set var="YN" value="${list.pickupStatus}"/>
					<c:choose>
						<c:when test="${YN eq 'Y'}">픽업완료</c:when>
						<c:when test="${YN eq 'N'}">픽업대기</c:when>
					</c:choose>
				</td>
				<td>${list.pickupDate} <fmt:formatDate value="${list.pickupTime}" type="time" timeStyle="short"/> </td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>
</div>
</div>
	<form id="pagingFrm" name="pagingForm" action="resProdList" method="get">
		<input type="hidden" id="pageNum" name="pageNum" value="${paging.cri.pageNum }">
		<input type="hidden" id="pageNum" name="amount" value="${paging.cri.amount }">
		<input type="hidden" id="type" name="type" value="${paging.cri.type }">
		<input type="hidden" id="keyword" name="keyword" value="${paging.cri.keyword }">
	</form>
	
	
	<div id="pagingDiv" class="card-footer px-3 border-0 d-flex flex-column flex-lg-row align-items-center justify-content-center">
		<nav aria-label="Page navigation example">	
			<ul class="pagination mb-0">
				<!-- 이전페이지 -->
				<c:if test="${paging.prev }">
					<li class="page-item">
						<a class="page-link" href="${paging.startPage - 1}">이전</a>
					</li>
				
				</c:if>
						<!-- 1 2 3 4   -->
					<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
						<c:if test="${paging.cri.pageNum == num }">
							<li class="page-item active">
								<a class="page-link" href="${num }">${num }</a>&nbsp;
							</li>
						</c:if>
						
						<c:if test="${paging.cri.pageNum != num }">
							<li class="page-time">
								<a class="page-link" href="${num }">${num }</a>&nbsp;
							</li>
						</c:if>
					</c:forEach>
						<!-- 다음페이지 -->	
					<c:if test="${paging.next }">
						<li class="page-item">
							<a id="next" href="${paging.endPage + 1 }">다음</a>
						</li>
					</c:if>
			</ul>	
		</nav>	
	</div>
</div>
</div>	
	
<script>

$(document).ready(function(){
	/* 페이지 번호 이동 id> pageNum > attr로 속성 href줌 */
	$('#pagingDiv a').click(function(e){
		e.preventDefault();
		$('#pageNum').val($(this).attr("href"));
		pagingFrm.submit();
	})
});

//검색 [전체] 선택 시 검색창 비우기
	function allSelected() {
		var selected = document.getElementById("type");
		if (selected.options[selected.selectedIndex].value == 1) {
			document.getElementById("keyword").value = '';
		}
	
	}
// 리스트 클릭시 상세페이지로 이동(예약번호넘겨서)
$("#tbd").on("click", ".list", function(){
	var selectedResNo = $(this).find("input").val();
	console.log(selectedResNo);
	location.href="resProdListByProdName/" + selectedResNo;
});


//밀리초를 날짜(yy-mm-dd)으로 변경.
	//밀리초를 날짜(yy-mm-dd)으로 변경.
	function convertDate1(milliSecond) {

		  const data = new Date(milliSecond);
		  	
		  const year = data.getFullYear();
		  const yy = year.toString().substring(2,4)
		  var month = data.getMonth() + 1;
		  var date = data.getDate();
		
		  
		  if (month < 10) month = "0"+month;
		  if (date < 10) date = "0"+date;

		  return `\${yy}-\${month}-\${date}`;
		}
	
	
//밀리초를 시간(오전/오후 hh:mm)으로 변경	
function convertDate2(milliSecond) {
	 
	  const data = new Date(milliSecond);
	 
	  var hour = data.getHours();
	  var minute = data.getMinutes();
	
	  if(hour<10 || minute<10){
		  var chour = "0"+hour;
		  var cminute = "0"+minute;
	  }  
	  
	  if(hour>=12){
		  return `오후 \${chour}:\${cminute}`;
	  }else{
		  return `오전 \${chour}:\${cminute}`;
	  }
	  
	}



</script>
</body>

</html>