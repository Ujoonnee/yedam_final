<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항 상세(단순조회)</title>
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
	
	function fn_zipFileDown(fileNo){
		var formObj = $("form[name='readForm']");
		$("#FILE_NO").attr("value", fileNo);
		formObj.attr("action", "zipFileDown");
		formObj.submit();
	}
	
</script>
<div class="row justify-content-center">
	<hr>
	<div class="col-8">
		<div class="form-control">
			<div class="display-3">공지사항 상세페이지(단순조회)</div>
			<hr>
			<section>
					<form name="readForm" role="form" method="post">
						<input name="seq" type="hidden" value="${announcement.annNo}" />
						<input type="hidden" id="FILE_NO" name="fileNo" value="">
					</form>
			</section>
					<div align="center" class="row my-4">
							<dl><dd class="text-dark mb-0 display-4">${announcement.title}</dd></dl>
					</div>
					<hr>
				
					<div  class="input-group row">
						<dl class="col-6 row display-6">
							<dt class="col-4 display-6"><span>작성자</span></dt>
							<dd class="col-8 border-start display-6">관리자</dd>
						</dl>
						<dl class="col-6"></dl>
					</div>
					
					<hr>
					<div class="input-group row">
						<dl class="col-4 row">
							<dt class="col-6 display-6"><span class="border-start" padding : 100px 0;>등록일</span></dt>
							<dd class="col-6 display-6"><fmt:formatDate value="${announcement.annDate }" pattern="yyyy-MM-dd"/></dd>
						</dl>
						<dl class="col-4"></dl>
							<dl class="col-4 row" align="right">
							<dt class="col-8 display-6"><span>조회수</span></dt>
							<dd class="col-4 display-6">${announcement.annView }</dd>
						</dl>
					</div>
					<hr class="mb-4">	
					<div class="row mb-4 mb-lg-5">
							
								<div class="col-8">
									<div>
										<p class="text-dark mb-0">${announcement.annContent }</p>
									</div>
								</div>
							<div class="col-2"></div>
					</div>
				<hr>
			<div>
						<div class="mb-3  display-6">파일 목록</div>
						<div>
							<c:forEach var="file" items="${file}">
								<td><input type="checkbox" name="" value="${file.FILE_NO}"><a class="form-control" style="width:350px" href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORIGINAL_NAME} (${file.FILE_SIZE}kb)</a></td><br>
							</c:forEach>
							<div>zip으로 다운 이벤트 걸꺼 들어올곳</div>
							<form action="zipFileDown">
								<input type="submit">
							</form>
						</div>
			</div>
			
				<hr>
			<div align="right">
				<button type="button" id="list" class="btn btn-tertiary" onclick="location.href='list'">글 목록</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
 		//글 목록
		$('#list').click(function(e){
			e.preventDefault();
			var $form = $('<form></form>');
			$form.attr('action','list');
			$form.attr('method','get');
			$form.appendTo('body');
			
			$form.submit();
		});
 
</script>
</html>