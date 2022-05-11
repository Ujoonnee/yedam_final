<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<h3>회원가입/로그인</h3>
	<button>개인회원가입(만15세이상 가능)</button> <button>기업회원가입</button><br>
	
	
	<form  name="form1" method="post">
		<sec:csrfInput/>
		<input type="text" id="userid" name="userEmail" placeholder="아이디"><button type="button" id="btnLogin" >로그인</button><br>
		<input type="text" id="passwd" name="userPw" placeholder="비밀번호">
		
		<c:if test="${message =='error'}">
			<div style="color:red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
		</c:if>
		<c:if test="${message =='logout'}">
			<div style="color:red;">로그아웃 되었습니다.</div>
		</c:if>
		
		<p>아이디/비밀번호찾기<p>
		<button>네이버 로그인</button> <button>카카오 로그인</button>
	</form>

	
<script type="text/javascript">
	$(function(){
		$("#btnLogin").click(function(){
			var userid=$("#userid").val();
			var passwd=$("#passwd").val();
			
			if(userid==""){
				alert("아이디를 입력하세요.");
				$("#userid").focus;
				return;
			}
			if(passwd==""){
				alert("비밀번호를 입력하세요.");
				$("#passwd").focus();
				return;
			}
			//폼 내부의 데이터를 전송할 주소
			document.form1.action = "login_check.do";
			document.form1.submit(); 
		})
	})
	
</script>

</body>
</html>	