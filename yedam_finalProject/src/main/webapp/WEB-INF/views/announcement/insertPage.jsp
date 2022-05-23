<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	/* 파일업로드 */
	$(document).ready(function() {
		var formObj = $("form[name='insertFrm']");
		$(".write_btn").on("click", function() {
			if (fn_valiChk()) {
				return false;
			}
			formObj.attr("action", "/announcement/annInsert");
			formObj.attr("method", "post");
			formObj.submit();
		});
		fn_addFile();
	})
	function fn_valiChk() {
		var regForm = $("form[name='insertFrm'] .chk").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
/* 	function fn_addFile(){
		var fileIndex = 1;
		$(".fileAdd_btn").on("click", function(){
			$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>")
		});
		$(document).on("click", "#fileDelBtn", function(){
			$(this).parent().remove();
		});
	} */
	function fn_addFile(){
		var fileIndex = 1;
		//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
		$(".fileAdd_btn").on("click", function(){
			$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
		});
		$(document).on("click","#fileDelBtn", function(){
			$(this).parent().remove();
			
		});
	}	
	
</script>
<body>
	<h1>공지사항 등록 페이지</h1>
	<form name="insertFrm" action="annInsert" method="POST"
		enctype="multipart/form-data">
		<label>제목</label>
		<div>
			<input type="text" name="title">
		</div>
		<br> <label>내용</label>
		<div>
			<textarea name="annContent"></textarea>
		</div>
		<br>
		<div>
			날짜<input type="date" name="annDate">
		</div>
		<br>
		<div>
			<select name="status">
				<option value="" disabled="disabled" selected>공개여부</option>
				<option value="00501">공개</option>
				<option value="00502">우선순위</option>
				<option value="00503">비공개</option>
				<option value="00504">삭제</option>
			</select>
		</div>
		<div>첨부파일</div>
		
		<div>
			<button class="fileAdd_btn" type="button">파일추가</button>
		</div>
		<div id="fileIndex"></div>
		<br>
		<div>
			<input class=".write_btn" type="submit" value="작성"> 
			<input type="button" onclick="list" value="취소">
		</div>
	</form>
	
</body>
</html>