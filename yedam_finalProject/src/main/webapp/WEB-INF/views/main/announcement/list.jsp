<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<h1>공지사항</h1>
<div>
	<form action="list" method="post" name="searchForm" autocomplete="off">
		<select name="type">
			<option value="" selected>선택</option>
			<option value="title"
				<c:out value="${paging.cri.type eq 'title'?'selected':'' }" />>제목</option>
			<option value="annContent"
				<c:out value="${paging.cri.type eq 'annContent'?'selected':'' }" />>내용</option>
		</select>

		<div>
			<input type="text" name="keyword" id="keyword"
				placeholder="검색어를 입력해주세요." value="${keyword }">
			<button id="searchBtn">검색</button>
		</div>
	</form>
</div>

<br>

<div class="card border-0 shadow mb-4">
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-centered table-nowrap mb-0 rounded"
				id="boardtable">
				<thead class="thead-light">
					<tr class="border-0 rounded-start">
						<th class="border-0">N O</th>
						<th class="border-0">제목</th>
						<th class="border-0">등록일</th>
						<th class="border-0 rounded-end">상태</th>
					</tr>
				</thead>

				<tbody>

					<c:forEach items="${topList}" var="announcement">
						<tr>

							<td style="width: 10%">${announcement.annNo }</td>
							<td style="width: 55%"><a class="text-primary fw-bold"
								href="annDetail?annNo=${announcement.annNo }&pageNum=${paging.cri.pageNum }">${announcement.title }</a></td>
							<td style="width: 15%">${announcement.annDate }</td>
							<td style="width: 10%"><span>${announcement.status}</span></td>
						</tr>
					</c:forEach>

					<!-- 	<tr><td colspan="7">&nbsp;</td></tr> -->

					<tr id="space" height="1px"><td colspan="7" style="height:1px;"></td></tr>
						<c:forEach items="${list }" var="announcement">
								<tr>
									<td>${announcement.annNo }</td>
									<td><a class="text-primary fw-bold" href="annDetail?annNo=${announcement.annNo }&pageNum=${paging.cri.pageNum }">${announcement.title }</a></td>
									<td>${announcement.annDate }</td>
									<td><span>${announcement.status}</span></td>
								</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
<form id="pagingFrm" name="pagingForm" action="list" method="post">
	<input type="hidden" id="pageNum" name="pageNum"
		value="${paging.cri.pageNum }"> <input type="hidden"
		id="pageNum" name="pageNum" value="${paging.cri.amount }"> <input
		type="hidden" id="type" name="type" value="${paging.cri.type }">
	<input type="hidden" id="keyword" name="keyword"
		value="${paging.cri.keyword }">
</form>

<!-- 페이징 처리 -->
<div id="pagingDiv" class="card-footer px-3 border-0 d-flex flex-column flex-lg-row align-items-center justify-content-center">
		<nav aria-label="Page navigation example">
				<ul class="pagination mb-0">	<!-- 이전페이지 -->
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
						<li class="page-item">
							<a class="page-link" href="${num }">${num }</a>&nbsp;
						</li>
					</c:if>
					</c:forEach>
						<!-- 다음페이지 -->	
					<c:if test="${paging.next }">
						<li class="page-item">
							<a id="next" class="page-link" href="${paging.endPage + 1 }">다음</a>
						</li>
					</c:if>
				</ul>
		</nav>
</div>




<script type="text/javascript">
	/* 페이지 번호 이동 id> pageNum > attr로 속성 href줌 */
	$('#pagingDiv a').click(function(e) {
		e.preventDefault();
		$('#pageNum').val($(this).attr("href"));
		pagingForm.submit();
	});
</script>
</body>
</html>