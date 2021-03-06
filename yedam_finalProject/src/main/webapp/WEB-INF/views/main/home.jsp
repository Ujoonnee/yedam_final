<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- <div id="search" > -->
	
<!-- 	<div style="background-image: url('resources/img/home_bg.png'); height: 624px;"></div> -->
	
<!-- 	<h3>검색</h3> -->

	<div style="background-image: url(${pageContext.request.contextPath}/resources/img/home_bg.png); min-height: 620px">
		<div class="row justify-content-center align-center">
	
				<!--  검색 -->
				<div class="col-8" style="margin-top: 100px">
	              <div class="card border-0 shadow m-5" style="min-height: 300px;">
					<div class="card-body justify-content-center">
						
	                    <!-- Tab Nav -->
						<div class="nav-wrapper position-relative mb-2 justify-content-between">
						    <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-text" role="tablist">
						        <li class="nav-item" style="font-family: 'Jeju Gothic', sans-serif;">
						            <a class="nav-link mb-sm-3 mb-md-0 active" id="tabs-text-1-tab" data-bs-toggle="tab" href="#tabs-text-1" role="tab" aria-controls="tabs-text-1" aria-selected="true">전시 예약하기</a>
						        </li>
						        <li class="nav-item" style="font-family: 'Jeju Gothic', sans-serif;">
						            <a class="nav-link mb-sm-3 mb-md-0" id="tabs-text-2-tab" data-bs-toggle="tab" href="#tabs-text-2" role="tab" aria-controls="tabs-text-2" aria-selected="false">매장 예약하기</a>
						        </li>
						    </ul>
						</div>
						<!-- End of Tab Nav -->
						
						<div class="card border-0">
						    <div class="card-body p-0">
								<!-- Tab Content -->
						        <div class="tab-content" id="tabcontent1">
						        	<div class="tab-pane fade show active" id="tabs-text-1" role="tabpanel" aria-labelledby="tabs-text-1-tab">
							        	<form action ="exhibition/searchExhibition" method="get" name="searchForm" autocomplete="off">
											<div class="row justify-content-center">
												<div class="col-lg-4 mb-3">
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
											
												<div class="col-lg-8">
													<div>기간</div>
													<div>
														<div>
															<div style = "float : left" class="col-lg-4">
																<input type = "date"  id="startDate" name = "exVO.startDate" class="form-control datepicker-input" value='<fmt:formatDate value="${paging.cri.exVO.startDate }" pattern= "yyyy-MM-dd"/>'> 
															</div>
															<div style = "float : left"> <p>&nbsp;&nbsp;~&nbsp;&nbsp;</p> </div>
															<div style = "float : left;"class="col-lg-4"><input type = "date"  id ="endDate" name = "exVO.endDate" class="form-control datepicker-input"  value='<fmt:formatDate value="${paging.cri.exVO.endDate }" pattern= "yyyy-MM-dd"/>' ></div>
														</div>
													</div>
												</div>
												
												<div class = "col-lg-8">
													<div>
														<div style="clear: left;">전시명</div>
															<input type="hidden" id="pageNum" name="pageNum" value="1">
														<input type="text" class="form-control" id="keyword" name="keyword" placeholder =" 검색어를 입력해주세요." value="${paging.cri.keyword }" size="40">&nbsp;
													</div>
												</div>
												<div class="col-lg-4 text-center">
													<div>&nbsp;</div>
													<button class="btn btn-outline-gray-500" id = "searchBtn" >검색</button>&nbsp;
													<button type="button" class="btn btn-outline-gray-500" onclick="resetForm()">초기화</button>
												</div>
											</div>
										</form>
									</div>
									<!-- End of Tab Content -->
									
									<!-- Tab Content -->
							        <div class="tab-pane fade " id="tabs-text-2" role="tabpanel" aria-labelledby="tabs-text-2-tab">
							        	<form action ="store/searchList" method="get" name="searchForm" autocomplete="off">
											<div class="row mb-3">
												<div>현재 위치</div>
												<div class="col-8">
													<c:if test="${user eq null }">
														<input type="text" class="form-control" id = "nowLocation" disabled="disabled" value="대구 중구 중앙대로 403" >
													</c:if>
													<c:if test="${user ne null }">
														<input type="text" class="form-control" id = "nowLocation" disabled="disabled" value="${user.address}" >
													</c:if>
												</div>
												<div class="col-4 p-0">
													<button type="button" id = "location_now" class="btn btn-outline-gray-500 "  onclick = "locationN()">위치 변경</button>
												</div>
											</div>
											<div class="row">
												<div class="col-lg-3">
													<select id="type" name="type" class = "form-select" onchange="allSelected()">
														<option value="1">전체</option>
														<option value="name">매장명</option>
														<option value="prod_name">상품명</option>
													</select>
												</div>
												<div class= "col-lg-7 p-0" style = "float : left; padding-left: 20px">
													<input type="text" id="keyword" name="keyword" class="form-control" placeholder =" 검색어를 입력해주세요." size="40">&nbsp;
												</div>
												<div class="col-lg-2">
													<button id = "searchBtn" class="btn btn-outline-gray-500" >검색</button>&nbsp;
												</div>
											</div>
											
											<c:if test="${user eq null }">
											<input type="hidden" id="pageNum" name="pageNum" value="1">
												<input type ="hidden" name="latitude" value="35.8690730613163">
												<input type ="hidden" name="longitude" value="128.593296913547">
												<input type ="hidden" name="nowLocation" value="대구 중구 중앙대로 403">
											</c:if>
											<c:if test="${user ne null }">
												<input type="hidden" id="pageNum" name="pageNum">
												<input type ="hidden" name="latitude">
												<input type ="hidden" name="longitude">
												<input type ="hidden" name="nowLocation">
											</c:if>
											
										</form>
							        </div>
									<!-- End of Tab Content -->
									
						        </div>
						    </div>
						</div>
	                      
	                 </div>
	             </div>
			</div>
	        <!-- 검색 끝 -->
	        
	
		</div>
	</div>

	<!-- 추천 전시 -->
	<div class = "row justify-content-center mt-5">
		<div class = "col-8">
			
			<div class="h1" style="font-family: 'Jeju Gothic', sans-serif;">추천 전시</div>
			<div class="card border-0 shadow mb-4">
		        <form id="frm" method="get">
			        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" style="padding :9px;">

						
						<div class="col px-5" >
				
							<div class="card shadow-sm" onclick ="exhibitionView(227)">
								<img src="/exhibition/윤동천 교수 정년퇴임 기념전 산만(散漫)의 궤적.png"  class="bd-placeholder-img card-img-top" width="100%" height="400" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 사진" preserveAspectRatio="xMidYMid slice" focusable="false">
								<div class="card-body">
									<div class="align-items-center">
										<div class="mb-2">윤동천 교수 정년퇴임 기념전 산만의 궤적</div>
										<small class="card-text">2022-06-02</small> <br>
				                		<small class="card-text"> ~ 2022-06-19</small>
							        </div>
								</div>
							</div>
							
						</div>
				        
				        <div class="col px-5" >
				
							<div class="card shadow-sm" onclick ="exhibitionView(181)">
								<img src="/exhibition/2022 다티스트 위치_나_제안.png"  class="bd-placeholder-img card-img-top" width="100%" height="400" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 사진" preserveAspectRatio="xMidYMid slice" focusable="false">
								<div class="card-body">
									<div class="align-items-center">
										<div class="mb-2"> 2022 다티스트 《위치-나-제안》</div>
										<small class="card-text">2022-06-13</small><br> 
				                		<small class="card-text"> ~ 2022-06-30</small>
							        </div>
								</div>
							</div>
							
						</div>
						
						<div class="col px-5" >
				
							<div class="card shadow-sm" onclick ="exhibitionView(229)">
								<img src="/exhibition/환기미술관 30주년 기념전.png"  class="bd-placeholder-img card-img-top" width="100%" height="400" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 사진" preserveAspectRatio="xMidYMid slice" focusable="false">
								<div class="card-body">
									<div class="align-items-center">
										<div class="mb-2">환기미술관 30주년 기념전</div>
										<small class="card-text">2022-04-15</small><br> 
				                		<small class="card-text"> ~ 2022-07-10</small>
							        </div>
								</div>
							</div>
							
						</div>
						
			        </div>
			        <input type="hidden" id = "exNo" name="exNo" value="전시번호">
		        </form>
	        </div>
	        
		</div>
	</div>
	
	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    
<script>
	document.onload = () => {
// 		$.ajax('recommendation')
	}
	
	function exhibitionView(n){
		frm.exNo.value= n;
		frm.action = "${pageContext.request.contextPath}/exhibition/detailView";
		frm.submit();
	}
	
	// 검색 [전체] 선택 시 검색창 비우기
	function allSelected() {
		var selected = document.getElementById("type");
		if (selected.options[selected.selectedIndex].value == 1) {
			document.getElementById("keyword").value = '';
		}
	
	}
	
// 	현재위치 재설정
	function locationN() {
		new daum.Postcode({
			oncomplete : function(data) {
				console.log(data)
				$.ajax({
					url:"https://dapi.kakao.com/v2/local/search/address.json?query="+encodeURIComponent(data.address + ' '+data.buildingName),
					type : "GET",
					headers: {'Authorization' : 'KakaoAK ee381ad2653c27997305ec26eef7c94b'},
				success:function(xy){
					console.log(xy);
					
					$('input[name=latitude]').attr('value',xy.documents[0].y);
					$('input[name=longitude]').attr('value',xy.documents[0].x);
					$('input[name=nowLocation]').attr('value',xy.documents[0].address_name);
					console.log(document.getElementById('nowLocation').value)
					searchForm.submit();
// 					XYget(xy.documents[0].y,xy.documents[0].x);
					
				},
				error : function(e){
					console.log(e);
				}
				
				});
			}
		}).open();
	}
</script>