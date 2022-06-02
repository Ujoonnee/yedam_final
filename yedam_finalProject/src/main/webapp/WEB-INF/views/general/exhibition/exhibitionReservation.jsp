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

<h3>내 예약 정보</h3>

	<form name="frm" method="get" action="">
			<label class="hidden"></label>
				<select id="searchCondition" name="searchCondition">
					<option value="none">전체</option>
					<option value="exNo">전시등록번호</option>
					<option value="name">전시명</option>
				</select>
			<label></label>	
				<input type="text" id="searchKeyword" name="searchKeyword" />
				<input type="submit" value="검색">
	
	

	</form>

	<table>
		<thead>
			<tr>
				<th>예약번호</th>
				<th>전시명</th>
				<th>전시일</th>
				<th>결제여부</th>
				<th>금액</th>
				<th>리뷰</th>
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
					<td><fmt:formatDate value="${exRes.startDate }" pattern="yyyy-MM-dd"/></td>
					<td>
						<c:set var="status" value="N"/>
							<c:choose>
								<c:when test="${exRes.paymentStatus eq 'N' }">
									취소
								</c:when>
								
								<c:when test="${exRes.paymentStatus eq 'Y' }">
									결제
								</c:when>
								
								<c:otherwise>
									미결제
								</c:otherwise>
							</c:choose>
					
					</td>
					<td><fmt:formatNumber value="${exRes.paymentAmt }" pattern="#,###"/></td>
					<td><button type="button" class="btn btn-block btn-gray-800 mb-3" id="btnModal" >리뷰작성</button></td>
				</tr>
			
			</c:forEach>
		</tbody>
	</table>
	
	
	<form id="pagingFrm" name="pagingForm" action="resProdList" method="get">
		<input type="hidden" id="pageNum" name="pageNum" value="${paging.vo.pageNum }">
		<input type="hidden" id="pageNum" name="amount" value="${paging.vo.amount }">
		<input type="hidden" id="type" name="type" value="${paging.vo.type }">
		<input type="hidden" id="keyword" name="keyword" value="${paging.vo.keyword }">
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