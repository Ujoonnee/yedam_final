<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<nav class="navbar navbar-top navbar-expand navbar-dashboard navbar-dark ps-0 pe-2 pb-0">
	<div class="d-flex justify-content-between w-100" id="navbarSupportedContent">
		<div class="d-flex align-items-center"></div>
		<div class="d-flex my-2" id="navbarSupportedContent" align="right">
			<c:if test="${empty user }">
				<a href="" onclick="window.open('${pageContext.request.contextPath}/member/sign-in','sign-in','width=600,height=500')">로그인</a>　 |　 
				<a href="${pageContext.request.contextPath}/member/sign-up">회원가입</a>　  
			</c:if>
			<c:if test="${not empty user }">
			
				<ul class="navbar-nav align-items-center">
					<li class="nav-item dropdown ms-lg-3">
						<a class="nav-link dropdown-toggle pt-1 px-0" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<div class="media d-flex align-items-center">
								<div class="media-body ms-2 text-dark align-items-center d-none d-lg-block">
									<span class="mb-0 fw-bold text-gray-900">${user.name }</span>
									<span style="color: black;">님 안녕하세요!　 |　 마이페이지　 </span>
								</div>
							</div>
						</a>
						
						<!-- 유저 버튼 목록 -->
						<div class="dropdown-menu dashboard-dropdown dropdown-menu-end mt-2 py-1">
							<a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/member/myPage">
								<svg class="dropdown-icon text-gray-400 me-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-6-3a2 2 0 11-4 0 2 2 0 014 0zm-2 4a5 5 0 00-4.546 2.916A5.986 5.986 0 0010 16a5.986 5.986 0 004.546-2.084A5 5 0 0010 11z" clip-rule="evenodd"></path></svg>
								마이페이지
							</a>
							<div role="separator" class="dropdown-divider my-1"></div>
							<a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/member/logout">
								<svg class="dropdown-icon text-danger me-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path></svg>                
								로그아웃
							</a>
						</div>
					</li>
				</ul>
			</c:if>
		</div>
	</div>
	
</nav>	


<div class="row justify-content-center">
	<div class="col-4 mb-3 text-center">
		<a href="${pageContext.request.contextPath}"><img src="<c:url value='/resources/img/logo_transparent.png'/>" width="300px"></a>
	</div>
</div>
	
<div class="row mt-2 text-center justify-content-center align-middle" id="topbar">
	<div class="col-2 px-3 h4 border-end">
		<a href="${pageContext.request.contextPath}/announcement/list">공지사항</a>
	</div>
	<div class="col-2 px-3 h4 border-start border-end">
		<a href="${pageContext.request.contextPath}/exhibition/list">전시</a>
	</div>
	<div class="col-2 px-3 h4 border-start">
		<a id="storeList" href="${pageContext.request.contextPath}/store/searchList?type=1&keyword=&pageNum=1&latitude=&longitude=">매장</a>
	</div>
</div>

<hr class="my-0">

<script>
	
	let xVal = '';
	let yVal = '';
	let locationName = '';
	
	const userAddress = '${user.address}';
	if (userAddress != '')	{ 
		$.ajax({
			url:"https://dapi.kakao.com/v2/local/search/address.json?query="+encodeURIComponent(userAddress),
			type : "GET",
			headers: {'Authorization' : 'KakaoAK ee381ad2653c27997305ec26eef7c94b'},
			success:function(data){
				console.log(data)
				xVal = data.documents[0].x;
				yVal = data.documents[0].y;
				locationName = data.documents[0].address_name;
				$('#storeList').attr('href','${pageContext.request.contextPath}/store/searchList?type=1&keyword=&pageNum=1&latitude='+xVal+'&longitude='+yVal+'&nowLocation='+locationName);
			},
			error : function(e){
				console.log(e);
			}
		}); 
	};
	

</script>
