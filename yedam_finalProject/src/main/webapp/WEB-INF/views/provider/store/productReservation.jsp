<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

</head>
<body>
<div class="row justify-content-center">
	<div class="col-8">
		<h3>상품 예약 목록</h3>
		<div class="card border-0 shadow mb-4">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-centered table-nowrap mb-0 rounded" id="boardtable">
						<thead class="thead-light">
							<tr class="border-0 rounded-start">
								<th class="border-0 rounded-start display-3">예약번호</th>
								<th class="border-0">예약자이름</th>
								<th class="border-0">픽업일시</th>
								<th class="border-0 rounded-end">결제여부</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${proReSelectAll }" var="proRe">
								<tr  onclick="hrefDetail(${proRe.prodResNo })">
									<td><a href="proReDetail?prodResNo=${proRe.prodResNo }">${proRe.prodResNo }</a>
									
									</td>
									<td><a href="proReDetail?prodResNo=${proRe.prodResNo }">${proRe.name }</a></td>
									<td><fmt:formatDate value="${proRe.pickupDate}" pattern="yyyy-MM-dd"/>   <fmt:formatDate value="${proRe.pickupTime }" type="time"/></td>
									<td>
									 
										<c:set var="paymentStatus" value="Y"/>
											<c:choose>
												<c:when test="${proRe.paymentStatus eq 'Y' }">
													결제완료
												</c:when>
												
												<c:when test="${proRe.paymentStatus eq 'N' }">
													취소
												</c:when>
												
												<c:otherwise>
													미결제
												</c:otherwise>	
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
	<form id="pagingFrm" name="pagingFrm" action="proReSelectAll" method="get">
		<input type="hidden" id="pageNum" name="pageNum" value="${paging.cri.pageNum }">
		<input type="hidden" id="pageNum" name="amount" value="${paging.cri.amount }">
		<input type="hidden" id="type" name="type" value="${paging.cri.type }">
		<input type="hidden" id="keyword" name="keyword" value="${paging.cri.keyword }">
	</form>
<%-- 	<c:if test="${user.memType eq '00103' }">
		<button>sadfsadfasf</button>
	</c:if> --%>
	<div id="pagingDiv" class="card-footer px-3 border-0 d-flex flex-column flex-lg-row align-items-center justify-content-center">
		<nav aria-label="Page navigation example">	
			<!-- 이전페이지 -->
			<c:if test="${paging.prev }">
				<li class="page-item">
					<a a class="page-link" href="${paging.startPage - 1}">이전</a>
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
					<a a class="page-link" id="next" href="${paging.endPage + 1 }">다음</a>
				</li>	
			</c:if>
		</nav>	
	</div>
</body>

<script>
		$(document).ready(function(){
			/* 페이지 번호 이동 id> pageNum > attr로 속성 href줌 */
			$('#pagingDiv a').click(function(e){
				e.preventDefault();
				$('#pageNum').val($(this).attr("href"));
				pagingFrm.submit();
			})
		});
		
		function hrefDetail(n){
			 location.href="proReDetail?prodResNo="+n;
		}
</script>
</html>