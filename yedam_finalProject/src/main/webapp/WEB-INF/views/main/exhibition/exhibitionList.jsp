<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class = "row justify-content-center">
	<div class = "col-8">
	
	 
		 <div class="card border-0 shadow mb-4">
			<div class="card-body justify-content-center">
				<form action ="searchExhibition" method="get" name="searchForm" autocomplete="off">
					<div class="row justify-content-center">
						<div class="col-lg-3 mb-3">
							<div>지역</div>
							<select id="address" name="exVO.address" class="form-select" >
									<option value="">전체</option>
									<option value="서울"<c:out value="${paging.cri.exVO.address eq '서울'? 'selected': '' }" />>서울특별시</option>
									<option value="부산"<c:out value="${paging.cri.exVO.address eq '부산'? 'selected': '' }" />>부산광역시</option>
									<option value="대구"<c:out value="${paging.cri.exVO.address eq '대구'? 'selected': '' }" />>대구광역시</option>
									<option value="인천"<c:out value="${paging.cri.exVO.address eq '인천'? 'selected': '' }" />>인천광역시</option>
									<option value="광주"<c:out value="${paging.cri.exVO.address eq '광주'? 'selected': '' }" />>광주광역시</option>
									<option value="대전"<c:out value="${paging.cri.exVO.address eq '대전'? 'selected': '' }" />>대전광역시</option>
									<option value="울산"<c:out value="${paging.cri.exVO.address eq '울산'? 'selected': '' }" />>울산광역시</option>
									<option value="제주"<c:out value="${paging.cri.exVO.address eq '제주'? 'selected': '' }" />>제주특별시</option>
							</select>
						</div>
					
						<div class="col-lg-7">
							<div>기간</div>
							<div >
								<div>
									<div style = "float : left" class="col-lg-4"><input type = "date"  id="startDate" name = "exVO.startDate" class="form-control datepicker-input" value='<fmt:formatDate value="${paging.cri.exVO.startDate }" pattern= "yyyy-MM-dd"/>'> 
									</div>
									<div style = "float : left"> <p>&nbsp;&nbsp;~&nbsp;&nbsp;</p> </div>
									<div style = "float : left;"class="col-lg-4"><input type = "date"  id ="endDate" name = "exVO.endDate" class="form-control datepicker-input"  value='<fmt:formatDate value="${paging.cri.exVO.endDate }" pattern= "yyyy-MM-dd"/>' >
									</div>
								</div>
							</div>
						</div>
						
						<div class = "col-lg-7">
							<div>
								<div style="clear: left;">전시명</div>
									<input type="hidden" id="pageNum" name="pageNum" value="1">
								<input type="text" class="form-control" id="keyword" name="keyword" placeholder =" 검색어를 입력해주세요." value="${paging.cri.keyword }" size="40">&nbsp;
							</div>
						</div>
						<div class="col-lg-3">
							<div>&nbsp;</div>
							<button class="btn btn-outline-gray-500" id = "searchBtn" >검색</button>&nbsp;
							<button type="button" class="btn btn-outline-gray-500" onclick="resetForm()">초기화</button>
						</div>
					</div>
				</form>
			</div>
		</div>
         
       	<c:if test = "${empty exhibitionList }">
			<tr>
				<td colspan="6">전시가 없습니다.</td>
			</tr>
		</c:if>	
		
		<c:if test = "${not empty exhibitionList }">	
			<div class="card border-0 shadow mb-4">
		        <form id="frm" method="get">
			        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" style="padding :9px;">
				        <c:forEach items="${exhibitionList }" var = "list" >
					        <div class="col" >
					        
					        <c:if test = "${empty list.thumbnail }">
						          <div class="card shadow-sm" onclick="exhibitionView(${list.exNo})" >
						          <div style="text-align: center">
						            <img src="https://www.jindo.go.kr/themes/home/images/content/no_image.jpg"  class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 사진" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em" style="text-align : center;"> ${list.name }</text></src>
						           </div>
						            <div class="card-body">
						              <p class="card-text"></p>
						              <div class="d-flex justify-content-between align-items-center">
						                <div class="btn-group">
						                	<small class="card-text">${list.startDate } ~ </small> 
						                	<small class="card-text">${list.endDate }</small>
						                </div>
						              </div>
						            </div>
						          </div>
					          </c:if>
					          
					        <c:if test = "${not empty list.thumbnail }">
								<div class="card shadow-sm" onclick="exhibitionView(${list.exNo})" >
									<img src="/exhibition/${list.thumbnail }"  class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 사진" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">${list.name } </text></src>
									<div style="text-align: center;" >
						           </div>
						            <div class="card-body">
						              <p class="card-text"></p>
						              <div class="d-flex justify-content-between align-items-center">
						                <div class="btn-group">
						                	<small class="card-text">${list.startDate } ~ </small> 
						                	<small class="card-text">${list.endDate }</small>
						                </div>
						              </div>
						            </div>
						          </div>
					          </c:if>
					          
					          
					        </div>
			      	  </c:forEach>
			        </div>
			        <input type="hidden" id = "exNo" name="exNo" value="${list.exNo }">
		        </form>
	        </div>
        </c:if>
        
        
	
	
		<div id="pagingDiv" class="card-footer px-3 border-0 d-flex flex-column flex-lg-row align-items-center justify-content-center">
				<nav aria-label="Page navigation example">
						<ul class="pagination mb-0">	<!-- 이전페이지 -->
							<c:if test="${paging.prev }">
								<li class="page-item">
									<a class="page-link" href="${paging.startPage - 1}">이전</a>
								</li>
							</c:if>
								<!-- 1 2 3 4   -->
							<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
								<c:if test="${paging.cri.pageNum == num }">
									<li class="page-item active">
										<a class="page-link" href="${num }">${num }</a>&nbsp;
									</li>
								</c:if>
								
								<c:if test="${paging.cri.pageNum != num }">
									<li class="page-item">
										<a class="page-link" href="${num }">${num }</a>&nbsp;
									</li>
								</c:if>
							</c:forEach>
								<!-- 다음페이지 -->	
							<c:if test="${paging.next }">
								<li class="page-item">
									<a id="next" class="page-link" href="${paging.endPage + 1 }">다음</a>
								</li>
							</c:if>
						</ul>
				</nav>
		</div>
	</div>
</div>
<script>
	function resetForm(){
		document.getElementById('keyword').value = '';
		document.getElementById('address').value = '';
		document.getElementById('startDate').value = '';
		document.getElementById('endDate').value = '';
		
	}
	/* 페이지 번호 이동 id> pageNum > attr로 속성 href줌 */
	$(document).ready(function(){
		$('#pagingDiv a').click(function(e){
			e.preventDefault();
			$('#pageNum').val($(this).attr("href"));
			
			searchForm.submit();
		})
	});
	
	// 검색 [전체] 선택 시 검색창 비우기
// 	function allSelected() {
// 		var selected = document.getElementById("type");
// 		if (selected.options[selected.selectedIndex].value == 1) {
// 			document.getElementById("keyword").value = '';
// 		}
	
// 	}
	
	function exhibitionView(n){
		frm.exNo.value= n;
		frm.action = "detailView";
		frm.submit();
	}
	
</script>
</body>
</html>