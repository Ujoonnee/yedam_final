<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--

=========================================================
* Volt Pro - Premium Bootstrap 5 Dashboard
=========================================================

* Product Page: https://themesberg.com/product/admin-dashboard/volt-bootstrap-5-dashboard
* Copyright 2021 Themesberg (https://www.themesberg.com)
* License (https://themesberg.com/licensing)

* Designed and coded by https://themesberg.com

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. Please contact us to request a removal.

-->
<!DOCTYPE html>
<html lang="ko">

<head> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Primary Meta Tags -->
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="title" content="회원가입">


<!-- Sweet Alert -->
<link type="text/css" href="${pageContext.request.contextPath}/resources/vendor/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">

<!-- Notyf -->
<link type="text/css" href="${pageContext.request.contextPath}/resources/vendor/notyf/notyf.min.css" rel="stylesheet">

<!-- Volt CSS -->
<link type="text/css" href="${pageContext.request.contextPath}/resources/css/volt.css" rel="stylesheet">

<!-- material icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<!-- NOTICE: You can use the _analytics.html partial to include production code specific code & trackers -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<style>
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	html {overflow-x:hidden; overflow-y:auto;}
	body {font-family: 'Jeju Gothic', sans-serif;}
	input[type="password"] {font-family: sans-serif;}
</style>

</head>

<body>

    <!-- NOTICE: You can use the _analytics.html partial to include production code specific code & trackers -->
    

    <main>

        <!-- Section -->
        <section class="vh-lg-100 mt-5 mt-lg-0 bg-soft d-flex align-items-center justify-content-center">
			<div class="d-flex align-items-center justify-content-center">
				<div class="bg-white shadow border-0 rounded border-light p-4 p-lg-5 w-100 fmxw-500">

					<div class="card border-0">
					    <div class="card-body p-0">
                            <div class="form-group mb-3">
                                <label for="">이메일</label>
                                <input class="form-control" type="text" required value="${user.email }" disabled>
                            </div>
                            
                            <div class="form-group mb-3">
                                      <label for="">비밀번호</label>
                                      <div class="input-group">
                                          <span class="input-group-text" id="basic-addon2">
                                              <svg class="icon icon-xs text-gray-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"></path></svg>
                                          </span>
                                          <input type="password" class="form-control" id="password1" required value=>
                                      </div>  
                                  </div>

                                  <div class="form-group mb-4">
                                      <label for="">비밀번호 확인</label>
                                      <div class="input-group">
                                          <span class="input-group-text" id="basic-addon2">
                                              <svg class="icon icon-xs text-gray-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"></path></svg>
                                          </span>
                                          <input type="password" class="form-control" id="password2" required value=>
                                      </div>
                                      <div id="passwordValidation" class="validationResult mt-2 mb-1" style="font-size: small; color: red;">&nbsp;</div>
                                  </div>
                            
                            <div class="mb-4">
                                   <div>
                                       <label for="">이름</label>
                                       <input class="form-control" type="text" value="${user.name }" disabled>
                                   </div>
                            </div>
                            
                               <div class="mb-2">
                                   <div>
                                       <label for="">연락처</label>
                                       <div id="tel" class="input-group">
                                        <select class="form-select w-30" id="tel1">
	                                        <option value="010">010</option>
	                                        <option value="011">011</option>
	                                        <option value="017">017</option>
	                                        <option value="018">018</option>
	                                    </select>
                                        <input class="form-control w-30" id="tel2" type="text" maxlength="4" required>
                                        <input class="form-control w-30" id="tel3" type="text" maxlength="4" required>
                                       </div>
                                   </div>
                            </div>
                               <div id="telValidation" class="validationResult mt-2 mb-1" style="font-size: small; color: red;">&nbsp;</div>
                            
                               <div class="row mb-1">
                                   <div class="col-7">
                                       <label for="">주소</label>
                                       <div class="input-group">
                                        <input id="zipcode" class="form-control" type="text" required readonly>
                                        <button class="btn btn-outline-gray-700" id="addressSearchBtn">검색</button>
                                       </div>
                                   </div>
                            </div>
                               <div class="mb-1">
                                   <div>
                                       <input class="form-control" id="address1" type="text" value="${user.address }" readonly>
                                   </div>
                            </div>
                               <div class="mb-2">
                                   <div>
                                       <input class="form-control" id="address2" type="text" value="${user.addressDetail }">
                                   </div>
                            </div>
                            <div id="addressValidation" class="validationResult mt-2 mb-1" style="font-size: small; color: red;">&nbsp;</div>
                            
                            <c:if test="${user.memType eq '00103' }">
	                            <div id="buisnessDiv" class="row justify-content-between">
	                                <div class="col-sm-5 mb-2">
                                        <label data-bs-toggle="tooltip" data-bs-placement="top" title="대표자명은 이전 페이지에서 입력한 이름으로 검사합니다.">
                                        	사업자등록번호 
                                        </label>
                                        <input class="form-control" id="buisnessNum" placeholder="'-' 제외" value="${user.buisnessNum }" disabled>
	                                </div>
	                                <div class="col-sm-5 mb-2">
                                        <label for="">사업유형</label>
                                        <select class="form-select w-30" id="buisnessType" disabled>
	                                        <option value="00202">전시</option>
	                                        <option value="00204">매장</option>
	                                    </select>
	                                </div>
                                </div>
                            </c:if>
			            </div>
                            
                        <div class="d-grid mt-5">
                            <button id="updateBtn" class="btn btn-gray-800">수정하기</button>
                        </div>

			        </div>
			    </div>
			</div>
        </section>
    </main>
    
    
	<!-- End of Modal Content -->


	<!-- kakao 주소 검색 api -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<%-- 
    <!-- Core -->
	<script src="${pageContext.request.contextPath}/resources/vendor/@popperjs/core/dist/umd/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<!-- Vendor JS -->
	<script src="${pageContext.request.contextPath}/resources/vendor/onscreen/dist/on-screen.umd.min.js"></script>
	
	<!-- Slider -->
	<script src="${pageContext.request.contextPath}/resources/vendor/nouislider/distribute/nouislider.min.js"></script>
	
	<!-- Smooth scroll -->
	<script src="${pageContext.request.contextPath}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
	
	<!-- Charts -->
	<script src="${pageContext.request.contextPath}/resources/vendor/chartist/dist/chartist.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
	
	<!-- Datepicker -->
	<script src="${pageContext.request.contextPath}/resources/vendor/vanillajs-datepicker/dist/js/datepicker.min.js"></script>
	
	<!-- Sweet Alerts 2 -->
	<script src="${pageContext.request.contextPath}/resources/vendor/sweetalert2/dist/sweetalert2.all.min.js"></script>
	
	<!-- Moment JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>
	
	<!-- Vanilla JS Datepicker -->
	<script src="${pageContext.request.contextPath}/resources/vendor/vanillajs-datepicker/dist/js/datepicker.min.js"></script>
	
	<!-- Notyf -->
	<script src="${pageContext.request.contextPath}/resources/vendor/notyf/notyf.min.js"></script>
	
	<!-- Simplebar -->
	<script src="${pageContext.request.contextPath}/resources/vendor/simplebar/dist/simplebar.min.js"></script>
	
	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	
	<!-- Volt JS -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/volt.js"></script>
--%>
	<!-- script -->
	<script>
		
		window.onload = function() {
			// 결과 알림창
			const swalWithBootstrapButtons = Swal.mixin({
		        customClass: {
		            confirmButton: 'btn btn-primary',
		            cancelButton: 'btn btn-gray'
			        },
			        buttonsStyling: false
			    });
		
			// 기존 전화번호 입력
			const tel = '${user.tel}';
			$('#tel1').val(tel.split('-')[0]);
			$('#tel2').val(tel.split('-')[1]);
			$('#tel3').val(tel.split('-')[2]);
		
			// 연락처에 문자 입력 방지
			$('#tel').on('keydown', event => { if (!isFinite(event.key) && event.key != 'Backspace') event.preventDefault(); } );
			
			// 연락처 커서 이동
			$('#tel2').on('keyup', event => { if (event.target.value.length == 4) $('#tel3').focus(); } );
			
			// 수정 버튼 클릭 시 validation 후 처리
			$('#updateBtn').on('click', () => {
				let isValid = true;
				
				// 비밀번호 미입력 시
				if ($('#password1').val() == '') {
					$('#password1').addClass('is-invalid');
					$('#passwordValidation').html('비밀번호를 확인하세요.');
					isValid = false;
				}
				
				// 비밀번호 확인 미입력 시
				if ($('#password2').val() == '') {
					$('#password2').addClass('is-invalid');
					$('#passwordValidation').html('비밀번호를 확인하세요.');
					isValid = false;
				}
				
				// 비밀번호 미일치 시
				if ($('#password1').val() != $('#password2').val()) {
					$('#password1').addClass('is-invalid');
					$('#password2').addClass('is-invalid');
					$('#passwordValidation').html('비밀번호가 일치하지 않습니다.');
					isValid = false;
				} else {
					$('#password1').addClass('is-valid');
					$('#password2').addClass('is-valid');
				}
				
				// 연락처 미입력 시
				if ($('#tel2').val() == '' || $('#tel2').val().length < 4) {
					$('#tel2').addClass('is-invalid');
					$('#telValidation').html('연락처를 입력하세요.');
					isValid = false;
				} else {
					$('#tel2').addClass('is-valid');
				}
		
				if ($('#tel3').val() == '' || $('#tel3').val().length < 4) {
					$('#tel3').addClass('is-invalid');
					$('#telValidation').html('연락처를 입력하세요.');
					isValid = false;
				} else {
					$('#tel3').addClass('is-valid');
				}
				
				// 주소(address1) 미입력 시
				if ($('#address1').val() == '') {
					$('#address1').addClass('is-invalid');
					$('#addressValidation').html('주소를 입력하세요.');
					isValid = false;
				} else {
					$('#address1').addClass('is-valid');
				}
				
				// 수정 처리
				if (isValid) {
					const member = {
									"password": $('#password1').val(),
									"tel": $('#tel1').val() + '-' + $('#tel2').val() + '-' + $('#tel3').val(),
									"address": $('#address1').val(),
									"addressDetail": $('#address2').val(),
									};
					
					console.log(member);
					
					$.ajax({
						url: 'update',
						method: 'post',
						data: JSON.stringify(member),
						contentType: 'application/json; charset=UTF-8'
					}).done( response => {
						
						if (response == 'success') {
							swalWithBootstrapButtons.fire({
					            icon: 'success',
					            title: '적용되었습니다!',
					            showConfirmButton: true,
					            timer: 1000
					        });
							
						} else {
							console.log(response);
						}
					}).fail(response => {
						console.log(response);
						
						swalWithBootstrapButtons.fire({
			                icon: 'error',
			                title: '오류가 발생했습니다.',
			                text: '잠시 후 다시 시도해 주세요.',
			                timer: 1000
			            });
					})
				}
				
			});
			
			// form1 입력값 수정 시 validation 초기화
			$('input').on('change', event => {
				const id = event.target.id;
				
				if (id.startsWith('password')) {
					$('#password1').removeClass('is-invalid');
					$('#password2').removeClass('is-invalid');
					$('#passwordValidation').html('&nbsp;');
				}
				
				if (id.startsWith('tel')) {
					$('#tel input').removeClass('is-invalid');
					$('#telValidation').html('&nbsp;');
				}
			});
			
			// 주소 검색 기능
			$('#addressSearchBtn').on('click', event => {
				console.log(event)
				event.preventDefault();
				
				// kakao 주소검색 api
				new daum.Postcode({
					oncomplete : function(data) {
						// 주소 validation 결과 초기화
						$('#address1').removeClass('is-invalid');
						$('#addressValidation').html('&nbsp;');
						
						$('#zipcode').val(data.zonecode);
						$('#address1').val(data.roadAddress);
					}
				}).open();
			});
			
		};
		
	</script>

</body>

</html>
