<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>전시등록신청목록</h3>

<form id="form1" name="form1">
<select id="sel">
	<option value="">선택</option>
	<option value="exName">전시명</option>
	<option value="pname">사업자명</option>
</select>
<input type="text" id="input">
<button type="button" id="searchBtn">검색</button>
<select id="selectBox" >
	<option value="">승인여부선택</option>
	<option value="00401">승인</option>
	<option value="00402">반려</option>
	<option value="00403">대기</option>
</select>

</form>

<table>
	<tr>
		<td>전시등록번호</td>
		<td>전시명</td>
		<td>사업자명</td>
		<td>신청일</td>
		<td>승인여부</td>
	</tr>
	<tbody id="tbd">
		<c:forEach var="reg"  items="${regList}">
			<tr class="list">
				<td>${reg.exNo}</td>
				<td>${reg.name}</td>
				<td>${reg.memNo}</td>
				<td><fmt:formatDate value="${reg.applicationDate}" pattern="yyyy-MM-dd"/></td>
				<td>${reg.approvalStatus}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<script type="text/javascript">


$("#searchBtn").on("click",function(){
 	var selectedVal = $("#sel option:selected").val()
 	if(selectedVal=="exName"){
 		//전시명으로 검색.
 		$.ajax({	
 			url:"exRegAppListByExhName",
 			method : "GET",
 			data:{exhName:$("#input").val()},
 			}).done(function(data){
 				console.log(data);
 				$("#tbd").empty();
 				alert("성공");
 				for(var i=0; i<data.length; i++){
 					$("<tr>").append(`<td>\${data[i].exNo}</td>`)
 							 .append(`<td>\${data[i].name}</td>`)
 							 .append(`<td>\${data[i].memNo}</td>`)
 							 .append(`<td>\${data[i].applicationDate}</td>`)
 							 .append(`<td>\${data[i].approvalStatus}</td>`)
 							 .appendTo("#tbd")
 				}
 			});  
 	}else{
 		//사업자명으로 검색.
 		$.ajax({	
 			url:"exRegAppListByMemName",
 			method : "GET",
 			data:{memName:$("#input").val()},
 			}).done(function(data){
 				console.log(data);
 				$("#tbd").empty();
 				alert("성공");
 				for(var i=0; i<data.length; i++){
 					$("<tr>").append(`<td>\${data[i].exNo}</td>`)
 							 .append(`<td>\${data[i].name}</td>`)
 							 .append(`<td>\${data[i].memNo}</td>`)
 							 .append(`<td>\${data[i].applicationDate}</td>`)
 							 .append(`<td>\${data[i].approvalStatus}</td>`)
 							 .appendTo("#tbd")
 				}
 			});  
 	}
	//승인여부로 검색.
	/* var selectedElement = document.getElementById("selectBox"); 
	var optionVal = selectedElement.options[selectedElement.selectedIndex].value;
	$.ajax({	
		url:"exRegAppList2",
		method : "GET",
		data:{approvalStatus:optionVal},
		}).done(function(reg){
			console.log(reg);
			$("#tbd").empty();
			for(var i=0; i<reg.length; i++){
				$("<tr>").append(`<td>\${reg[i].exNo}</td>`)
						 .append(`<td>\${reg[i].name}</td>`)
						 .append(`<td>\${reg[i].member.name}</td>`)
						 .append(`<td>\${reg[i].applicationDate}</td>`)
						 .append(`<td>\${reg[i].approvalStatus}</td>`)
						 .appendTo("#tbd")
			}
		});  */
	 
});




</script>
</body>
</html>