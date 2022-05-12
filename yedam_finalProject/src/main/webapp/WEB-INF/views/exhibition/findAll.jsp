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
						<th width="150">내용</th>
						<th width="150">작성자</th>
						<th width="150">등록일</th>
						<th width="150">상태</th>
					</tr>
				</thead>

							
				<tbody>
					<c:forEach items="${exhibitions}" var="exhibition">

							<tr onclick="location.href='findOne?annNo=${exhibition. }'">
								<td>${exhibition. }</td>
								<td>${exhibition. }</td>
								<td>${exhibition. }</td>
								<td>관리자</td>
								<td>${exhibition.}</td>
								<td>${exhibition.}</td>
							</tr>
					</c:forEach>
				</tbody>
			</table>
			<form id="pagingFrm" name="pagingForm" action="findAll" method="get">
				<input type="hidden" id="type" name="type" value="${paging.cri.type }">
				<input type="hidden" id="keyword" name="keyword" value="${paging.cri.keyword }">
			</form>


	<div>	
		<form action="findAll" method="get" name="searchForm" autocomplete="off">
				<div>
					<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력해주세요." value="${keyword }">
					<button id="searchBtn">검색</button>
				</div>
		</form>
		</div>
	</div><br>
</div>





</body>




</html>