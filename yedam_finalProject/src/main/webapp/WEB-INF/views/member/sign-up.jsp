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

<!-- NOTICE: You can use the _analytics.html partial to include production code specific code & trackers -->



<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->

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
        <section class="vh-lg-100 mt-5 mt-lg-0 bg-soft d-flex align-items-center">
            <div class="container">
                	<div class="row justify-content-center">
	                	<div class="col-2 mb-3">
		                    <a class="d-flex align-items-center justify-content-center" onclick="history.back()">
		                        <svg class="icon icon-xs me-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.707 14.707a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l2.293 2.293a1 1 0 010 1.414z" clip-rule="evenodd"></path></svg>
								<span>돌아가기</span>
		                    </a>
	                	</div>
                    </div>	
                <div class="row justify-content-center">
                    <div class="col-12 d-flex align-items-center justify-content-center">
                        <div class="bg-white shadow border-0 rounded border-light p-4 p-lg-5 w-100 fmxw-500">
                            <div class="text-center text-md-center mb-4 mt-md-0">
                                <h1 class="mb-0 h3" style="font-family: 'Jeju Gothic', sans-serif;">회원가입</h1>
                            </div>
                            
                            
                            <!-- Tab Nav -->
							<div class="nav-wrapper position-relative mb-2 justify-content-between">
							    <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-text" role="tablist">
							        <li class="nav-item" style="font-family: 'Jeju Gothic', sans-serif;">
							            <a class="nav-link mb-sm-3 mb-md-0 active" id="tabs-text-1-tab" data-bs-toggle="tab" href="#tabs-text-1" role="tab" aria-controls="tabs-text-1" aria-selected="true">일반회원</a>
							            <a class="nav-link mb-sm-3 mb-md-0 d-none" id="previous" data-bs-toggle="tab" href="#tabs-text-1" role="tab" aria-controls="tabs-text-1" aria-selected="false">일반회원</a>
							            <a class="nav-link mb-sm-3 mb-md-0 d-none" id="tabs-text-2-tab" data-bs-toggle="tab" href="#tabs-text-2" role="tab" aria-controls="tabs-text-2" aria-selected="false">일반회원2</a>
							        </li>
							        <li class="nav-item" style="font-family: 'Jeju Gothic', sans-serif;">
							            <a class="nav-link mb-sm-3 mb-md-0" id="tabs-text-3-tab" data-bs-toggle="tab" href="#tabs-text-1" role="tab" aria-controls="tabs-text-1" aria-selected="false">사업자회원</a>
							        </li>
							    </ul>
							</div>
							<!-- End of Tab Nav -->
							<!-- Tab Content -->
							<div class="card border-0">
							    <div class="card-body p-0">
							        <div class="tab-content" id="tabcontent1">
							                
						            	<div class="tab-pane fade show active" id="tabs-text-1" role="tabpanel" aria-labelledby="tabs-text-1-tab">
					                        <form id="form1">
					                            <div class="row">
					                                <div class="col-sm-5 mb-2" style="padding-right: 0px;">
					                                    <div class="form-group">
					                                        <label for="">이메일</label>
					                                        <input class="form-control" id="email1" type="text" placeholder="이메일" required value="test">
					                                    </div>
					                                </div>
					                                <div class="col-sm-3 mb-2" style="padding: 0 5px;">
					                                    <div class="form-group">
					                                        <label for="">&nbsp;</label>
					                                        <input class="form-control" id="email2" type="text" placeholder="&nbsp;&nbsp;주소" required style="padding-left: 5px; padding-right: 5px" value="test">
					                                    </div>
					                                </div>
					                                <div class="col-sm-4 mb-2" style="padding-left: 0px;">
					                                    <label for="">&nbsp;</label>
					                                    <select class="form-select w-100 mb-0" id="site" style="padding-left: 5px; padding-right: 5px">
					                                        <option value="" selected>&nbsp;&nbsp;직접 입력</option>
					                                        <option value="naver.com">&nbsp;&nbsp;naver.com</option>
					                                        <option value="gmail.com">&nbsp;&nbsp;gmail.com</option>
					                                        <option value="hanmail.com">&nbsp;&nbsp;hanmail.com</option>
					                                        <option value="nate.com">&nbsp;&nbsp;nate.com</option>
					                                    </select>
					                                </div>
					                                <div id="emailValidation" class="validationResult mb-4" style="font-size: small; color: red;">&nbsp;</div>
					                            </div>
					                            
					                            <div class="form-group mb-3">
			                                        <label for="">비밀번호</label>
			                                        <div class="input-group">
			                                            <span class="input-group-text" id="basic-addon2">
			                                                <svg class="icon icon-xs text-gray-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"></path></svg>
			                                            </span>
			                                            <input type="password" class="form-control" id="password1" required value="test">
			                                        </div>  
			                                    </div>

			                                    <div class="form-group mb-4">
			                                        <label for="">비밀번호 확인</label>
			                                        <div class="input-group">
			                                            <span class="input-group-text" id="basic-addon2">
			                                                <svg class="icon icon-xs text-gray-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"></path></svg>
			                                            </span>
			                                            <input type="password" class="form-control" id="password2" required value="test">
			                                        </div>
			                                        <div id="passwordValidation" class="validationResult mt-2 mb-3" style="font-size: small; color: red;">&nbsp;</div>
			                                    </div>
					                            
					                        </form>

				                            <input type="button" id="nextBtn" class="btn btn-gray-800" value="다음" style="width: 100%;">
					                            
							            </div>
				                        
							            <div class="tab-pane fade" id="tabs-text-2" role="tabpanel" aria-labelledby="tabs-text-2-tab">
							            	<form id="form2">
				                                <div class="mb-2">
				                                    <div>
				                                        <label for="">이름</label>
				                                        <input class="form-control" id="name" type="text" required>
				                                    </div>
					                            </div>
					                            <div id="nameValidation" class="validationResult mt-2 mb-3" style="font-size: small; color: red;">&nbsp;</div>
					                            
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
				                                        <input class="form-control" id="address1" type="text" required readonly>
				                                    </div>
					                            </div>
				                                <div class="mb-2">
				                                    <div>
				                                        <input class="form-control" id="address2" type="text" required>
				                                    </div>
					                            </div>
					                            <div id="addressValidation" class="validationResult mt-2 mb-3" style="font-size: small; color: red;">&nbsp;</div>
					                            
				                                <div class="mb-2">
				                                    <div>
				                                        <label for="">연락처</label>
				                                        <div id="tel" class="input-group">
					                                        <select class="form-select w-30" id="tel1" name="state" aria-label="State select example">
						                                        <option value="010" selected>010</option>
						                                        <option value="011">011</option>
						                                        <option value="017">017</option>
						                                        <option value="018">018</option>
						                                    </select>
					                                        <input class="form-control w-30" id="tel2" type="text" maxlength="4" required>
					                                        <input class="form-control w-30" id="tel3" type="text" maxlength="4" required>
				                                        </div>
				                                    </div>
					                            </div>
		                                        <div id="telValidation" class="validationResult mt-2 mb-3" style="font-size: small; color: red;">&nbsp;</div>
					                            
					                            <div class="mb-2" id="buisnessNumDiv">
				                                    <div>
				                                        <label for="">사업자등록번호</label>
				                                        <div class="input-group">
					                                        <input class="form-control" id="buisnessNum" type="text" required>
					                                        <button class="btn btn-outline-gray-700" id="buisnessNumCheckBtn">확인</button>
				                                        </div>
				                                    </div>
					                            </div>
					                            <div id="buisnessNumValidation" class="validationResult mt-2 mb-3" style="font-size: small; color: red;">&nbsp;</div>
					                            
					                            <input type="button" class="btn btn-gray-800 mb-5" value="이전" onclick="$('#previous')[0].click()" style="width: 100%;">
					                            
					                            <div class="form-group">
				                                    <div class="mb-1">
				                                        <div class="form-check">
				                                            <input class="form-check-input" type="checkbox" id="termCheckbox">
				                                            <a class="fw-bold" data-bs-toggle="modal" data-bs-target="#modal-default" style="text-decoration: underline;">서비스 이용약관</a>
				                                            <label class="form-check-label fw-normal mb-0" for="">
				                                            	에 동의합니다.
				                                            </label>
				                                        </div>
				                                    </div>
				                                    <div id="termValidation" class="validationResult mt-2 mb-3" style="font-size: small; color: red;">&nbsp;</div>
				                                </div>
				                            </form>
				                            
			                                <div class="d-grid">
			                                    <button id="registerBtn" class="btn btn-gray-800">회원가입</button>
			                                </div>
							            </div>


							        </div>
							    </div>
							</div>
							<!-- End of Tab Content -->
							
							
	                            
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    
    
    <!-- 이용약관 modal -->
	<div class="modal fade" id="modal-default" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h2 class="h6 modal-title">이용약관</h2>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <jsp:include page="term.jsp"/>
	            </div>
	            <div class="modal-footer">
	                <button type="button" id="class="btn btn-link text-gray-600 ms-auto" data-bs-dismiss="modal">확인</button>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- End of Modal Content -->


	<!-- script -->
	<script>

		// 폼 초기화
		function resetForm() {
			// 입력값 초기화
			$('form').each(function() {this.reset()});
			$('#email2').removeAttr('readonly');
			
			// validation 초기화
			$('input').removeClass('is-invalid');
			$('#termCheckbox').removeAttr('style');
			$('.validationResult').html('&nbsp;');
		}
		
		// 회원 유형 선택시 폼 초기화 
		// 사업자회원 선택시 사업자등록번호 폼 출력
		$('#tabs-text-1-tab').on('click', () => {
			resetForm();
			$('#buisnessNumDiv').attr('style','display: none;');
			$('#buisnessNumValidation').attr('style','display: none;');
		});
		
		$('#tabs-text-3-tab').on('click', () => {
			resetForm();
			$('#buisnessNumDiv').removeAttr('style');
			$('#buisnessNumValidation').removeAttr('style');
		});
		
		
		// form1 시작
		
		// 메일 주소 선택
		$('#site').on('change', function() {
			$('#email2').val(this.value);
			
			// 직접입력을 선택하면 입력칸 활성화
			if(this.value == '') {
				$('#email2').removeAttr('readonly');
			} else {
				$('#email2').attr('readonly','readonly');
			}
		});
		
		// 다음 버튼 클릭시 form1 체크
		$('#nextBtn').on('click', () => {
			let isValid = true;
			
			// 이메일 미입력 시
			if ($('#email1').val() == '') {
				$('#email1').addClass('is-invalid');
				$('#emailValidation').html('이메일을 확인하세요.');
				isValid = false;
			}

			// 이메일 주소 미입력 시
			if ($('#email2').val() == '') {
				$('#email2').addClass('is-invalid');
				$('#emailValidation').html('이메일을 확인하세요.');
				isValid = false;
			}
			
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
			}
			
			// 이메일 중복체크 TODO
			
			if (isValid) $('#tabs-text-2-tab')[0].click()
		});
		
		// 입력값 수정 시 validation 초기화
		$('#form1 input').on('change', event => {
			const id = event.target.id;
			
			if (id == 'email1') {
				$('#email1').removeClass('is-invalid');
				$('#emailValidation').html('&nbsp;');
			}
			if (id == 'email2') {
				$('#email2').removeClass('is-invalid');
				$('#emailValidation').html('&nbsp;');
			}
			
			if (id.startsWith('password')) {
				$('#password1').removeClass('is-invalid');
				$('#password2').removeClass('is-invalid');
				$('#passwordValidation').html('&nbsp;');
			}
		});
		
		// 주소 select 태그 변경 시 validation 초기화
		$('#site').on('change', () => {
			$('#email2').removeClass('is-invalid');
			$('#emailValidation').html('&nbsp;');
		});
		
		// form1 끝
		
		
		// form2 시작
		
		// 이름에 숫자 입력 방지
		$('#name').on('keydown', event => { if (isFinite(event.key)) event.preventDefault(); } );
		
		// 연락처에 문자 입력 방지
		$('#tel').on('keydown', event => { if (!isFinite(event.key)) event.preventDefault(); } );
		
		// 회원가입 버튼 클릭 시 form2 체크
		$('#registerBtn').on('click', () => {
			let isValid = true;
			
			
			// 이름 미입력 시
			if ($('#name').val() == '') {
				$('#name').addClass('is-invalid');
				$('#nameValidation').html('이름을 입력하세요.');
				isValid = false;
			}
			
			// 주소(address1) 미입력 시
			if ($('#address1').val() == '') {
				$('#zipcode').addClass('is-invalid');
				$('#address1').addClass('is-invalid');
				$('#addressValidation').html('주소를 입력하세요.');
				isValid = false;
			}
			
			// 연락처 미입력 시
			if ($('#tel2').val() == '') {
				$('#tel2').addClass('is-invalid');
				$('#telValidation').html('연락처를 입력하세요.');
				isValid = false;
			}

			if ($('#tel3').val() == '') {
				$('#tel3').addClass('is-invalid');
				$('#telValidation').html('연락처를 입력하세요.');
				isValid = false;
			}
			
			// 사업자등록번호 미입력 시
			if ($('#buisnessNum').val() != $('#password2').val()) {
				$('#buisnessNum').addClass('is-invalid');
				$('#buisnessNumValidation').html('사업자등록번호를 입력하세요.');
				isValid = false;
			}
			
			// 사업자등록번호 미확인 시
			
			
			// 약관 미동의 시
			if (!termCheckbox.checked) {
				$('#termCheckbox').attr('style', 'border: 1px solid red;');
				$('#termValidation').html('이용약관에 동의해야 합니다.');
				isValid = false;
			}
		});
		
		
	</script>

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

    
</body>

</html>
