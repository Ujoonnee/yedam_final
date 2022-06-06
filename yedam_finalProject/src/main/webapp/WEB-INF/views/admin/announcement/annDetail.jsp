<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항 상세(admin)</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<script>
//클릭시 addFile부분 실행되서 파일 추가버튼이 추가됨. 삭제버튼도 추가됨.
	$(document).ready(function(){
		var formObj = $("form[name='updateForm']");
		
		$(document).on("click", "#fileDel", function(){
			$(this).parent().remove();
			
		})
		fn_addFile();
	
	
	//  업데이트 폼 아래 경고 문구가 뜰 시 수정이 안되게 만들어둠.
	// required 쓸지
	$(".update_btn").on("click", function(){
		if(fn_valiChk()){
			return false;
		} 
		formObj.attr("action", "annUpdate")
		formObj.attr("method", "post");
		formObj.submit();
		})
	})
	
	
	// 제목에 아무값이 없을시 경고 문구 알럴트로 띄워줌 경고 문구
	function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
	// 윗줄에 파일 추가버튼으로 추가된 버튼임 이게 업로드 하려는 파일 처리하는 기능임
	function fn_addFile(){
		var fileIndex = 1;
		$(".fileAdd_btn").on("click", function(){
		$("#fileIndex").append("<div class='input-group mb-3 mt-3' style='width:300px;'><input type='file' class='form-control' style='float:left; width:80%;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' class='btn btn-sm btn-primary' style='float:right; width:20%;' id='fileDelBtn'>"+"삭제"+"</button></div>")
		})
		// 삭제 버튼 누를 시 상태가 Y N값으로 변경되는 건데 이건 아예 삭제되게 만들어야함
		// 
		 $(document).on("click","#fileDelBtn", function(){
			$(this).parent().remove();
		})
	} 
	
	// 파일삭제 
	var fileNoArry = new Array();
	var fileNameArry = new Array();
	
	function fn_del(value, name, replacename){
		
		fileNoArry.push(value);
		fileNameArry.push(name);
		$("#fileNoDel").attr("value", fileNoArry);
		$("#fileNameDel").attr("value", fileNameArry);
	}
	
</script>
<body>


	<h1>공지사항 수정</h1>
	<hr>
<div class="row justify-content-center">
	<div class="col-10">
	<section>
		<form name="updateForm" action="admin/annUpdate" role="form" method="post" enctype="multipart/form-data">
			<input name="annNo" type="hidden" value="${announcement.annNo }" />
			<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
			<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
				<table>
					<tr>
						<th>제목</th>
					</tr>
					<tr style="width:300px">
						<td><input class="form-control" id="title" name="title" type="text"
							value="${announcement.title}" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>내용</th>
					</tr>
					<tr class="mb-4">
						<td id="substr"><textarea class="form-control" style="width: 800px; height: 300px;" name="annContent"><c:out value="${announcement.annContent }"/></textarea></td> 
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>상태사항</th>
					</tr>
					
					<tr>
						<td>
							<select name="status" class="form-control" style="width: 200px">
								<option value="00501" selected>공개여부</option>
								<option value="00501">공개</option>
								<option value="00502">우선순위</option>
								<option value="00503">비공개</option>
								<option value="00504">삭제</option>	
							</select>
						</td>
					</tr>			
					
				</table>
			<hr>
			<div>
				<div class="mb-4">파일 목록</div>
					<c:forEach var="file" items="${file}" varStatus="var">
						<div style="width:500px" class="input-group mb-3">	
								<input type="hidden" id="FILE_NO" name="fileNo_${var.index }" value="${file.FILE_NO}" >
								<input type="hidden" id="FILE_NAME" name="fileName" value="FILE_NO_${var.index}">
								<input type="hidden" name="fileReName" value="${file.replaced_Name }">
								<a class="form-control" href="#" id="fileName" onclick="return false;">${file.ORIGINAL_NAME}(${file.FILE_SIZE}kb)</a>
								<button id="fileDel" onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index }');" type="button" class="btn btn-sm btn-primary">삭제</button>
						</div>
					</c:forEach>
				<hr>
				<div id="fileIndex">첨부파일 추가 &nbsp;<button type="button" class="fileAdd_btn btn btn-sm btn-primary">파일추가</button></div>
			</div>
			<div>&nbsp;</div>
			<input type="hidden" name="pageNum" value="${param.pageNum}">
			<hr>
			<div align="right">
				<button type="button" class="update_btn btn btn-tertiary">수정</button>
				&nbsp;&nbsp;
				<button type="button" class="btn btn-gray-200" id="list" onclick="location.href='adminList'">취소</button>
			</div>
		</form>
</section>
</div>
</div>

	<!-- TODO 업데이트 스크립트 짤것. 파일업로드 삭제 버튼 수정좀 할것 -->
	<!--  -->
</body>

<script type="text/javascript">
 		//글 목록
	$('#list').click(function(e){
			e.preventDefault();
			var $form = $('<form></form>');
			$form.attr('action','adminList');
			$form.attr('method','get');
			$form.appendTo('body');
			
			$form.submit();
		});
	 
</script>
</html>