<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항 상세</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	
</head>
<script>
	/* 다운로드 */
	function fn_fileDown(fileNo){
		var formObj = $("form[name='readForm']");
		$("#FILE_NO").attr("value", fileNo);
		formObj.attr("action", "fileDown");
		formObj.submit();
	}
	

</script>
<body>

	<h1>공지사항 상세페이지(단순조회)</h1>
	<hr>
	<section>
			<form name="readForm" role="form" method="post">
				<input name="seq" type="hidden" value="${announcement.annNo}" />
				<input type="hidden" id="FILE_NO" name="fileNo" value="">
			</form>
	</section>
		
		<table>
		<tbody>
			<tr class="mb-4">
				<th style="width:100px">제목</th>
				<td align="left">${announcement.title}</td>
			</tr>
			
			<tr>
				<th>작성자</th>
				<td>관리자</td>
			</tr>
			<tr>
				<th bgcolor="">등록일</th>
				<td><fmt:formatDate value="${announcement.annDate }" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<th bgcolor="">조회수</th>
				<td>${announcement.annView }</td>
			</tr>
			
			<tr class="my-4"><td>&nbsp;</td></tr>
			<tr>
				<th></th>
				<td class="form-control" style="width:700px;"><c:out value="${announcement.annContent }" escapeXml="false"/></td> 
			</tr>
		
		</tbody>
			
		</table>
		<hr>
	<div>
				<div>파일 목록</div>
				<div>
					<c:forEach var="file" items="${file}">
						<a class="form-control" style="width:350px" href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORIGINAL_NAME} (${file.FILE_SIZE}kb)</a><br>
					</c:forEach>
				</div>
	</div>
	
		<hr>
		<button type="button" id="list" onclick="location.href='list'">글 목록</button>

	
</body>
<script type="text/javascript">
 		//글 목록
		/* $('#list').click(function(e){
			e.preventDefault();
			var $form = $('<form></form>');
			$form.attr('action','findAll');
			$form.attr('method','get');
			$form.appendTo('body');
			
			$form.submit();
		}); */
 
</script>
</html>