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
	$(document).ready(function(){
		var formObj = $("form[name='updateForm']");
		
		$(document).on("click", "#fileDel", function(){
			$(this).parent().remove();
		})
		fn_addFile();
	})
	

</script>
<body>

	<h1>공지사항 수정</h1>
	<hr>
	<section>
			<form name="updateForm" role="form" method="post">
				<input name="seq" type="hidden" value="${announcement.annNo}" />
				<input type="hidden" id="FILE_NO" name="fileNo" value="">
			</form>
	</section>
	<form id="frm" action="update" method="post" enctype="multipart/form-data">
		
		<table border="1">
			<tr>
				<td bgcolor="" width="70">제목</td>
				<td align="left"><input id="title" name="title" type="text"
					value="${announcement.title}" /></td>
			</tr>
			<tr>
				<td bgcolor="">작성자</td>
				<td align="left">관리자</td>
			</tr>
			<tr>
				<td bgcolor="">내용</td>
				<td><textarea style="width: 538px; height: 200px;"disabled><c:out value="${announcement.annContent }"/></textarea></td> 
			</tr>
			<tr>
				<td bgcolor="">등록일</td>
				<td align="left"><fmt:formatDate value="${announcement.annDate }" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td bgcolor="">조회수</td>
				<td align="left">${announcement.annView }</td>
			</tr>
			
			<tr>
				<td>
					<select>
						<option value="" disabled="disabled" selected>공개여부</option>
						<option value="00201">공개</option>
						<option value="00202">비공개</option>
						<option value="00203">우선순위</option>
						<option value="00204">삭제</option>	
					</select>
				</td>
			</tr>			
			
		</table>
	</form>
	
	<div>
				<div>파일 목록</div>
		<div id="fileIndex">
			<c:forEach var="file" items="${file}">
					<input type="hidden" id="FILE_NO" name="fileNo_${var.index }" value="${file.FILE_NO}" >
					<input type="hidden" id="FILE_NAME" name="fileName" value="FILE_NO_${var.index}">
					<a href="#" id="fileName" onclick="return false;">${file.ORIGINAL_NAME}</a>(${file.FILE_SIZE}kb)<br>
					<button id="fileDels" onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index }');" type="button">삭제</button>
			</c:forEach>
		</div>
	</div>
	<button type="button" id="list" onclick="location.href='announcement'">글 목록</button>
	
	<!-- TODO 업데이트 스크립트 짤것. 파일업로드 삭제 버튼 수정좀 할것 -->
	<!--  -->
</body>
<script type="text/javascript">
 		//글 목록
		/* $('#list').click(function(e){
			e.preventDefault();
			var $form = $('<form></form>');
			$form.attr('action','findAll');
			$form.attr('method','get');
			$form.appendTo('body');
			
			$form.append("<input type='hidden' name='pageNum' value='<c:out value='${cri.pageNum}'/>'>");
			$form.append("<input type='hidden' name='amount' value='<c:out value='${cri.amount}'/>'>");
			$form.submit();
		});
	});  */
</script>
</html>