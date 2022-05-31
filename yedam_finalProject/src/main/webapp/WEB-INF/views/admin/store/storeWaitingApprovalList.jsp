<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상점등록신청목록</title>
</head>
<body>
<form id="form1" name="form1"action ="searchApprovalList" method="post" autocomplete="off">
<select id="selectDate" name="applicationDate">
	<option value="">날짜선택</option>
	<option value="1" <c:out value="${paging.cri.applicationDate eq '1'? 'selected': '' }" /> >빠른순</option>
	<option value="2"<c:out value="${paging.cri.applicationDate eq '2'? 'selected': '' }" />>오래된순</option>
</select>

<select id="selectBox" name="approvalType">
	<option value="">승인여부선택</option>
	<option value="00401"<c:out value="${paging.cri.type eq '00401'? 'selected': '' }" />>승인</option>
	<option value="00402"<c:out value="${paging.cri.type eq '00402'? 'selected': '' }" />>반려</option>
	<option value="00403"<c:out value="${paging.cri.type eq '00403'? 'selected': '' }" />>대기</option>
</select>
<select id="sel" name="type">
	<option value="">선택</option>
	<option value="storeName"<c:out value="${paging.cri.type eq 'storeName'? 'selected': '' }" />>매장명</option>
	<option value="pname"<c:out value="${paging.cri.type eq 'pname'? 'selected': '' }" />>사업자명</option>
</select>
<input type="text" id="input" name = "keyword"  placeholder =" 검색어를 입력해주세요." value="${keyword}">
<button type="button" id="searchBtn">검색</button>
</form>

<table>
	<tr>
		<td>매장등록번호</td>
		<td>매장명</td>
		<td>사업자명</td>
		<td>신청일</td>
		<td>승인여부</td>
	</tr>
	<tbody id="tbd">
		<c:forEach var="reg"  items="${regList}">
			<tr class="list">
				<td>${reg.storeNo}</td>
				<td>${reg.name}</td>
				<td>${reg.memNo}</td>
				<td><fmt:formatDate value="${reg.applicationDate}" pattern="yyyy-MM-dd"/></td>
				<td>${reg.approvalStatus}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

	<form id="pagingFrm" name="pagingForm" action="approvalList" method="get">
		<input type="hidden" id="pageNum" name="pageNum" value="${paging.cri.pageNum }">
		<input type="hidden" id="pageNum" name="amount" value="${paging.cri.amount }">
		<input type="hidden" id="type" name="type" value="${paging.cri.type }">
		<input type="hidden" id="keyword" name="keyword" value="${paging.cri.keyword }">
		<input type ="hidden" name="approvalType" value ="${paging.cri.approvalType }">
		<input type ="hidden" name="orderDate" value ="${paging.cri.applicationDate }">
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
<script>
		
	$(document).ready(function(){
		/* 페이지 번호 이동 id> pageNum > attr로 속성 href줌 */
		$('#pagingDiv a').click(function(e){
			e.preventDefault();
			$('#pageNum').val($(this).attr("href"));
			pagingFrm.submit();
		})
	});
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