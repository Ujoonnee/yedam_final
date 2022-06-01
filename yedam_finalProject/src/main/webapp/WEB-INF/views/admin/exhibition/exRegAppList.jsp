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
<!-- 승인여부로검색 -->
<select id="selectPermit" name="selectPermit" onchange="init()" >
	<option value="">--선택--</option>
	<option value="00401">승인</option>
	<option value="00402">반려</option>
	<option value="00403">대기</option>
</select>
<select id="selectName" onchange="nameChange()">
	<option >--선택--</option>
	<option value="exName">전시명</option>
	<option value="pname">사업자명</option>
</select>
<input type="text" id="input">
<button type="button" id="searchBtn">검색</button>

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
				<td>${reg.member.name}</td>
				<td><fmt:formatDate value="${reg.applicationDate}" pattern="yyyy-MM-dd"/></td>
				<td>${reg.approvalStatus}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<script type="text/javascript">
	//전시등록번호<tr> 선택시 상세페이지로 이동
	$("#tbd").on("click", ".list", function(){
		var exNo = $(this).closest("tr").find("td").eq(0).html();
		console.log($(this).closest("tr").find("td").eq(0).html());
		location.href = "exRegAppDetail/" + exNo;
	});
	
	//승인여부 선택 시(나머지 disabled).
	function init(){
		var selectedElement = document.getElementById("selectPermit"); 
		var optionVal = selectedElement.options[selectedElement.selectedIndex].value;
		console.log(optionVal);
		
		if(optionVal !=''){
			$("#selectName").attr("disabled", true);
			$("#input").attr("disabled", true);
			$("#input").val("");
		};
	};
	
	//초기화 메소드.
	function init2(){
		//이름명 박스 초기화, disabled 속성제거.
		$("#selectName").find("option").eq(0).attr("selected", true);
		$("#selectName").find("option").eq(0).attr("selected", false);
		$("#selectName").removeAttr("disabled");
		//승인여부박스 초기화, disabled 속성제거 
		$("#selectPermit").find("option").eq(0).attr("selected", true);
		$("#selectPermit").find("option").eq(0).attr("selected", false);
		$("#selectPermit").removeAttr("disabled");
		//input 박스 초기화, disabled 속성제거 
		$("#input").val("");
		$("#input").removeAttr("disabled");
	};
	
	//이름(전시명, 사업자명)선택 시(승인여부 disabled)
	function nameChange(){
			$("#selectPermit").attr("disabled", true);
		};
	
		
	//1. 승인여부로 검색시 2.이름 선택으로 검색시
	$("#searchBtn").on("click",function(){
		//승인여부 선택시 value값 받아옴.
		var selectedElement = document.getElementById("selectPermit"); 
		var optionVal = selectedElement.options[selectedElement.selectedIndex].value; 
		
		var selectedVal = $("#selectName option:selected").val();
	 	console.log(selectedVal);
	 	
	//1.승인여부로 검색 시
	if(optionVal != ''){
		console.log("1승인여부로 검색");
		$.ajax({	
			url:"exRegAppList2",
			method : "GET",
			data:{approvalStatus:optionVal},
			}).done(function(reg){
				
			console.log(reg);
			$("#tbd").empty();
			
				for(var i=0; i<reg.length; i++){
					$("<tr>").addClass("list")
							 .append(`<td>\${reg[i].exNo}</td>`)
							 .append(`<td>\${reg[i].name}</td>`)
							 .append(`<td>\${reg[i].member.name}</td>`)
							 .append(`<td>\${reg[i].applicationDate}</td>`)
							 .append(`<td>\${reg[i].approvalStatus}</td>`)
							 .appendTo("#tbd")
				}
				init2();
			});
	}else{
		//2.이름(전시명, 사업자명)으로 검색 시
	 	console.log("2이름으로 검색");
		
			//2-1전시명으로 검색.
		 	if(selectedVal=='exName'){
		 		$.ajax({	
		 			url:"exRegAppListByExhName",
		 			method : "GET",
		 			data:{exhName:$("#input").val()},
		 			}).done(function(data){
		 				console.log(data);
		 				$("#tbd").empty();
		 				for(var i=0; i<data.length; i++){
		 					$("<tr>").addClass("list")
		 							 .append(`<td>\${data[i].exNo}</td>`)
		 							 .append(`<td>\${data[i].name}</td>`)
		 							 .append(`<td>\${data[i].member.name}</td>`)
		 							 .append(`<td>\${data[i].applicationDate}</td>`)
		 							 .append(`<td>\${data[i].approvalStatus}</td>`)
		 							 .appendTo("#tbd")
		 				}
		 				
		 				init2();
		 			});  
		 	}else{
		 		//2-2사업자명으로 검색.
		 		$.ajax({	
		 			url:"exRegAppListByMemName",
		 			method : "GET",
		 			data:{memName:$("#input").val()},
		 			}).done(function(data){
		 				console.log(data);
		 				$("#tbd").empty();
		 				for(var i=0; i<data.length; i++){
		 					$("<tr>").addClass("list")
		 							 .append(`<td>\${data[i].exNo}</td>`)
		 							 .append(`<td>\${data[i].name}</td>`)
		 							 .append(`<td>\${data[i].member.name}</td>`)
		 							 .append(`<td>\${data[i].applicationDate}</td>`)
		 							 .append(`<td>\${data[i].approvalStatus}</td>`)
		 							 .appendTo("#tbd")
		 				}
		 				init2()
		 			});  
		 	}
	
		}
});	


</script>
</body>
</html>