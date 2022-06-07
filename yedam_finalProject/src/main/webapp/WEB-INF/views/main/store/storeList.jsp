<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
<div class = "row justify-content-center">
	<div class = "col-8">
		<div align = "center">
			<!-- 	검색창 -->
			<div class="card border-0 shadow mb-4">
				<div class="card-body">
					<form action ="searchList" method="get" name="searchForm" autocomplete="off">
						<button type="button" id = "location_now" class="btn btn-lg  btn-outline-gray-500"  onclick = "locationN()">현재 위치</button><br>
						<div>
							<input type="text" style=" border:none; " id = "nowLocation" disabled="disabled" value="${paging.cri.nowLocation }" >
						</div>
						<select id="type" name="type" class = "form-select" onchange="allSelected()">
							<option value="1">전체</option>
							<option value="name"<c:out value="${paging.cri.type eq 'name'? 'selected': '' }" />>매장명</option>
							<option value="prod_name"<c:out value="${paging.cri.type eq 'prod_name'? 'selected': '' }" />>상품명</option>
						</select>
						<div class= "col-lg-8" style = "float : left; padding-left: 20px">
							<input type="text" id="keyword" name="keyword" class="form-control" placeholder =" 검색어를 입력해주세요." value="${paging.cri.keyword }" size="40">&nbsp;
						</div>
						<input type="hidden" id="pageNum" name="pageNum" value="${paging.cri.pageNum }">
						<input type ="hidden" name="latitude" value ="${paging.cri.latitude }">
						<input type ="hidden" name="longitude" value ="${paging.cri.longitude }">
						<input type ="hidden" name="nowLocation" value ="${paging.cri.nowLocation }">
						<button id = "searchBtn" class="btn btn-outline-gray-500" >검색</button>&nbsp;
					</form>
				</div>
			</div>

			<!-- 	매장목록 -->
						<c:if test="${empty storeList }">
							<div >등록된 매장이 없습니다.</div>
						</c:if>
						
						<c:if test="${not empty storeList }">
							<div class="card border-0 shadow mb-4">
							<form id ="frm" method ="get">
							  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" style="padding :9px;">
								<c:forEach items="${storeList }" var = "list">
								  <div class="col" >
								
								  	<c:if test= "${not empty list.thumbnail}">
										<div class="card shadow-sm" onclick ="storeView(${list.storeNo} , '${list.name }')"  >
											<img src="/store/${list.thumbnail } "  class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 사진" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">${list.name } </text></src>
											
											<div class="card-body">
											<div class="d-flex justify-content-between align-items-center">
									            <div class="btn-group">
													<small class="card-text">${list.address }</small>
											  	</div>
									        </div>
											</div>
										</div>
									</c:if>
								  	<c:if test= "${empty list.thumbnail}">
										<div class="card shadow-sm" onclick ="storeView(${list.storeNo} , '${list.name }')"  >
											<img src="https://www.jindo.go.kr/themes/home/images/content/no_image.jpg"  class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 사진" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">${list.name }</text></src>
											
											<div class="card-body">
											<div class="d-flex justify-content-between align-items-center">
									            <div class="btn-group">
									            <small class="card-text">${list.address }</small>
											  	</div>
									        </div>
											</div>
										</div>
									</c:if>
									
									
									
									
									
								</div>
								</c:forEach>
							</div>
							<input type = "hidden" id = "storeNo" name ="storeNo">
							<input type = "hidden" id = "storeName" name ="storeName">
							</form>
							</div>
						</c:if>
					
			
			<div id="pagingDiv" class="card-footer px-3 border-0 d-flex flex-column flex-lg-row align-items-center justify-content-center">
				<nav aria-label="Page navigation example">
					<ul class="pagination mb-0">
						<!-- 이전페이지 -->
						<c:if test="${paging.prev }">
							<li class="page-item">
								<a class="page-link" href="${paging.startPage - 1}">이전</a>
							</li>
						</c:if>
							<!-- 1 2 3 4   -->
						<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
							<c:if test="${paging.cri.pageNum == num }">
								<li class="page-item active">
								&nbsp;<a class="page-link" href="${num }">${num }</a>&nbsp;
								</li>
							</c:if>
						</c:forEach>
							<!-- 다음페이지 -->	
						<c:if test="${paging.next }">
							<li class="page-item">
								<a class="page-link" id="next" href="${paging.endPage + 1 }">다음</a>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>
<script>
	
	$(document).ready(function(){
		/* 페이지 번호 이동 id> pageNum > attr로 속성 href줌 */
		$('#pagingDiv a').click(function(e){
			e.preventDefault();
			$('#pageNum').val($(this).attr("href"));
			searchForm.submit();
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
	function storeView(n,m) {
		frm.storeNo.value = n;
		frm.storeName.value = m;
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
					
					$('input[name=latitude]').attr('value',xy.documents[0].y);
					$('input[name=longitude]').attr('value',xy.documents[0].x);
					$('input[name=nowLocation]').attr('value',xy.documents[0].address_name);
					console.log(document.getElementById('nowLocation').value)
					searchForm.submit();
// 					XYget(xy.documents[0].y,xy.documents[0].x);
					
				},
				error : function(e){
					console.log(e);
				}
				
				});
			}
		}).open();
	}
	
</script>
</body>
</html>