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
	
	<h3>상품 예약 목록</h3>
	
	<table>
		<thead>
			<tr align="center">
				<td>예약번호</td>
				<td>예약자이름</td>
				<td>픽업일시</td>
				<td>결제여부</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${proReSelectAll }" var="proRe">
				<tr>
					<td><a href="proReDetail?prodResNo=${proRe.prodResNo }">${proRe.prodResNo }</a>
					
					</td>
					<td>${proRe.name }</td>
					<td><fmt:formatDate value="${proRe.pickupTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
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
	<form id="pagingFrm" name="pagingFrm" action="proReSelectAll" method="get">
		<input type="hidden" id="pageNum" name="pageNum" value="${paging.cri.pageNum }">
		<input type="hidden" id="pageNum" name="amount" value="${paging.cri.amount }">
		<input type="hidden" id="type" name="type" value="${paging.cri.type }">
		<input type="hidden" id="keyword" name="keyword" value="${paging.cri.keyword }">
	</form>
	<c:if test="${user.memType eq '00103' }">
		<button>sadfsadfasf</button>
	</c:if>
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
</script>
</html>