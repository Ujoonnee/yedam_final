<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<form id="form1" name="form1"action ="searchApprovalList" method="get" autocomplete="off">
<select id="selectDate" name="applicationDate">
	<option value="">날짜선택</option>
	<option value="1" <c:out value="${paging.cri.applicationDate eq '1'? 'selected': '' }" /> >빠른순</option>
	<option value="2"<c:out value="${paging.cri.applicationDate eq '2'? 'selected': '' }" />>오래된순</option>
</select>

<select id="selectBox" name="approvalType">
	<option value="">승인여부선택</option>
	<option value="00401"<c:out value="${paging.cri.type eq '00401'? 'selected': '' }" />>승인</option>
	<option value="00402"<c:out value="${paging.cri.type eq '00402'? 'selected': '' }" />>반려</option>
	<option value="00403"<c:out value="${paging.cri.type eq '00403'? 'selected': '' }" />>대기</option>
</select>
<select id="sel" id = "type" name="type">
	<option value="">선택</option>
	<option value="storeName"<c:out value="${paging.cri.type eq 'storeName'? 'selected': '' }" />>매장명</option>
	<option value="pname"<c:out value="${paging.cri.type eq 'pname'? 'selected': '' }" />>사업자명</option>
</select>
<input type="text"  id = "keyword" name = "keyword"  placeholder =" 검색어를 입력해주세요." value="${paging.cri.keyword }">
<input type="hidden" id="pageNum" name="pageNum" value="${paging.cri.pageNum }">
<input type ="hidden" name="orderDate" value ="${paging.cri.applicationDate }">
<input type="hidden" id="approvalType" value="${paging.cri.approvalType }">
<input type="hidden" id="pageNum" name="amount" value="${paging.cri.amount }">
<button type="button" id="searchBtn">검색</button>
<button type="button" onclick="resetForm()">초기화</button>

</form>

<table>
	<tr>
		<td>매장등록번호</td>
		<td>매장명</td>
		<td>사업자명</td>
		<td>신청일</td>
		<td>승인여부</td>
	</tr>
	<tbody id="tbd">
		<c:forEach var="reg"  items="${regList}">
			<tr class="list">
				<td><input type = "checkbox" id ="checkf" name="checkf" value="${reg }"
				data-storeNo ="${reg.storeNo }" data-approvalStatus ="${reg.approvalStatus }"
				>
				${reg.storeNo}</td>
				<td>${reg.name}</td>
				<td>${reg.memNo}</td>
				<td><fmt:formatDate value="${reg.applicationDate}" pattern="yyyy-MM-dd"/></td>
				<td id="changeStatus">${reg.approvalStatus}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
		<button onclick = "storeAccess()">매장승인</button>
		<button onclick = "storeReject()">매장거절</button>

		<div id="pagingDiv">
		<!-- 이전페이지 -->
		<c:if test="${paging.prev }">
			<a href="${paging.startPage - 1}">이전</a>
		</c:if>
			<!-- 1 2 3 4   -->
		<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
		&nbsp;<a href="${num }">${num }</a>&nbsp;
		</c:forEach>
			<!-- 다음페이지 -->	
		<c:if test="${paging.next }">
			<a id="next" href="${paging.endPage + 1 }">다음</a>
		</c:if>
	</div>
<script>
	function resetForm(){
		document.getElementById('keyword').value = '';
		document.getElementById('selectDate').value = '';
		document.getElementById('selectBox').value = '';
		document.getElementById('sel').value = '';
		
	}
	$(document).ready(function(){
		/* 페이지 번호 이동 id> pageNum > attr로 속성 href줌 */
		$('#pagingDiv a').click(function(e){
			e.preventDefault();
			$('#pageNum').val($(this).attr("href"));
			form1.submit();
		})
	});
	// 검색 [전체] 선택 시 검색창 비우기
	function allSelected() {
		var selected = document.getElementById("type");
		if (selected.options[selected.selectedIndex].value == 1) {
			document.getElementById("keyword").value = '';
		}
	
	}
	function storeAccess(){
		var list=[];
		const query = 'input[name="checkf"]:checked';
		const selectedEls = document.querySelectorAll(query);
		if(selectedEls.length == 0 ){
			alert('빈값')
			return ;
		}
		console.log(selectedEls);
		for(var i=0; i<selectedEls.length; i++){
			var storeNo = selectedEls[i].attributes[4].value;
			var status = '00401'
			list.push({storeNo, status})
		}
		
		
		console.log(list)
		$.ajax({
			url : 'updateStatus',
			type : 'post',
			 contentType : "application/json; charset=utf-8",
	  		 data: JSON.stringify(list),
	  		success: function(result){
  			 	alert("매장승인 완료");
	  			location.reload();
  		 },
  		 error: function(result){
	  			console.log(result) 
  		 }
			
			
		})
		
	}
	function storeReject(){
		var list=[];
		const query = 'input[name="checkf"]:checked';
		const selectedEls = document.querySelectorAll(query);
		if(selectedEls.length == 0 ){
			alert('빈값')
			return ;
		}
		
		console.log(selectedEls);
		for(var i=0; i<selectedEls.length; i++){
			var storeNo = selectedEls[i].attributes[4].value;
			var status = '00402'
			list.push({storeNo, status})
		}
		
		console.log(list)
		$.ajax({
			url : 'updateStatus',
			type : 'post',
			 contentType : "application/json; charset=utf-8",
	  		 data: JSON.stringify(list),
	  		success: function(result){
  			 	alert("거절처리 성공");
	  			location.reload();
  		 },
  		 error: function(result){
	  			console.log(result) 
  		 }
			
		})
	}
	const div = document.getElementById('changeStatus');
	div.addEventListener( (target) => {
		  $('.list').append("<td>mouseover</td>");
		});
	
</script>
