<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="row justify-content-center">
	<div class="col-8">
		<h3>내 예약 정보</h3>
		
			<form name="frm" method="POST" action="exSelectAllReservation">
				<div align="center" class="mb-5">	
					<div class="input-group" align="center" style="width:500px">
						<select class="form-select" name="type"  class="form-select" style="width: 20%">
							<option value="">--선택--</option>
							<option value="exResNo" <c:out value="${paging.vo.type eq 'exResNo'?'selected':'' }" />>예약번호</option>
							<option value="name" <c:out value="${paging.vo.type eq 'name'?'selected':'' }" />>전시명</option>
						</select>
					
						<input class="form-control" style="width: 60%" type="text" id="searchKeyword" name="keyword" placeholder="검색어를 입력하세요." value="${keyword }"/>
						<button class="input-group-text" id="topbar-addon2">
		                	<svg class="icon icon-xs text-gray-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg>
		                </button>
					</div>
				</div>
			
		
			</form>
			<div class="card border-0 shadow mb-4">
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-centered table-nowrap mb-0 rounded" id="boardtable">
							<thead class="thead-light">
								<tr class="border-0 rounded-start">
									<th class="border-0 rounded-start display-3">예약번호</th>
									<th class="border-0">전시명</th>
									<th class="border-0">예약전시일</th>
									<th class="border-0">금액</th>
									<th class="border-0 rounded-end">결제여부</th>
								</tr>
							</thead>
							<tbody id="tbd">
								<c:forEach items="${exhibitionReservationVO }" var="exRes">
									<tr class="list">
									
										<td>${exRes.exResNo }</td>
										<td>
										<%-- <a href="exhibitionReservationDetail?exResNo=${exRes.exResNo}"> --%>${exRes.name }	<input type="hidden" value="${exRes.exResNo}"><!-- </a> -->
										
											<!--<c:out value="${exRes.name }"/> -->
										
										</td>
										<td><fmt:formatDate value="${exRes.exDate }" pattern="yyyy-MM-dd hh:mm"/></td>
										<td><fmt:formatNumber value="${exRes.paymentAmt }" pattern="#,###"/></td>
										<td>
											<c:set var="status" value="N"/>
												<c:choose>
													<c:when test="${exRes.paymentStatus eq 'N' }">
														취소
													</c:when>
													
													<c:when test="${exRes.paymentStatus eq 'Y' }">
														결제
													</c:when>
													
													<c:when test="${exRes.paymentStatus eq 'R' }">
														취소신청
													</c:when>
												</c:choose>
										
										</td>
										
									</tr>
								
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
	</div>	
</div>
	<form id="pagingFrm" name="pagingForm" action="exSelectAllReservation" method="get">
		<input type="hidden" id="pageNum" name="pageNum" value="${paging.vo.pageNum }">
		<input type="hidden" id="amount" name="amount" value="${paging.vo.amount }">
		<input type="hidden" id="type" name="type" value="${paging.vo.type }">
		<input type="hidden" id="keyword" name="keyword" value="${paging.vo.keyword }">
	</form>
	
	<!-- 페이징처리 -->
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
					<c:if test="${paging.vo.pageNum == num }">
						<li class="page-item active">	
							<a class="page-link" href="${num }">${num }</a>&nbsp;
						</li>
					</c:if>	
					
					<c:if test="${paging.vo.pageNum != num }">
						<li class="page-time">
							<a class="page-link" href="${num }">${num }</a>&nbsp;
						</li>
					</c:if>
				
				</c:forEach>
					<!-- 다음페이지 -->	
				<c:if test="${paging.next }">
					<li class="page-item">
						<a class="page-link" id="next" href="${paging.endPage + 1 }">다음</a>
					</li>
				</c:if>
			</ul>	
		</nav>	
	</div>
	
<script type="text/javascript">

$(document).ready(function(){
	/* 페이지 번호 이동 id> pageNum > attr로 속성 href줌 */
	$('#pagingDiv a').click(function(e){
		e.preventDefault();
		$('#pageNum').val($(this).attr("href"));
		pagingFrm.submit();
	})
});

//리스트 클릭시 상세페이지로 이동(예약번호넘겨서)
$("#tbd").on("click", ".list", function(){
	var selectedResNo = $(this).find("input").val();
	console.log(selectedResNo);
	location.href="exhibitionReservationDetail/" + selectedResNo;
});
</script>
</body>
</html>