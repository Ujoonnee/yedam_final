<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
<h1>공지사항</h1>
	<div align="center">
		<div>
			<h1>공지사항</h1>
		</div>
	<div>
								<!-- 검색 자동완성 기능은 아직 보류 -->
		
			<table border="1" id="boardtable">
				<thead>
					<tr>
						<th width="50">N O</th>
						<th width="150">제목</th>
						<th width="150">작성자</th>
						<th width="150">등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${announcements}" var="announcement">
							<tr>
								<td>${announcement.announcementSerial }</td>
								<td>${announcement.announcementTitle }</td>
								<td>${announcement.announcementWriter }</td>
								<td>${announcement.announcementDate }</td>
							</tr>
					</c:forEach>
				</tbody>
			</table>
			<form id="pagingFrm" name="pagingForm" action="findAll" method="get">
				<input type="hidden" id="pageNum" name="pageNum" value="${paging.cri.pageNum }">
				<input type="hidden" id="pageNum" name="pageNum" value="${paging.cri.amount }">
				<input type="hidden" id="type" name="type" value="${paging.cri.type }">
				<input type="hidden" id="keyword" name="keyword" value="${paging.cri.keyword }">
			</form>


	<div>	
		<form action="findAll" method="get" name="searchForm" autocomplete="off">
				<select name="type">
					<option value="" selected>선택</option>
					<option value="announcementTitle" selected>제목</option>
					<option value="announcementContent" <c:out value="${paging.cri.type eq 'announcementContent'?'selected':'' }" />>내용</option>
				</select>

				<div>
					<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력해주세요." value="${keyword }">
					<button id="searchBtn">검색</button>
				</div>
		</form>
		</div>
	</div><br>
</div>





</body>


<!-- 페이징 처리 -->
<div id="pagingDiv">
			<!-- 이전페이지 -->
		<c:if test="${paging.prev }">
			<a href="${paging.startPage - 1}">이전</a>
		</c:if>
			<!-- 1 2 3 4   -->
		<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
		&nbsp;<a href="${num } ">${num }</a>&nbsp;
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
			pagingForm.submit();
		});
	
	$('table a').click(function(e){
			e.preventDefault();
			var html = "<input type='hidden' name='announcementSerial' value='"+$(this).attr("href")+"'>";
			$('#pagingFrm').append(html);
			$('#pagingFrm').attr("action", "findOne");
			$('#pagingFrm').submit();
		});
});

</script>
</html>