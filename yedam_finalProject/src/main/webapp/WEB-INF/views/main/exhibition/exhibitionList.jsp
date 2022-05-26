<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
		<select id="address" name="exVO.address"
			onchange="allSelected()">
				<option value="">전체</option>
				<option value="서울"<c:out value="${paging.cri.exVO.address eq '서울'? 'selected': '' }" />>서울특별시</option>
				<option value="부산"<c:out value="${paging.cri.exVO.address eq '부산'? 'selected': '' }" />>부산광역시</option>
				<option value="대구"<c:out value="${paging.cri.exVO.address eq '대구'? 'selected': '' }" />>대구광역시</option>
				<option value="인천"<c:out value="${paging.cri.exVO.address eq '인천'? 'selected': '' }" />>인천광역시</option>
				<option value="광주"<c:out value="${paging.cri.exVO.address eq '광주'? 'selected': '' }" />>광주광역시</option>
				<option value="대전"<c:out value="${paging.cri.exVO.address eq '대전'? 'selected': '' }" />>대전광역시</option>
				<option value="울산"<c:out value="${paging.cri.exVO.address eq '울산'? 'selected': '' }" />>울산광역시</option>
				<option value="제주"<c:out value="${paging.cri.exVO.address eq '제주'? 'selected': '' }" />>제주특별시</option>
		</select>
		<div>
			<div>기간</div>
			<div>
			<input type = "date"  id="startDate" name = "exVO.startDate" value='<fmt:formatDate value="${paging.cri.exVO.startDate }" pattern= "yyyy-MM-dd"/>'> ~
			<input type = "date"  id ="endDate" name = "exVO.endDate" value='<fmt:formatDate value="${paging.cri.exVO.endDate }" pattern= "yyyy-MM-dd"/>' >
			</div>
		</div>
		<div>전시명</div>
			<input type="hidden" id="pageNum" name="pageNum" value="1">
		<input type="text" id="keyword" name="keyword" placeholder =" 검색어를 입력해주세요." value="${paging.cri.keyword }" size="40">&nbsp;
		<button id = "searchBtn" >버튼</button>&nbsp;
		<button type="button" onclick="resetForm()">초기화</button>
	</form>
		
	<form id="frm" method="get">
		<table class="table">
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
	function resetForm(){
		document.getElementById('keyword').value = '';
		document.getElementById('address').value = '';
		document.getElementById('startDate').value = '';
		document.getElementById('endDate').value = '';
		
	}
	/* 페이지 번호 이동 id> pageNum > attr로 속성 href줌 */
	$(document).ready(function(){
		$('#pagingDiv a').click(function(e){
			e.preventDefault();
			$('#pageNum').val($(this).attr("href"));
			
			searchForm.submit();
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