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
	<script src="resources/jQuery/jquery-3.4.1.min.js"></script>
</head>
<body>
	<h1>공지사항 상세</h1>
	<hr>
	<form id="frm" action="update" method="post">
		<input name="seq" type="hidden" value="${announcement.annNo}" />
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
			
		</table>
	</form>
	<button type="button" id="list" onclick="location.href='announcement'">글 목록</button>
	
</body>
<script type="text/javascript">
		//글 목록
		$('#list').click(function(e){
			e.preventDefault();
			var $form = $('<form></form>');
			$form.attr('action','findAll');
			$form.attr('method','get');
			$form.appendTo('body');
			
			$form.append("<input type='hidden' name='pageNum' value='<c:out value='${cri.pageNum}'/>'>");
			$form.append("<input type='hidden' name='amount' value='<c:out value='${cri.amount}'/>'>");
			$form.submit();
		});
	});
</script>
</html>