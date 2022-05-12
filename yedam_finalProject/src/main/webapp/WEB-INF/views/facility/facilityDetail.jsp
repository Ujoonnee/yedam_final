<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form id="reserve" name="reserve">	
			<c:forEach var="fac" items="${facility}">
				${fac.thumbnail} 
				${fac.name}  
				${fac.address}  
				${fac.startDate} ~ ${fac.endDate}
				${fac.detail}
				<input type="hidden" id="num" value="${fac.facNo}">
			</c:forEach>
</form>
<button>예약하기</button>

<script type="text/javascript">
	$("button").on("click", function(){
		const url = "reserve.do/" + $("#num").val();
		location.href = url;
	})

</script>
</body>
</html>