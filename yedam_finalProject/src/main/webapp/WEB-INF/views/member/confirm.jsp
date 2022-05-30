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
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="title" content="회원가입">


<!-- Sweet Alert -->
<link type="text/css" href="${pageContext.request.contextPath}/resources/vendor/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">

<!-- Notyf -->
<link type="text/css" href="${pageContext.request.contextPath}/resources/vendor/notyf/notyf.min.css" rel="stylesheet">

<!-- Volt CSS -->
<link type="text/css" href="${pageContext.request.contextPath}/resources/css/volt.css" rel="stylesheet">

<!-- material icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<!-- NOTICE: You can use the _analytics.html partial to include production code specific code & trackers -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<style>
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	html {overflow-x:hidden; overflow-y:auto;}
	body {font-family: 'Jeju Gothic', sans-serif;}
</style>

</head>

<body>

<main>
        <section class="vh-100 d-flex align-items-center justify-content-center">
            <div class="container">
                <div class="row align-items-center ">
                     <div class="col-lg-5 order-2 order-lg-1 text-center text-lg-left">
		                <h1 class="mt-5">환영합니다!</h1>
		                <p class="lead my-4">회원가입이 정상적으로 완료되었습니다.</p>
		                <a href="../dashboard/dashboard.html" class="btn btn-gray-800 d-inline-flex align-items-center justify-content-center mb-4">
		                    <svg class="icon icon-xs me-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.707 14.707a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l2.293 2.293a1 1 0 010 1.414z" clip-rule="evenodd"></path></svg>
		                    홈 화면으로 가기
		                </a>
		            </div>
                    <div class="col-12 col-lg-7 order-1 order-lg-2 text-center d-flex align-items-center justify-content-center">
                        <img class="img-fluid w-75" src="${pageContext.request.contextPath}/resources/assets/img/illustrations/confetti.svg" alt="500 Server Error">
                    </div>
                </div>
            </div>
        </section>
    </main>

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