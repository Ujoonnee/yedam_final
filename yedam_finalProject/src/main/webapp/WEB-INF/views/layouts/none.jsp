<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

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
<body>
	<tiles:insertAttribute name="body"/>
</body>
</html>