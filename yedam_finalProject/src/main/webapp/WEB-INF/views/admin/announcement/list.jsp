<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
	#space{
		background-color: gainsboro;
	}
</style>
 <link rel="stylesheet" href="svg.css">
 <script src="js/modernizr-custom.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function() { 
	$("input:checkbox").change(function(){
		
		if($(this).is(":checked")){
			$("#changeStatus").show("fast");
			$("#delete").show("fast");
			$("#selectStatus").show("fast"); 
			/* document.getElementById("changeStatus").style.display = "inline";
			document.getElementById("delete").style.display = "inline";
			document.getElementById("selectStatus").style.display = "inline"; */  
		 }else{
			$("#changeStatus").hide("fast");
			$("#delete").hide("fast");
			$("#selectStatus").hide("fast"); 
		}
	})
})
		/* $(document).ready(function(){
		$(".chk").change(function(){
			document.getElementById("show").hide();	
			if($(".chk").is(":checked")){
				document.getElementById("show").toggle();		
		}else{
			document.getElementById("show").toggle();	
		}
			
	
	})
})   */
</script>
<h1>공지사항</h1>
<div>	
	<form action="list" method="post" name="searchForm" autocomplete="off">
			<div>
				<div class="input-group" style="width:500px;" align="center">
					<select name="type" class="form-select" style="width:10%;">
						<option value="" selected>선택</option>
						<option value="title" <c:out value="${paging.cri.type eq 'title'?'selected':'' }" />>제목</option>
						<option value="annContent" <c:out value="${paging.cri.type eq 'annContent'?'selected':'' }" />>내용</option>
					</select>
	
					<input type="text" class="form-control" style="width:40%;" name="keyword" id="keyword" placeholder="검색어를 입력해주세요." value="${keyword }">
					<button id="basic-addon2" style="width:10%; background-color=gainsboro" class="btn btn-tertiary,input-group-text"><svg class="icon icon-xs text-gray-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg></button>
				</div>
			</div>
	</form>
</div>
	
<br>
<form action="statusUpdates" method="post">
	<div class="card border-0 shadow mb-4">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-centered table-nowrap mb-0 rounded" id="boardtable">
					<thead class="thead-light">
						<tr class="border-0 rounded-start">
							<th class="border-0 rounded-start">선택</th>
							<th class="border-0">N O</th>
							<th class="border-0">제목</th>
							<th class="border-0">내용</th>
							<th class="border-0">등록일</th>
							<th class="border-0 rounded-end">상태</th>
						</tr>
					</thead>
								
					<tbody>
					
						<c:forEach items="${topList}" var="announcement">
								<tr>
									<td><button type="submit" class="unfixBtn, btn btn-tertiary" name="lists" formaction="topStatus" value="${announcement.annNo }">상단해제</button></td>
									<td>${announcement.annNo }</td>
									<td>${announcement.title }</td>
									<td><a class="text-primary fw-bold" href="annDetail?annNo=${announcement.annNo }">${announcement.annContent }</a></td>
									<td>${announcement.annDate }</td>
									<td>
										<span>${announcement.status}</span>
									</td>
								</tr>
						</c:forEach>
				
					<tr id="space" height="1px"><td colspan="7" style="height:1px;"></td></tr>
						
						<c:forEach items="${list }" var="announcement">
								<tr>
									<td><input type="checkbox" id="chk" name="lists" class="form-check-input" value="${announcement.annNo }"></td>
									<td>${announcement.annNo }</td>
									<td>${announcement.title }</td>
									<td><a href="annDetail?annNo=${announcement.annNo }">${announcement.annContent }</a></td>
									<td>${announcement.annDate }</td>
									<td><span>${announcement.status}</span></td>
								</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- 	상태변경 -->
	<div class="mb-4">
			<select id="selectStatus" class="form-select" name="status" style="display:none; width:80px;">
				<option value="00501" selected>선택</option>
				<option value="00501">공개</option>
				<option value="00502">상단고정</option>
				<option value="00503">비공개</option>
			</select>
			<input type="submit" id="changeStatus" class="btn btn-tertiary" value="상태변경" style="display:none;">
			<input type="submit" id="delete" class="btn btn-tertiary" formaction="statusDelete" name="status" value="삭제" style="display:none;">
			<button type="button" class="btn btn-tertiary" onclick="location.href='insertPage'">글작성</button>		
	</div>
</form>



<form id="pagingFrm" name="pagingForm" action="list" method="post">
	<input type="hidden" id="pageNum" name="pageNum" value="${paging.cri.pageNum }">
	<input type="hidden" id="pageNum" name="pageNum" value="${paging.cri.amount }">
	<input type="hidden" id="type" name="type" value="${paging.cri.type }">
	<input type="hidden" id="keyword" name="keyword" value="${paging.cri.keyword }">
</form>

<!-- 페이징 처리 -->
<div id="pagingDiv" class="card-footer px-3 border-0 d-flex flex-column flex-lg-row align-items-center justify-content-between">
	<nav aria-label="Page navigation example">
			<ul class="pagination mb-0">	<!-- 이전페이지 -->
				<c:if test="${paging.prev }">
					<li class="page-item">
						<a class="page-link" href="${paging.startPage - 1}">이전</a>
					</li>
				</c:if>
					<!-- 1 2 3 4   -->
				<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
				&nbsp;
					<li class="page-item">
						<a class="page-link" href="${num }">${num }</a>&nbsp;
					</li>
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
$('#pagingDiv a').click(function(e){
		e.preventDefault();
		$('#pageNum').val($(this).attr("href"));
		pagingForm.submit();
	});

	$('#chk'${theCount.count}).click( () => event.stopPropagation());   
	
	

</script>
</body>
</html>