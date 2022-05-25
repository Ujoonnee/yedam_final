<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--

=========================================================
* Volt Pro - Premium Bootstrap 5 Dashboard
=========================================================

* Product Page: https://themesberg.com/product/admin-dashboard/volt-bootstrap-5-dashboard
* Copyright 2021 Themesberg (https://www.themesberg.com)
* License (https://themesberg.com/licensing)

* Designed and coded by https://themesberg.com

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. Please contact us to request a removal.

-->
<!DOCTYPE html>
<html lang="ko">

<head> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Primary Meta Tags -->
<title>Volt Premium Bootstrap Dashboard - Sign up page</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="title" content="Volt Premium Bootstrap Dashboard - Sign up page">
<meta name="author" content="Themesberg">
<meta name="description" content="Volt Pro is a Premium Bootstrap 5 Admin Dashboard featuring over 800 components, 10+ plugins and 20 example pages using Vanilla JS.">
<meta name="keywords" content="bootstrap 5, bootstrap, bootstrap 5 admin dashboard, bootstrap 5 dashboard, bootstrap 5 charts, bootstrap 5 calendar, bootstrap 5 datepicker, bootstrap 5 tables, bootstrap 5 datatable, vanilla js datatable, themesberg, themesberg dashboard, themesberg admin dashboard" />
<link rel="canonical" href="https://themesberg.com/product/admin-dashboard/volt-premium-bootstrap-5-dashboard">

<!-- Open Graph / Facebook -->
<meta property="og:type" content="website">
<meta property="og:url" content="https://demo.themesberg.com/volt-pro">
<meta property="og:title" content="Volt Premium Bootstrap Dashboard - Sign up page">
<meta property="og:description" content="Volt Pro is a Premium Bootstrap 5 Admin Dashboard featuring over 800 components, 10+ plugins and 20 example pages using Vanilla JS.">
<meta property="og:image" content="https://themesberg.s3.us-east-2.amazonaws.com/public/products/volt-pro-bootstrap-5-dashboard/volt-pro-preview.jpg">

<!-- Twitter -->
<meta property="twitter:card" content="summary_large_image">
<meta property="twitter:url" content="https://demo.themesberg.com/volt-pro">
<meta property="twitter:title" content="Volt Premium Bootstrap Dashboard - Sign up page">
<meta property="twitter:description" content="Volt Pro is a Premium Bootstrap 5 Admin Dashboard featuring over 800 components, 10+ plugins and 20 example pages using Vanilla JS.">
<meta property="twitter:image" content="https://themesberg.s3.us-east-2.amazonaws.com/public/products/volt-pro-bootstrap-5-dashboard/volt-pro-preview.jpg">

<!-- Favicon -->
<link rel="apple-touch-icon" sizes="120x120" href="${pageContext.request.contextPath}/resources/assets/img/favicon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/assets/img/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/assets/img/favicon/favicon-16x16.png">
<link rel="manifest" href="${pageContext.request.contextPath}/resources/assets/img/favicon/site.webmanifest">
<link rel="mask-icon" href="${pageContext.request.contextPath}/resources/assets/img/favicon/safari-pinned-tab.svg" color="#ffffff">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="theme-color" content="#ffffff">

<!-- Sweet Alert -->
<link type="text/css" href="${pageContext.request.contextPath}/resources/vendor/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">

<!-- Notyf -->
<link type="text/css" href="${pageContext.request.contextPath}/resources/vendor/notyf/notyf.min.css" rel="stylesheet">

<!-- Volt CSS -->
<link type="text/css" href="${pageContext.request.contextPath}/resources/css/volt.css" rel="stylesheet">

<!-- NOTICE: You can use the _analytics.html partial to include production code specific code & trackers -->



<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<style>
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	body {font-family: 'Jeju Gothic', sans-serif;}
	
	a:not(#loginInfo a) {
		color: black;
		text-decoration: none;
	}
</style>

</head>

<body>

    <!-- NOTICE: You can use the _analytics.html partial to include production code specific code & trackers -->
    

    <main>

        <!-- Section -->
        <section class="vh-lg-100 mt-5 mt-lg-0 bg-soft d-flex align-items-center">
            <div class="container">
                	<div class="row justify-content-center">
	                	<div class="col-2 mb-3">
		                    <a class="d-flex align-items-center justify-content-center" onclick="history.back()">
		                        <svg class="icon icon-xs me-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.707 14.707a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l2.293 2.293a1 1 0 010 1.414z" clip-rule="evenodd"></path></svg>
								<span>돌아가기</span>
		                    </a>
	                	</div>
                    </div>	
                <div class="row justify-content-center">
                    <div class="col-12 d-flex align-items-center justify-content-center">
                        <div class="bg-white shadow border-0 rounded border-light p-4 p-lg-5 w-100 fmxw-500">
                            <div class="text-center text-md-center mb-4 mt-md-0">
                                <h1 class="mb-0 h3">회원가입</h1>
                            </div>
                            
                            
                            <!-- Tab Nav -->
							<div class="nav-wrapper position-relative mb-2 justify-content-between">
							    <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-text" role="tablist">
							        <li class="nav-item">
							            <a class="nav-link mb-sm-3 mb-md-0 active" id="tabs-text-1-tab" data-bs-toggle="tab" href="#tabs-text-1" role="tab" aria-controls="tabs-text-1" aria-selected="true">일반회원</a>
							            <a class="nav-link mb-sm-3 mb-md-0" id="tabs-text-2-tab" data-bs-toggle="tab" href="#tabs-text-2" role="tab" aria-controls="tabs-text-2" aria-selected="false">일반회원2</a>
							        </li>
							        <li class="nav-item d-none">
							            <a class="nav-link mb-sm-3 mb-md-0 " id="tabs-text-2-tab" data-bs-toggle="tab" href="#tabs-text-2" role="tab" aria-controls="tabs-text-2" aria-selected="false">일반회원2</a>
							        </li>
							        <li class="nav-item">
							            <a class="nav-link mb-sm-3 mb-md-0" id="tabs-text-3-tab" data-bs-toggle="tab" href="#tabs-text-3" role="tab" aria-controls="tabs-text-3" aria-selected="false">사업자회원</a>
							        </li>
							        <li class="nav-item d-none">
							            <a class="nav-link mb-sm-3 mb-md-0" id="tabs-text-4-tab" data-bs-toggle="tab" href="#tabs-text-4" role="tab" aria-controls="tabs-text-4" aria-selected="false">사업자회원2</a>
							        </li>
							    </ul>
							</div>
							<!-- End of Tab Nav -->
							<!-- Tab Content -->
							<div class="card border-0">
							    <div class="card-body p-0">
							        <div class="tab-content" id="tabcontent1">
							                
						            	<div class="tab-pane fade show active" id="tabs-text-1" role="tabpanel" aria-labelledby="tabs-text-1-tab">
					                        <form>
					                            <div class="row">
					                                <div class="col-sm-4 mb-2">
					                                    <div class="form-group">
					                                        <label for="city">이메일</label>
					                                        <input class="form-control" id="city" type="text" placeholder="이메일" required>
					                                    </div>
					                                </div>
					                                <div class="col-sm-4 mb-2">
					                                    <div class="form-group">
					                                        <label for="zip">&nbsp;</label>
					                                        <input class="form-control" id="zip" type="tel" placeholder="주소" required disabled>
					                                    </div>
					                                </div>
					                                <div class="col-sm-4 mb-2">
					                                    <label for="state">&nbsp;</label>
					                                    <select class="form-select w-100 mb-0" id="state" name="state" aria-label="State select example">
					                                        <option value="" selected>직접 입력</option>
					                                        <option value="naver.com">naver.com</option>
					                                        <option value="gmail.com">gmail.com</option>
					                                        <option value="hanmail.com">hanmail.com</option>
					                                        <option value="nate.com">nate.com</option>
					                                    </select>
					                                </div>
					                                <div class="mb-3">
					                                	<span style="font-size: small;">중복확인 결과 출력</span>
					                                </div>
					                            </div>
					                            
					                            <div class="form-group mb-4">
			                                        <label for="password">비밀번호</label>
			                                        <div class="input-group">
			                                            <span class="input-group-text" id="basic-addon2">
			                                                <svg class="icon icon-xs text-gray-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"></path></svg>
			                                            </span>
			                                            <input type="password" placeholder="Password" class="form-control" id="password" required>
			                                        </div>  
			                                    </div>
			                                    <!-- End of Form -->
			                                    <!-- Form -->
			                                    <div class="form-group mb-4">
			                                        <label for="confirm_password">비밀번호 확인</label>
			                                        <div class="input-group">
			                                            <span class="input-group-text" id="basic-addon2">
			                                                <svg class="icon icon-xs text-gray-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"></path></svg>
			                                            </span>
			                                            <input type="password" placeholder="Confirm Password" class="form-control" id="confirm_password" required>
			                                        </div>
			                                        <div class="mb-3">
					                                	<span style="font-size: small;">비밀번호 일치여부 출력</span>
					                                </div>
			                                    </div>
					                            
					                            <input type="button" class="btn btn-gray-800" value="다음" onclick="$('#tabs-text-2-tab')[0].click()" style="width: 100%;">
					                            
					                        </form>
							            </div>
				                        
							            <div class="tab-pane fade" id="tabs-text-2" role="tabpanel" aria-labelledby="tabs-text-2-tab">
			                                <div class="mb-3">
			                                    <div>
			                                        <label for="first_name">이름</label>
			                                        <input class="form-control" id="first_name" type="text" required>
			                                    </div>
				                            </div>
				                            
			                                <div class="mb-3">
			                                    <div>
			                                        <label for="first_name">주소</label>
			                                        <input class="form-control" id="address" type="text" required>
			                                    </div>
				                            </div>
			                                <div class="mb-1">
			                                    <div>
			                                        <label for="first_name">주소</label>
			                                        <input class="form-control" id="address" type="text" required>
			                                    </div>
				                            </div>
			                                <div class="mb-1">
			                                    <div>
			                                        <label for="first_name">주소</label>
			                                        <input class="form-control" id="address" type="text" required>
			                                    </div>
				                            </div>
				                            
			                                <div class="mb-3">
			                                    <div>
			                                        <label for="first_name">전화번호</label>
			                                        <input class="form-control" id="tel" type="text" required>
			                                    </div>
				                            </div>
				                            
				                            
				                            <input type="button" class="btn btn-gray-800 mb-3" value="이전" onclick="$('#tabs-text-1-tab')[0].click()" style="width: 100%;">
				                            
				                            <div class="form-group">
			                                    <div class="mb-4">
			                                        <div class="form-check">
			                                            <input class="form-check-input" type="checkbox" value="" id="remember">
			                                            <a class="fw-bold" data-bs-toggle="modal" data-bs-target="#modal-default" style="text-decoration: underline;">서비스 이용약관</a>
			                                            <label class="form-check-label fw-normal mb-0" for="remember">
			                                            	에 동의합니다.
			                                            </label>
			                                        </div>
			                                    </div>
			                                </div>
			                                
			                                <div class="d-grid">
			                                    <button type="submit" class="btn btn-gray-800">회원가입</button>
			                                </div>
				                            
							            </div>

							            <div class="tab-pane fade" id="tabs-text-3" role="tabpanel" aria-labelledby="tabs-text-3-tab">
							                <p>사업자회원</p>
							            </div>
							            <div class="tab-pane fade" id="tabs-text-4" role="tabpanel" aria-labelledby="tabs-text-4-tab">
							                <p>사업자회원2</p>
							            </div>
							        </div>
							    </div>
							</div>
							<!-- End of Tab Content -->
							
							
                            <form action="#" class="mt-4">
                                
                            </form>
	                            
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    
    
    <!-- 이용약관 modal -->
	<div class="modal fade" id="modal-default" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h2 class="h6 modal-title">이용약관</h2>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <jsp:include page="term.jsp"/>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-link text-gray-600 ms-auto" data-bs-dismiss="modal">확인</button>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- End of Modal Content -->

    <!-- Core -->
<script src="${pageContext.request.contextPath}/resources/vendor/@popperjs/core/dist/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- Vendor JS -->
<script src="${pageContext.request.contextPath}/resources/vendor/onscreen/dist/on-screen.umd.min.js"></script>

<!-- Slider -->
<script src="${pageContext.request.contextPath}/resources/vendor/nouislider/distribute/nouislider.min.js"></script>

<!-- Smooth scroll -->
<script src="${pageContext.request.contextPath}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>

<!-- Charts -->
<script src="${pageContext.request.contextPath}/resources/vendor/chartist/dist/chartist.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>

<!-- Datepicker -->
<script src="${pageContext.request.contextPath}/resources/vendor/vanillajs-datepicker/dist/js/datepicker.min.js"></script>

<!-- Sweet Alerts 2 -->
<script src="${pageContext.request.contextPath}/resources/vendor/sweetalert2/dist/sweetalert2.all.min.js"></script>

<!-- Moment JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>

<!-- Vanilla JS Datepicker -->
<script src="${pageContext.request.contextPath}/resources/vendor/vanillajs-datepicker/dist/js/datepicker.min.js"></script>

<!-- Notyf -->
<script src="${pageContext.request.contextPath}/resources/vendor/notyf/notyf.min.js"></script>

<!-- Simplebar -->
<script src="${pageContext.request.contextPath}/resources/vendor/simplebar/dist/simplebar.min.js"></script>

<!-- Github buttons -->
<script async defer src="https://buttons.github.io/buttons.js"></script>

<!-- Volt JS -->
<script src="${pageContext.request.contextPath}/resources/assets/js/volt.js"></script>

    
</body>

</html>
