<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<!-- Sweet Alert -->
<link type="text/css" href="${pageContext.request.contextPath}/resources/vendor/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">

<!-- Notyf -->
<link type="text/css" href="${pageContext.request.contextPath}/resources/vendor/notyf/notyf.min.css" rel="stylesheet">

<!-- Volt CSS -->
<link type="text/css" href="${pageContext.request.contextPath}/resources/css/volt.css" rel="stylesheet">

<!-- material icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<style>
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	body {font-family: 'Jeju Gothic', sans-serif;}
	
	a {
		color: black;
		text-decoration: none;
	}
	
	span {font-family: 'Jeju Gothic', sans-serif;}
</style>
<title> <tiles:getAsString name="title"/> </title>
</head>
<body>
	<main class="container-fluid content m-0 p-0">
		<tiles:insertAttribute name="header"/>
		<tiles:insertAttribute name="body"/>
		<tiles:insertAttribute name="footer"/>
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