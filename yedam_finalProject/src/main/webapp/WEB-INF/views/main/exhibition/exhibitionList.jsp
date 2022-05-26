<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div>

	<form action ="searchExhibition" method="get" name="searchForm" autocomplete="off">
		<div>지역</div>
		<select id="exVO.address" name="exVO.address"
			onchange="allSelected()">
				<option value="">전체</option>
				<option value="서울"<c:out value="${paging.cri.type eq 'seoul'? 'selected': '' }" />>서울특별시</option>
				<option value="부산"<c:out value="${paging.cri.type eq 'busan'? 'selected': '' }" />>부산광역시</option>
				<option value="대구"<c:out value="${paging.cri.type eq 'daegu'? 'selected': '' }" />>대구광역시</option>
				<option value="인천"<c:out value="${paging.cri.type eq 'incheon'? 'selected': '' }" />>인천광역시</option>
				<option value="광주"<c:out value="${paging.cri.type eq 'gwangju'? 'selected': '' }" />>광주광역시</option>
				<option value="대전"<c:out value="${paging.cri.type eq 'daejeon'? 'selected': '' }" />>대전광역시</option>
				<option value="울산"<c:out value="${paging.cri.type eq 'ulsan'? 'selected': '' }" />>울산광역시</option>
				<option value="제주"<c:out value="${paging.cri.type eq 'jeju'? 'selected': '' }" />>제주특별시</option>
		</select>
		<div>
			<div>기간</div>
			<div>
			<input type = "date"  name = "exVO.startDate"> ~
			<input type = "date"  name = "exVO.endDate">
			</div>
		</div>
		<div>전시명</div>
		<input type="text" id="keyword" name="keyword" placeholder =" 검색어를 입력해주세요." value="${keyword}" size="40">&nbsp;
		<button id = "searchBtn" >버튼</button>&nbsp;
	</form>
		
	<form id="frm" method="get">
		<table>
		<c:if test = "${empty exhibitionList }">
			<tr><th>전시가없습니다.</th></tr>
		</c:if>
		<c:if test = "${not empty exhibitionList }">
			<c:forEach items="${exhibitionList }" var = "list" >
			<tr onclick = "exhibitionView(${list.exNo})">
				<td>${list.exNo }</td>
				<td>${list.memNo }</td>
				<td>${list.name }</td>
				<td>${list.startDate }</td>
				<td>${list.endDate }</td>
				<td>${list.address }</td>
			</tr>
			</c:forEach>
		</c:if>
		
		</table>
		<input type="hidden" id = "exNo" name= "exNo"/>
	</form>

	<form id="pagingFrm" name="pagingForm" action="searchExhibition" method="get">
		<input type="hidden" id="pageNum" name="pageNum" value="${paging.cri.pageNum }">
		<input type="hidden" id="pageNum" name="pageNum" value="${paging.cri.amount }">
		<input type="hidden" id="type" name="type" value="${paging.cri.type }">
		<input type="hidden" id="keyword" name="keyword" value="${paging.cri.keyword }">
		<input type="hidden"  name="exVO.address" value="${paging.cri.exVO.address }">
		<input type="hidden"  name="exVO.startDate" value="${paging.cri.exVO.startDate }">
		<input type="hidden"  name="exVO.endDate" value="${paging.cri.exVO.endDate }">
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

	/* 페이지 번호 이동 id> pageNum > attr로 속성 href줌 */
	$(document).ready(function(){
		$('#pagingDiv a').click(function(e){
			e.preventDefault();
			$('#pageNum').val($(this).attr("href"));
			pagingForm.submit();
		})
	});
	
	// 검색 [전체] 선택 시 검색창 비우기
	function allSelected() {
		var selected = document.getElementById("type");
		if (selected.options[selected.selectedIndex].value == 1) {
			document.getElementById("keyword").value = '';
		}
	
	}
	function exhibitionView(n){
		frm.exNo.value= n;
		frm.action = "detailView";
		frm.submit();
	}
</script>
</body>
</html>