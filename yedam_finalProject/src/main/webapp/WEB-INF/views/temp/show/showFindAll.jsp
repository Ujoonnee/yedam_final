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


	<h3>공 연</h3>
	<form name="frm" method="get" action="">
			<label class="hidden"></label>
				<select id="searchCondition" name="searchCondition">
					<option value="none">전체</option>
					<option value="show_no">공연등록번호</option>
					<option value="name">공연명</option>
				</select>
			<label></label>	
				<input type="text" id="searchKeyword" name="searchKeyword" />
				<input type="submit" value="검색">
	
	

	</form>
			<label class="hidden" align="right">
				<select name="status">
					<option value="none">전체</option>
					<option value="00401">진행중</option>
					<option value="00402">승인거절</option>
					<option value="00403">승인대기</option>
					<option value="">종료</option>
				</select>
			</label>
		
	<table>
		<thead>
			<tr>
				<th>미리보기</th>
				<th>공연등록번호</th>
				<th>공연명</th>
				<th>신청일</th>
				<th>공연등록상태</th>
				<th>예약자목록</th>
				
			</tr>
			
		</thead>
	
		<tbody>
		
		
			<c:forEach items="${show }" var="show">
				<tr class="list">
					<td>${show.thumbnail }</td>
					<td>${show.showNo }</td>
					<td>${show.name }</td>
					<td>${show.startDate }</td>
					<td>
						<c:set var="status" value="00401"/>
							<c:choose>
								
								<c:when test="${show.approvalStatus eq '00401' }">
								진행중
								</c:when>

								<c:when test="${show.approvalStatus eq '00402' }">
								승인거절
								</c:when>

								<c:otherwise>
								승인대기
								</c:otherwise>
							
							</c:choose>
					</td>
					<td></td>
				</tr>

			</c:forEach>
		
		</tbody>

	</table>


</body>
</html>