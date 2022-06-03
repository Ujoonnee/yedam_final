<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<div class="display-4">전시등록신청상세</div>
<hr>
<div class="row justify-content-center">
	<div class="col-8 form-control" style="width:700px;">
		<div class="row">
		<%-- <div class="col-6"><img style="width:382px; height:314px;" alt="" src="../../resources/img/${detail.thumbnail}"></div>
		<div class="col-6">
			<dl>
				<dt>서비스명</dt>
				<dd>${detail.name}</dd>
			</dl>
			<dl>
				<dt>장소명</dt>
				<dd>${detail.locationName}</dd>
			</dl>
			<dl>
				<dt>기간</dt>
				<dd><fmt:formatDate value="${detail.startDate}" pattern="yyyy-MM-dd"/> 
					~ <fmt:formatDate value="${detail.endDate}" pattern="yyyy-MM-dd"/></dd>
			</dl>
			<dl>
				<dt>연락처</dt>
				<dd>${detail.tel}</dd>
			</dl>
			<dl>
				<dt>주소</dt>
				<dd>${detail.address}</dd>
			</dl>
		</div>
		<div>&nbsp;</div>
		<br>
		<hr>
		<div>
			<dl>
				<dt >상세설명</dt>
				<dd>${detail.detail}</dd>
			</dl>
		</div>
		</div> --%>
		<!-- <div class="col-6"> -->
		<table class="form-control">
		<colgroup>
			<col width="30%">
			<col width="30%">
			<col width="10%">
			<col width="10%">
		</colgroup>
			<tr>
				<th class="display-5">서비스명</th>
				<td class="display-6">${detail.name}</td>
			</tr>
			<tr><td>&nbsp;</td></tr>		
			<tr>
				<th class="display-5">썸네일</th>
				<td><img style="width:382px; height:314px;" alt="" src="../../resources/img/${detail.thumbnail}"></td>
			</tr>
			<tr><td>&nbsp;</td></tr>		
			<tr>
				<th class="display-5">장소명</th>
				<td class="display-6">${detail.locationName}</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<th class="display-5">기간</th>
				<td class="display-6"><fmt:formatDate value="${detail.startDate}" pattern="yyyy-MM-dd"/> 
					~ <fmt:formatDate value="${detail.endDate}" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<th class="display-5">연락처</th>
				<td class="display-6">${detail.tel}</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td class="display-5">주소</td>
				<td class="display-6">${detail.address}</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td class="display-5">서비스설명</td>
				<td class="display-6">${detail.detail}</td>
			</tr>
		</table>
		</div>
		<hr>
		<div align="right">
			<input type="hidden" id="exNo" value="${detail.exNo}">
			<button class="btn btn-tertiary" id="permit">승인</button>&nbsp;&nbsp;&nbsp;<button class="btn btn-tertiary" id="reject">반려</button>&nbsp;&nbsp;&nbsp;
			<button class="btn btn-tertiary" onclick="location.href='${pageContext.request.contextPath}/exhibition/exRegAppList'">목록</button>
		</div>
	</div>
</div>
<script type="text/javascript">
	$("#permit").on("click", function(){
		
		$.ajax({
			url: "exhPermit",
			method: "POST",
			dataType:'json',
			data: {exNo: $("#exNo").val()},
			success: function (data) {
				alert("승인되었습니다.")
	        },
	        error:function(){
	        	alert("실패");
	        }
		})
	})
	
	$("#reject").on("click", function(){
			
			$.ajax({
				url: "exhReject",
				method: "POST",
				dataType:'json',
				data: {exNo: $("#exNo").val()},
				success: function (data) {
					alert("반려되었습니다.")
		        },
		        error:function(){
		        	alert("실패");
		        }
			})
		})
	
</script>
</body>
</html>