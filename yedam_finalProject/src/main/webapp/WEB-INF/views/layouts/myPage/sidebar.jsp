<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- 마이페이지 사이드바 -->
<nav id="sidebarMenu" class="sidebar d-lg-block bg-gray-800 text-white collapse" data-simplebar>
  <div class="sidebar-inner px-4 pt-3">

	<!-- 사이드바 메뉴 -->
    <ul class="nav flex-column pt-3 pt-md-0">
    
      <li class="nav-item">
        <a href="${pageContext.request.contextPath}" class="pt-4 d-flex align-items-center">
          <span class="sidebar-icon">
            <img src="${pageContext.request.contextPath}/resources/img/logo_transparent_inverted.png" height="60px">
          </span>
        </a>
      </li>
      
      <!-- 구분선 -->
   	  <li role="separator" class="dropdown-divider mt-4 mb-3 border-gray-700"></li>
   	  


		<c:choose>
			<c:when test="${user.memType eq '00101' }">
		<!-- 	관리자 -->
				
				<li class="nav-item">
					<a href="${pageContext.request.contextPath}/announcement/adminList" class="nav-link">
						<span class="sidebar-icon">
							<svg class="icon icon-xs me-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"></path></svg>
						</span> 
						<span class="sidebar-text">공지사항관리</span>
					</a>
				</li>
				
				<li class="nav-item">
					<span class="nav-link  collapsed  d-flex justify-content-between align-items-center" data-bs-toggle="collapse" data-bs-target="#submenu-app">
						<span>
							<span class="sidebar-icon">
								<svg class="icon icon-xs me-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
									<path d="M4 3a2 2 0 100 4h12a2 2 0 100-4H4z"></path>
									<path fill-rule="evenodd" d="M3 8h14v7a2 2 0 01-2 2H5a2 2 0 01-2-2V8zm5 3a1 1 0 011-1h2a1 1 0 110 2H9a1 1 0 01-1-1z" clip-rule="evenodd"></path>
								</svg>
							</span> 
							<span class="sidebar-text">등록신청목록</span>
						</span>
						<span class="link-arrow">
							<svg class="icon icon-sm" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
						</span>
					</span>
					
					<!-- 하위 메뉴 -->
					<div class="multi-level collapse" role="list" id="submenu-app" aria-expanded="true">
						<ul class="flex-column nav">
							<li class="nav-item ">
								<a class="nav-link" href="${pageContext.request.contextPath}/exhibition/exRegAppList">
									<span class="sidebar-text">전시</span>
								</a>
							</li>
							<li class="nav-item ">
								<a class="nav-link" href="${pageContext.request.contextPath}/store/approvalList">
									<span class="sidebar-text">매장</span>
								</a>
							</li>
						</ul>
					</div>
					
				</li>
				
				<li class="nav-item">
					<a href="${pageContext.request.contextPath}/member/updateInfo" class="nav-link">
						<span class="sidebar-icon">
							<svg class="icon icon-xs me-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
								<path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"></path>
							</svg>
						</span> 
						<span class="sidebar-text">회원정보수정</span>
					</a>
				</li>
				
			</c:when>
			
			<c:when test="${user.memType eq '00102' }">
		<!-- 	일반회원 -->
			
				<li class="nav-item">
					<span class="nav-link  collapsed  d-flex justify-content-between align-items-center" data-bs-toggle="collapse" data-bs-target="#submenu-app">
						<span>
							<span class="sidebar-icon">
								<svg class="icon icon-xs me-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"></path></svg>
							</span> 
							<span class="sidebar-text">내 예약 목록</span>
						</span>
						<span class="link-arrow">
							<svg class="icon icon-sm" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
						</span>
					</span>
					
					<!-- 하위 메뉴 -->
					<div class="multi-level collapse" role="list" id="submenu-app" aria-expanded="true">
						<ul class="flex-column nav">
							<li class="nav-item ">
								<a class="nav-link" href="${pageContext.request.contextPath}/exhibition/exSelectAllReservation">
									<span class="sidebar-text">전시</span>
								</a>
							</li>
							<li class="nav-item ">
								<a class="nav-link" href="${pageContext.request.contextPath}/store/resProdList">
									<span class="sidebar-text">매장</span>
								</a>
							</li>
						</ul>
					</div>
					
				</li>
				
				<li class="nav-item">
					<a href="${pageContext.request.contextPath}/member/updateInfo" class="nav-link">
						<span class="sidebar-icon">
							<svg class="icon icon-xs me-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
								<path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"></path>
							</svg>
						</span> 
						<span class="sidebar-text">회원정보수정</span>
					</a>
				</li>
				
			</c:when>
			
			
			<c:otherwise>
		<!-- 	사업자회원 -->
			
		<!--  		변수 설정 -->
				<c:choose>
					<c:when test="${user.buisnessType eq '00201'}">
						<c:set var="buisness" value="show" />
						<c:set var="buisnessName" value="공연" />
					</c:when>
					<c:when test="${user.buisnessType eq '00202'}">
						<c:set var="buisness" value="exhibition" />
						<c:set var="buisnessName" value="전시" />
					</c:when>
					<c:when test="${user.buisnessType eq '00203'}">
						<c:set var="buisness" value="facility" />
						<c:set var="buisnessName" value="시설" />
					</c:when>
					<c:when test="${user.buisnessType eq '00204'}">
						<c:set var="buisness" value="store" />
						<c:set var="buisnessName" value="매장" />
					</c:when>
				</c:choose>
		
				
				<li class="nav-item">
					<a href="${pageContext.request.contextPath}/${buisness }/provider/registration" class="nav-link">
						<span class="sidebar-icon">
							<svg class="icon icon-xs me-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
								<path d="M4 3a2 2 0 100 4h12a2 2 0 100-4H4z"></path>
								<path fill-rule="evenodd" d="M3 8h14v7a2 2 0 01-2 2H5a2 2 0 01-2-2V8zm5 3a1 1 0 011-1h2a1 1 0 110 2H9a1 1 0 01-1-1z" clip-rule="evenodd"></path>
							</svg>
						</span> 
						<span class="sidebar-text">${buisnessName } 등록 신청</span>
					</a>
				</li>
				
				<li class="nav-item">
					<c:if test="${buisness eq 'exhibition' }">
						<a href="${pageContext.request.contextPath}/${buisness }/provider/exhibitionList" class="nav-link">
							<span class="sidebar-icon">
								<svg class="icon icon-xs me-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"></path></svg>
							</span> 
							<span class="sidebar-text">내 ${buisnessName } 목록</span>
						</a>
					</c:if>
					<c:if test="${buisness eq 'store' }">
						<span class="nav-link  collapsed  d-flex justify-content-between align-items-center" data-bs-toggle="collapse" data-bs-target="#submenu-app">
							<span>
								<span class="sidebar-icon">
									<svg class="icon icon-xs me-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path><path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path></svg>
								</span> 
								<span class="sidebar-text">매장 관리</span>
							</span>
							<span class="link-arrow">
								<svg class="icon icon-sm" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
							</span>
						</span>
						
						<!-- 하위 메뉴 -->
						<div class="multi-level collapse" role="list" id="submenu-app" aria-expanded="true">
							<ul class="flex-column nav">
								<li class="nav-item ">
									<a class="nav-link" href="${pageContext.request.contextPath}/${buisness }/product/management">
										<span class="sidebar-text">상품 관리</span>
									</a>
								</li>
								<li class="nav-item ">
									<a class="nav-link" href="${pageContext.request.contextPath}/store/product/proReSelectAll ">
										<span class="sidebar-text">예약 목록</span>
									</a>
								</li>
								<li class="nav-item ">
									<a class="nav-link" href="${pageContext.request.contextPath}/store/product/statisticsForm?storeNo=${storeNo}">
										<span class="sidebar-text">통계 목록</span>
									</a>
								</li>
							</ul>
						</div>
					</c:if>
					
				</li>
				
				
				<li class="nav-item">
					<a href="${pageContext.request.contextPath}/member/updateInfo" class="nav-link">
						<span class="sidebar-icon">
							<svg class="icon icon-xs me-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
								<path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"></path>
							</svg>
						</span> 
						<span class="sidebar-text">회원정보수정</span>
					</a>
				</li>
				
			</c:otherwise>
		</c:choose>
   	  
   	  
   	  	<li role="separator" class="dropdown-divider mt-4 mb-3 border-gray-700"></li>
   	  
    </ul>
  </div>
</nav>
<!-- 마이페이지 사이드바 끝 -->

