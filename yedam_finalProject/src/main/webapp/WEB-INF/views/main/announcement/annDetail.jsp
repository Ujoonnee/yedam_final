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
	<style>
  		#back_to_top {  
	     	position:fixed;
	     	color:white;
	     	top: 50%;
	        right: 0%;
	     	background-color:ellowGreen;
	     	block-size:50px;
	     	vertical-align:center;
		}
	</style>
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

<!-- 상단이동 버튼 -->
<div align="center">
	<a class="btn btn-sm btn-primary" href="javascript:window.scrollTo(0,0);" id="back_to_top" style="position:fixed; color:white; background-color:ellowGreen; block-상단이동 버튼px; vertical-align:center;">
		<span>▲</span><br>
		<span>TOP</span>
	</a>
</div>

<div class="row justify-content-center">
	<div class="col-6">
			<div class="display-4 mt-3">공지사항 상세페이지</div>
			<hr>
		<div class="form-control">
			<section>
					<form name="readForm" role="form" method="post">
						<input name="seq" type="hidden" value="${announcement.annNo}" />
						<input type="hidden" id="FILE_NO" name="fileNo" value="">
					</form>
			</section>
					<div align="center" class="text-align-center my-4">
							<dl><dd class="text-dark mb-0 display-5">${announcement.title}</dd></dl>
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
							
								<div class="">
									<div>
										<p class="text-dark mb-0">${announcement.annContent }</p>
									</div>
								</div>
							<div class=""></div>
					</div>
				<hr>

			<div>
				<div class="mb-3  display-6">파일 목록</div>
					<form action="zipFileDown">
						<div>
							<c:forEach var="file" items="${file}">
								<a class="form-control" style="width:350px" href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORIGINAL_NAME} (${file.FILE_SIZE}kb)</a><br>
								<!-- ZIP내리는 부분인데 이건 최종 끝나고 해보자 -->
								<%-- <td><input type="checkbox" name="fileNo" value="${file.FILE_NO }"></td> --%>
							</c:forEach>
								<!-- <input type="submit" value="zipFile"> -->
						</div>
					</form>
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