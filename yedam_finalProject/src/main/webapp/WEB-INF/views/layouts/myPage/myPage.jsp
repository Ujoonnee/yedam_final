<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%-- 
<style>
 	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css); 
 	body {font-family: 'Jeju Gothic', sans-serif;} 
	
 	a:not(#loginInfo a) { 
 		color: black; 
 		text-decoration: none; 
 	} 
</style>
 --%>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->

<!--

=========================================================
* Volt Free - Bootstrap 5 Dashboard
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
<title><tiles:getAsString name="title"/></title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="title" content="Volt - Free Bootstrap 5 Dashboard">
<meta name="author" content="Themesberg">
<meta name="description" content="Volt Pro is a Premium Bootstrap 5 Admin Dashboard featuring over 800 components, 10+ plugins and 20 example pages using Vanilla JS.">
<meta name="keywords" content="bootstrap 5, bootstrap, bootstrap 5 admin dashboard, bootstrap 5 dashboard, bootstrap 5 charts, bootstrap 5 calendar, bootstrap 5 datepicker, bootstrap 5 tables, bootstrap 5 datatable, vanilla js datatable, themesberg, themesberg dashboard, themesberg admin dashboard" />
<link rel="canonical" href="https://themesberg.com/product/admin-dashboard/volt-premium-bootstrap-5-dashboard">

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<!-- <!-- Open Graph / Facebook --> -->
<!-- <meta property="og:type" content="website"> -->
<!-- <meta property="og:url" content="https://demo.themesberg.com/volt-pro"> -->
<!-- <meta property="og:title" content="Volt - Free Bootstrap 5 Dashboard"> -->
<!-- <meta property="og:description" content="Volt Pro is a Premium Bootstrap 5 Admin Dashboard featuring over 800 components, 10+ plugins and 20 example pages using Vanilla JS."> -->
<!-- <meta property="og:image" content="https://themesberg.s3.us-east-2.amazonaws.com/public/products/volt-pro-bootstrap-5-dashboard/volt-pro-preview.jpg"> -->

<!-- <!-- Twitter --> -->
<!-- <meta property="twitter:card" content="summary_large_image"> -->
<!-- <meta property="twitter:url" content="https://demo.themesberg.com/volt-pro"> -->
<!-- <meta property="twitter:title" content="Volt - Free Bootstrap 5 Dashboard"> -->
<!-- <meta property="twitter:description" content="Volt Pro is a Premium Bootstrap 5 Admin Dashboard featuring over 800 components, 10+ plugins and 20 example pages using Vanilla JS."> -->
<!-- <meta property="twitter:image" content="https://themesberg.s3.us-east-2.amazonaws.com/public/products/volt-pro-bootstrap-5-dashboard/volt-pro-preview.jpg"> -->

<!-- <!-- Favicon --> -->
<!-- <link rel="apple-touch-icon" sizes="120x120" href="${pageContext.request.contextPath}/resources/assets/img/favicon/apple-touch-icon.png"> -->
<!-- <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/assets/img/favicon/favicon-32x32.png"> -->
<!-- <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/assets/img/favicon/favicon-16x16.png"> -->
<!-- <link rel="manifest" href="${pageContext.request.contextPath}/resources/assets/img/favicon/site.webmanifest"> -->
<!-- <link rel="mask-icon" href="${pageContext.request.contextPath}/resources/assets/img/favicon/safari-pinned-tab.svg" color="#ffffff"> -->
<!-- <meta name="msapplication-TileColor" content="#ffffff"> -->
<!-- <meta name="theme-color" content="#ffffff"> -->

<!-- Sweet Alert -->
<link type="text/css" href="${pageContext.request.contextPath}/resources/vendor/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">

<!-- Notyf -->
<link type="text/css" href="${pageContext.request.contextPath}/resources/vendor/notyf/notyf.min.css" rel="stylesheet">

<!-- Volt CSS -->
<link type="text/css" href="${pageContext.request.contextPath}/resources/css/volt.css" rel="stylesheet">

<!-- NOTICE: You can use the _analytics.html partial to include production code specific code & trackers -->


</head>

<body>

        <!-- NOTICE: You can use the _analytics.html partial to include production code specific code & trackers -->
        

<!-- <nav class="navbar navbar-dark navbar-theme-primary px-4 col-12 d-lg-none"> -->
<!--     <a class="navbar-brand me-lg-5" href="${pageContext.request.contextPath}/resources/index.html"> -->
<!--         <img class="navbar-brand-dark" src="${pageContext.request.contextPath}/resources/assets/img/brand/light.svg" alt="Volt logo" /> <img class="navbar-brand-light" src="${pageContext.request.contextPath}/resources/assets/img/brand/dark.svg" alt="Volt logo" /> -->
<!--     </a> -->
<!--     <div class="d-flex align-items-center"> -->
<!--         <button class="navbar-toggler d-lg-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation"> -->
<!--           <span class="navbar-toggler-icon"></span> -->
<!--         </button> -->
<!--     </div> -->
<!-- </nav> -->



<tiles:insertAttribute name="sidebar"/>
    
<main class="content" style="min-height: 100vh">
	<tiles:insertAttribute name="header"/>
	
	<div>
		<tiles:insertAttribute name="body"/>
	</div>
</main>
    
<tiles:insertAttribute name="footer"/>
        
        
        

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
