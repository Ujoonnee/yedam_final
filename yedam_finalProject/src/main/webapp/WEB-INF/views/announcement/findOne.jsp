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
		<input name="seq" type="hidden" value="${announcement.announcementSerial}" />
		<table border="1">
			<tr>
				<td bgcolor="orange" width="70">제목</td>
				<td align="left"><input id="title" name="title" type="text"
					value="${announcement.announcementTitle}" /></td>
			</tr>
			<tr>
				<td bgcolor="orange">작성자</td>
				<td align="left">${announcement.announcementWriter}</td>
			</tr>
			<tr>
				<td bgcolor="orange">내용</td>
				<td align="left"><textarea id="content" name="content" cols="40" rows="10">${announcement.announcementContent }</textarea></td>
			</tr>
			<tr>
				<td bgcolor="orange">등록일</td>
				<td align="left"><fmt:formatDate value="${announcement.announcementDate }" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td bgcolor="orange">조회수</td>
				<td align="left">${announcement.announcementView }</td>
			</tr>
			<c:if test="${announcement.announcementWriter eq '관리자'}">
				<tr>
					<td colspan="2" align="center"><input type="button" id="update" value="글 수정" />
				</tr>
			</c:if>
		</table>
	</form>
	
	<hr>
		<a href="insertPage">글 쓰기</a>&nbsp;&nbsp;&nbsp; 
		<a href="delete?announcementSerial=${announcement.announcementSerial }">글 삭제</a>&nbsp;&nbsp;&nbsp;
		<a id="list" href="findAll">글 목록</a>
		<a href="updatePage">수정하기</a>
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