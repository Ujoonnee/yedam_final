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
<div class="row justify-content-center">
	<div class="col-10">
		<div class="display-4">전시등록신청목록</div>
		<hr>
<form id="form1" name="form1">
<!-- 승인여부로검색 -->
<div align="center">
	<div class="input-group" style="width:500px;">
		<select id="selectPermit" name="selectPermit" class="form-select" onchange="init()" >
			<option value="">--선택--</option>
			<option value="00401">승인</option>
			<option value="00402">반려</option>
			<option value="00403">대기</option>
		</select>
		<select id="selectName" class="form-select" onchange="nameChange()">
			<option >--선택--</option>
			<option value="exName">전시명</option>
			<option value="pname">사업자명</option>
		</select>
		<input type="text"  class="form-control" id="input" onkeypress="f_enterLogin()">
		<button href="javascript:f_loginCheck();" type="button" id="searchBtn" class="input-group-text" >
			<svg class="icon icon-xs text-gray-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg>
		</button>
		</div>
	</div>
</form>

		<div class="card border-0 shadow mb-4">
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-centered table-nowrap mb-0 rounded"
								id="boardtable">
								<thead class="thead-light">
									<tr class="border-0 rounded-start">
										<th class="border-0">전시등록번호</th>
										<th class="border-0">전시명</th>
										<th class="border-0">사업자명</th>
										<th class="border-0">신청일</th>
										<th class="border-0 rounded-end">승인여부</th>
									</tr>
						<tbody id="tbd">
							<c:forEach var="reg"  items="${regList}">
								<tr class="list align-middle">
									<td>${reg.exNo}</td>
									<td>${reg.name}</td>
									<td>${reg.member.name}</td>
									<td><fmt:formatDate value="${reg.applicationDate}" pattern="yyyy-MM-dd"/></td>
									<td>${reg.approvalStatus}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
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
					console.log(reg[i].applicationDate);
					const applicationDate = convertDate1(reg[i].applicationDate);
					$("<tr>").addClass("list")
							 .append(`<td>\${reg[i].exNo}</td>`)
							 .append(`<td>\${reg[i].name}</td>`)
							 .append(`<td>\${reg[i].member.name}</td>`)
							 .append(`<td>\${applicationDate}</td>`)
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
		 					const applicationDate = convertDate1(data[i].applicationDate);
		 					$("<tr>").addClass("list")
		 							 .append(`<td>\${data[i].exNo}</td>`)
		 							 .append(`<td>\${data[i].name}</td>`)
		 							 .append(`<td>\${data[i].member.name}</td>`)
		 							 .append(`<td>\${applicationDate}</td>`)
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
		 				$("#tbd").empty();
		 				for(var i=0; i<data.length; i++){
		 					const applicationDate = convertDate1(data[i].applicationDate);
		 					$("<tr>").addClass("list")
		 							 .append(`<td>\${data[i].exNo}</td>`)
		 							 .append(`<td>\${data[i].name}</td>`)
		 							 .append(`<td>\${data[i].member.name}</td>`)
		 							 .append(`<td>\${applicationDate}</td>`)
		 							 .append(`<td>\${data[i].approvalStatus}</td>`)
		 							 .appendTo("#tbd")
		 				}
		 				init2()
		 			});  
		 	}
	
		}
});	
	
	//밀리초를 날짜(yy-mm-dd)으로 변경.
	function convertDate1(milliSecond) {

		  const data = new Date(milliSecond);
		  	
		  const year = data.getFullYear();
		  const yy = year.toString().substring(2,4)
		  var month = data.getMonth() + 1;
		  var date = data.getDate();
		
		  
		  if (month < 10) month = "0"+month;
		  if (date < 10) date = "0"+date;

		  return `\${yy}-\${month}-\${date}`;
		}
	
	function f_enterLogin() {
	    if(window.event.keyCode == 13){
	    	f_loginCheck(); // 로그인 버튼 함수
		}
	}
</script>
</body>
</html>