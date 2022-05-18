<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
	
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	body {font-family: 'Jeju Gothic', sans-serif;}
	
	a:not(#loginInfo a) {
		color: black;
		text-decoration: none;
	}
</style>
<title> <tiles:getAsString name="title"/> </title>
</head>
<body class="container-fluid p-0">
	<tiles:insertAttribute name="header"/>
	
	<div class="row">
		<div class="col-3 border">
			<tiles:insertAttribute name="sidebar"/>
		</div>
		<div class="col-9">
			<tiles:insertAttribute name="body"/>
		</div>
	</div>
	
	<tiles:insertAttribute name="footer"/>
</body>
</html>