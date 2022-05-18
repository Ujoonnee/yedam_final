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
</style>
<title> <tiles:getAsString name="title"/> </title>
</head>
<body>
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="body"/>
	<tiles:insertAttribute name="footer"/>
</body>
</html>