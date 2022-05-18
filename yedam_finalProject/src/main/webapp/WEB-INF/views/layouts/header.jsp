<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<h1>HEADER</h1>
<div>현재 : ${user.email }</div>

<a href="tempLogin?email=admin&password=123456">관리자</a>
<a href="tempLogin?email=provider&password=123456">사업자</a>
<a href="tempLogin?email=general&password=123456">일반회원</a>
<br>

<div>
	<a href="#">공연</a>
	<a href="#">전시</a>
	<a href="#">시설</a>
	<a href="#">매장</a>
</div>

<hr>