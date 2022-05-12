<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- body 헤더 -->
<div align = "center" id ="container">
	<section id ="page_header" class="single-page-header">
	<div class="container">
		<h2>매장목록</h2>
	 </div>
	</section>
<!-- 	검색창 -->
	<div>
		<select id="searchKey" name="searchKey"
					onchange="allSelected()">
						<option value="1">전체</option>
						<option value="name">매장명</option>
						<option value="store_cat">카테고리</option>
						<option value="prod_name">상품명</option>
				</select>
				<input type="text" id="searchVal" name="searchVal" size="40">&nbsp;
				<input type="button" onclick="searchList()" value="검색">&nbsp;
	</div>
<!-- 	매장목록 -->
<table id ="contents">
	<c:if test="${empty storeList }">
		<tr><td colspan ="3">등록된 매장이 없습니다.</td></tr>
	</c:if>
	<c:if test="${not empty storeList }">
		<c:forEach items="${storeList }" var = "list">
			<tr height="150px">
				<td>${list.thumbnail }</td>
				<td>${list.name }</td>
				<td>${list.address }</td>
			</tr>
		</c:forEach>
	</c:if>
</table>
</div>
<script>
// 검색 [전체] 선택 시 검색창 비우기
function allSelected() {
	var selected = document.getElementById("searchKey");
	if (selected.options[selected.selectedIndex].value == 1) {
		document.getElementById("searchVal").value = '';
	}

}

// 검색
function searchList() {
	$.ajax({
		url : ".do",
		type : "post",
		data : {
			"key" : $("#searchKey").val(),
			"val" : $("#searchVal").val()
		},
		dataType : "json",
		success : function(result) {
			if (result.length > 0) {
				searchResult(result); //json data>> html
			} else {
				alert("검색 결과가 존재하지 않습니다.");
			}
		}
	});
}
</script>
</body>
</html>