<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/serializeObject.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="form2" name="form2">

지역
<select>
	<option value="3">대구광역시</option>
	<option value="1">서울특별시</option>
	<%-- <option value="${city.no}">${city.name}</option> --%>
</select>

기간
<input type="date" name="startDate" id="sDate">~<input type="date" name="endDate" id="eDate">

이름
<input type="text" name="name" id="srch"><button type="button" id="listSearchBtn">검색</button>
<table border="1">
	<tr>
		<td></td>
		<td>시설명</td>
		<td>주소</td>
		<td>기간</td>
	</tr>
	<tbody id="tbd">
			<c:forEach var="fac" items="${facility}">
	<tr class="list">
				<td>${fac.thumbnail}  <input type="hidden" value="${fac.facNo}"></td>
				<td>${fac.name}  </td>
				<td>${fac.address}  </td>
				<td>${fac.startDate} ~ ${fac.endDate}</td>
				
				
	</tr>
			</c:forEach>
			</tbody>
</table>
</form>
<script>

	$("table").on("click", ".list", function(){
		console.log($(this).find("input").val());

		const url = "detail.do/" + $(this).find("input").val();
		location.href = url;
		
	}) 

	$("#listSearchBtn").on("click", function(){
		
		console.log($("#srch").val());
		
		$.ajax({
			url : "facilities",
			method :"POST",
			data: JSON.stringify($("#form2").serializeObject()),
			contentType : "application/json"
			
		}).done(function(data){
			$("#tbd").empty();
			for(d of data){
				var list = $("<tr>").append($("<td>").html(d.thumbnail))
						 			.append($("<td>").html(d.address))
									.append($("<td>").html(d.startDate))
									.append($("<td>").html(d.endDate));
				
				$("#tbd").append(list);
			}
		})
	} );
	

</script>

	
</body>
</html>