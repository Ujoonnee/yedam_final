<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
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
		<div>
			<button type="button" id = "location_now" name ="location_now" onclick = "locationN()">현재 위치</button>
		</div>
		<form action ="searchList" method="post" name="searchForm" autocomplete="off">
			<select id="type" name="type"
				onchange="allSelected()">
					<option value="1">전체</option>
					<option value="name"<c:out value="${paging.cri.type eq 'name'? 'selected': '' }" />>매장명</option>
					<option value="store_cat"<c:out value="${paging.cri.type eq 'store_cat'? 'selected': '' }" />>카테고리</option>
					<option value="prod_name"<c:out value="${paging.cri.type eq 'prod_name'? 'selected': '' }" />>상품명</option>
			</select>
			<input type="text" id="keyword" name="keyword" placeholder =" 검색어를 입력해주세요." value="${keyword}" size="40">&nbsp;
			<button id = "searchBtn" >버튼</button>&nbsp;
		</form>
	</div>
	
	<!-- 	매장목록 -->
	<div>
		<form id ="frm" method ="get">
			<table id ="contents">
				<c:if test="${empty storeList }">
					<tr><td align ="center">등록된 매장이 없습니다.</td></tr>
				</c:if>
				<c:if test="${not empty storeList }">
					<c:forEach items="${storeList }" var = "list">
						<tr height="150px" onclick ="storeView(${list.storeNo})" >
							<td align = "center">${list.thumbnail }</td>
							<td align = "center">${list.name }</td>
							<td align = "center">${list.address }</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<input type = "hidden" id = "store_no" name ="store_no">
		</form>
	</div>
	
	<form id="pagingFrm" name="pagingForm" action="list" method="get">
		<input type="hidden" id="pageNum" name="pageNum" value="${paging.cri.pageNum }">
		<input type="hidden" id="pageNum" name="pageNum" value="${paging.cri.amount }">
		<input type="hidden" id="type" name="type" value="${paging.cri.type }">
		<input type="hidden" id="keyword" name="keyword" value="${paging.cri.keyword }">
	</form>
	
	<div id="pagingDiv">
		<!-- 이전페이지 -->
		<c:if test="${paging.prev }">
			<a href="${paging.startPage - 1}">이전</a>
		</c:if>
			<!-- 1 2 3 4   -->
		<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
		&nbsp;<a href="${num }">${num }</a>&nbsp;
		</c:forEach>
			<!-- 다음페이지 -->	
		<c:if test="${paging.next }">
			<a id="next" href="${paging.endPage + 1 }">다음</a>
		</c:if>
	</div>
</div>

<script>

	$(document).ready(function(){
		/* 페이지 번호 이동 id> pageNum > attr로 속성 href줌 */
		$('#pagingDiv a').click(function(e){
			e.preventDefault();
			$('#pageNum').val($(this).attr("href"));
			pagingForm.submit();
		})
	});
		
	// 검색 [전체] 선택 시 검색창 비우기
	function allSelected() {
		var selected = document.getElementById("type");
		if (selected.options[selected.selectedIndex].value == 1) {
			document.getElementById("keyword").value = '';
		}
	
	}
	// 상점 클릭시 공지사항 번호를 넘겨줌
	function storeView(n) {
		frm.store_no.value = n;
		frm.action = "product/productView";
		frm.submit();
	}
// 	현재위치 재설정
	function locationN() {
		new daum.Postcode({
			oncomplete : function(data) {
				console.log(data)
				$.ajax({
					url:"https://dapi.kakao.com/v2/local/search/address.json?query="+encodeURIComponent(data.address + ' '+data.buildingName),
					type : "GET",
					headers: {'Authorization' : 'KakaoAK ee381ad2653c27997305ec26eef7c94b'},
				success:function(xy){
					console.log(xy);
					sessionStorage.setItem("latitude",xy.documents[0].y);
					sessionStorage.setItem("longitude",xy.documents[0].x);
					location.href = "list";
				},
				error : function(e){
					console.log(e);
				}
				
				});
			}
		}).open();
	}
	
	
// 	// 검색
// 	function searchList() {
// 		$.ajax({
// 			url : "searchList",
// 			type : "post",
// 			data : {
// 				"type" : $("#searchKey").val(),
// 				"keyword" : $("#keyword").val()
// 			},
// 			dataType : "json",
// 			success : function(result) {
// 				if (result.length > 0) {
// 					searchResult(result); //json data>> html
// 				} else {
// 					alert("검색 결과가 존재하지 않습니다.");
// 				}
// 			}
// 		});
// }
</script>
</body>
</html>