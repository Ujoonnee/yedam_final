<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<h1>공지사항</h1>
<div>	
	<form action="announcement" method="post" name="searchForm" autocomplete="off">
			<select name="type">
				<option value="" selected>선택</option>
				<option value="title" <c:out value="${paging.cri.type eq 'title'?'selected':'' }" />>제목</option>
				<option value="annContent" <c:out value="${paging.cri.type eq 'annContent'?'selected':'' }" />>내용</option>
			</select>

			<div>
				<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력해주세요." value="${keyword }">
				<button id="searchBtn">검색</button>
			</div>
	</form>
</div>
	
<br>

<table border="1" id="boardtable">
	<thead>
		<tr>
			<th width="100">N O</th>
			<th width="50">제목</th>
			<th width="150">내용</th>
			<th width="150">작성자</th>
			<th width="150">등록일</th>
		</tr>
	</thead>
				
	<tbody>
	
		<c:forEach items="${topList}" var="announcement">
				<tr onclick="location.href='annDetail?annNo=${announcement.annNo }'">
					<td>${announcement.annNo }</td>
					<td>${announcement.title }</td>
					<td>${announcement.annContent }</td>
					<td>관리자</td>
					<td>${announcement.annDate }</td>
				</tr>
		</c:forEach>
		
	<!-- 	<tr><td colspan="7">&nbsp;</td></tr> -->
		
		<c:forEach items="${list }" var="announcement">
				<tr onclick="location.href='annDetail?annNo=${announcement.annNo }'">
					<td>${announcement.annNo }</td>
					<td>${announcement.title }</td>
					<td>${announcement.annContent }</td>
					<td>관리자</td>
					<td>${announcement.annDate }</td>
				</tr>
		</c:forEach>
	</tbody>
</table>
<form id="pagingFrm" name="pagingForm" action="announcement" method="post">
	<input type="hidden" id="pageNum" name="pageNum" value="${paging.cri.pageNum }">
	<input type="hidden" id="pageNum" name="pageNum" value="${paging.cri.amount }">
	<input type="hidden" id="type" name="type" value="${paging.cri.type }">
	<input type="hidden" id="keyword" name="keyword" value="${paging.cri.keyword }">
</form>

<!-- 페이징 처리 -->
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
	/* 페이지 번호 이동 id> pageNum > attr로 속성 href줌 */
$('#pagingDiv a').click(function(e){
		e.preventDefault();
		$('#pageNum').val($(this).attr("href"));
		pagingForm.submit();
	});


	// 상단고정 해제
	$('.unfixBtn').click( () => {
		event.stopPropagation();
		
		const unfix = confirm('상단고정 해제?');
		
		if (!unfix) return;
		
		const memNo = $(event.target.parentNode).next().html();
		
		
	})

	$('.chk').click( () => event.stopPropagation()); 
	
	

</script>
</body>
</html>