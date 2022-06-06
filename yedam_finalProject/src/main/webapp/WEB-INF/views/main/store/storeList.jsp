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
<script type = "importmap">

{
	"imports": {
	     "three": "https://unpkg.com/three@0.141.0/build/three.module.js",
         "GLTFLoader" : "https://unpkg.com/three@0.141.0/examples/jsm/loaders/GLTFLoader.js"
	}
}
</script>

<script type= "module">
	import{GLTFLoader} from 'GLTFLoader';
	import * as THREE from 'three';

	let scene = new THREE.Scene();
	let renderer = new THREE.WebGLRenderer({
		canvas : document.querySelector('#canvas'),
		antialias : true
	});
	renderer.outputEncoding = THREE.sRGBEncoding;

	let camera = new THREE.PerspectiveCamera(30,1);
	camera.position.set(0,0,5);

	scene.background = new THREE.Color('white');

	let loader = new GLTFLoader();
	loader.load('/shiba/scene.gltf', function(gltf){
		scene.add(gltf.scene);
		renderer.render(scene,camera);
		function animate(){
			requestAnimationFrame(animate)
			gltf.scene.rotation.y += 0.02;
			renderer.render(scene, camera);	
	}
	animate()
	});


</script>
<div class = "row justify-content-center">
	<div class = "col-8">
	<!-- body 헤더 -->
		<div align = "center" id ="container">
			<section id ="page_header" class="single-page-header">
			<canvas id="canvas" width="300" height="300"></canvas>
			
				<div class="container">
					<h3 class="display-4" style="text-align: left;" ><a href="list">매장</a> </h3>
				 </div>
			</section>
		<!-- 	검색창 -->
		<hr>
		<p></p>
		<p></p>
		
			<div>
				<form action ="searchList" method="get" name="searchForm" autocomplete="off">
				<div class = "col-lg-10"> 
					<div class="card border-0 shadow mb-4">
						<div class="card-body">
							<div class="col-lg-2 " style = "float : left" >
								<select id="type" name="type" class = "form-select"
									onchange="allSelected()">
										<option value="1">전체</option>
										<option value="name"<c:out value="${paging.cri.type eq 'name'? 'selected': '' }" />>매장명</option>
										<option value="store_cat"<c:out value="${paging.cri.type eq 'store_cat'? 'selected': '' }" />>카테고리</option>
										<option value="prod_name"<c:out value="${paging.cri.type eq 'prod_name'? 'selected': '' }" />>상품명</option>
								</select>
							</div>					
							<div class= "col-lg-8" style = "float : left; padding-left: 20px">
								<input type="text" id="keyword" name="keyword" class="form-control" placeholder =" 검색어를 입력해주세요." value="${paging.cri.keyword }" size="40">&nbsp;
							</div>
								<input type="hidden" id="pageNum" name="pageNum" value="${paging.cri.pageNum }">
								<input type ="hidden" name="latitude" value ="${paging.cri.latitude }">
								<input type ="hidden" name="longitude" value ="${paging.cri.longitude }">
								<input type ="hidden" name="nowLocation" value ="${paging.cri.nowLocation }">
								<button id = "searchBtn" class="btn btn-outline-gray-500" >검색</button>&nbsp;
						</div>
					</div>
				</div>
				<p></p>
				<p></p>
				<div style="clear: left;">
					<button type="button" id = "location_now" class="btn btn-lg  btn-outline-gray-500"  onclick = "locationN()">현재 위치</button><br>
					<div>현재 주소 : <input type="text" style=" border:none; " id = "nowLocation" disabled="disabled" value="${paging.cri.nowLocation }" ></div>
				</div>
				</form>
			</div>
			<p></p>
			<p></p>
			<p></p>
			<!-- 	매장목록 -->
			<div class="form-control">
				<form id ="frm" method ="get">
					<table id ="contents" class="table table-centered table-nowrap mb-0 rounded">
						<c:if test="${empty storeList }">
							<tr><td align ="center">등록된 매장이 없습니다.</td></tr>
						</c:if>
						
						<c:if test="${not empty storeList }">
							<c:forEach items="${storeList }" var = "list">
								<tr class="align-middle" height="150px" onclick ="storeView(${list.storeNo} , '${list.name }')"  >
								<c:if test ="${list.thumbnail != null }">
									<td align = "center"><img src="/store/${list.thumbnail } " class="selected_img"  height="150px" width="150px"></td>
								</c:if>
								<c:if test ="${list.thumbnail == null }">
									<td align = "center"><img src="https://www.jindo.go.kr/themes/home/images/content/no_image.jpg" class="selected_img"  height="150px" width="150px"></td>
								</c:if>
									<td align = "center" class="StoreNameFind">${list.name }</td>
									<td align = "center">${list.address }</td>
							
								</tr>
							</c:forEach>
						</c:if>
					</table>
					<input type = "hidden" id = "storeNo" name ="storeNo">
					<input type = "hidden" id = "storeName" name ="storeName">
				</form>
			</div>
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