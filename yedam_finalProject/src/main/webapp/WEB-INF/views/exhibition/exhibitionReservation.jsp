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
	
	
	<div id="search">
		<form name="searchfrm" method="get" action="exSelectAllReservation">
					<select id="sel" name="type">
						<option value="" <c:out value="${paging.vo.type == null?'selected':'' }" />>전체</option>
						<option value="exResNo" <c:out value="${paging.vo.type eq 'exResNo'?'selected':'' }" />>예약번호</option>
						<option value="name" <c:out value="${paging.vo.type eq 'name'?'selected':'' }" />>전시명</option>
					</select>
					<input type="text" name="keyword" id="input"/>
					<button id="searchBtn">검색</button>
		</form>
	</div>


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
		<tbody>
			<c:forEach items="${exhibitionReservationVO }" var="exRes">
				<tr class="list">
				
					<td>${exRes.exResNo }</td>
					<td>
					<a href="exhibitionReservationDetail?exResNo=${exRes.exResNo}">${exRes.name }	</a>
					
						<!--<c:out value="${exRes.name }"/> -->
					
					</td>
					<td><fmt:formatDate value="${exRes.startDate }" pattern="yyyy-MM-dd"/></td>
					<td>
						<c:set var="paymentStatus" value="N"/>
							<c:choose>
								<c:when test="${exRes.paymentStatus eq 'N' }">
									미결제
								</c:when>
								
								<c:when test="${exRes.paymentStatus eq 'Y' }">
									결제
								</c:when>
								
								<c:otherwise>
									취소
								</c:otherwise>
							</c:choose>
					
					</td>
					<td>${exRes.payment }</td>
					<td><button>리뷰작성</button></td>
				</tr>
			
			</c:forEach>
			
			
			
			
		</tbody>
	</table>
	
	
	<div id="pagingDiv">
				<c:if test="${paging.prev }">
					<a href="${paging.startPage - 1 }">이전</a>
				</c:if>
				
				<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
					&nbsp;<a href="${num }">${num }</a>&nbsp;
				</c:forEach>
				
				<c:if test="${paging.next }">
					<a id="next" href="${paging.endPage + 1 }">다음</a>
				</c:if>
	</div>
			
			<form id="pagingFrm" name="pagingForm" action="exSelectAllReservation" method="get">
				<input type="hidden" id="pageNum" name="pageNum" value="${paging.vo.pageNum }">
				<input type="hidden" id="amount" name="amount" value="${paging.vo.amount }">
			</form>
</body>

<script type="text/javascript">
	$(document).ready(function(){
		
		//페이지 번호 이동
		$('#pagingDiv a').click(function(e){
			e.preventDefault();
			$('#pageNum').val($(this).attr("href"));
			pagingForm.submit();
			
		});
		
		//게시글에 pageNum넘기기
// 		$('table a').click(function(e){
// 			e.preventDefault();
// 			var html = "<input type='hidden' name='ex_res_no' value='" +$(this).attr("href")+"'>";
			
// 			$('#pagingFrm').append(html);
// 			$('#pagingFrm').attr("action", "exSelectAllReservation");
// 			$('#pagingFrm').submit();
// 		})
		
	});
	
	
	
	// 검색
// 	$("#searchBtn").on("click",function(){
// 		var selectedVal = $("#sel option:selected").val()
// 		if(selectedVal == "exResNo") {
// 			$.ajax({
// 				url: "exSelectAllReservation",
// 				method : "GET",
// 				data : {exResNo:$("#input").val()},
// 			}).done(function(data){
// 				$("")
// 			})
// 		}
// 	})
</script>
</html>