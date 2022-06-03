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
                                <h1 id="title" class="mb-0 h3" style="font-family: 'Jeju Gothic', sans-serif;">일반회원 가입</h1>
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
					                                <div id="emailValidation" class="validationResult mb-1" style="font-size: small; color: red;">&nbsp;</div>
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
			                                        <div id="passwordValidation" class="validationResult mt-2 mb-1" style="font-size: small; color: red;">&nbsp;</div>
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
					                            <div id="nameValidation" class="validationResult mt-2 mb-1" style="font-size: small; color: red;">&nbsp;</div>
					                            
				                                <div class="mb-2">
				                                    <div>
				                                        <label for="">연락처</label>
				                                        <div id="tel" class="input-group">
					                                        <select class="form-select w-30" id="tel1">
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
				                                        <input class="form-control" id="address1" type="text" required readonly>
				                                    </div>
					                            </div>
				                                <div class="mb-2">
				                                    <div>
				                                        <input class="form-control" id="address2" type="text" required>
				                                    </div>
					                            </div>
					                            <div id="addressValidation" class="validationResult mt-2 mb-1" style="font-size: small; color: red;">&nbsp;</div>
					                            
					                            <div id="buisnessDiv" class="row" style="display: none;">
					                                <div class="col-sm-4 mb-2">
				                                        <label data-bs-toggle="tooltip" data-bs-placement="top" title="대표자명은 이전 페이지에서 입력한 이름으로 검사합니다.">
				                                        	사업자등록번호 
				                                        </label>
				                                        <input class="form-control" id="buisnessNum" placeholder="'-' 제외" required>
					                                </div>
					                                <div class="col-sm-4 mb-2">
				                                        <label for="">개업일</label>
				                                        <input class="form-control" id="buisnessStartDate" placeholder="yyyyMMdd" required>
					                                </div>
					                                <div class="col-sm-4 mb-2">
				                                        <label for="">사업유형</label>
				                                        <select class="form-select w-30" id="buisnessType">
					                                        <option value="00202" selected>전시</option>
					                                        <option value="00204">매장</option>
					                                    </select>
					                                </div>
						                            <div id="buisnessNumValidation" class="validationResult mb-1" style="font-size: small; color: red;">&nbsp;</div>
				                                </div>
					                            
					                            
					                            <input type="button" class="btn btn-gray-800 mb-4" value="이전" onclick="$('#previous')[0].click()" style="width: 100%;">
					                            
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
				                                    <div id="termValidation" class="validationResult mb-2" style="font-size: small; color: red;">&nbsp;</div>
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


	<!-- kakao 주소 검색 api -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
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

	<!-- script -->
	<script>
		// 회원가입 결과 알림창
		const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-primary',
            cancelButton: 'btn btn-gray'
	        },
	        buttonsStyling: false
	    });
		

		// 폼 초기화
		function resetForm() {
			// 입력값 초기화
			$('form').each(function() {this.reset()});
			$('#email2').removeAttr('readonly');
			
			// validation 초기화
			$('input').removeClass('is-invalid');
			$('input').removeClass('is-valid');
			$('#termCheckbox').removeAttr('style');
			$('.validationResult').html('&nbsp;');
		}
		
		// 회원 유형 선택시 폼 초기화 
		// 사업자회원 선택시 사업자등록번호 폼 출력
		$('#tabs-text-1-tab').on('click', () => {
			resetForm();
			$('#title').html('일반회원 가입')
			$('#buisnessDiv').removeClass('active');
			$('#buisnessDiv').attr('style','display: none;');
		});
		
		$('#tabs-text-3-tab').on('click', () => {
			resetForm();
			$('#title').html('사업자회원 가입')
			$('#buisnessDiv').addClass('active');
			$('#buisnessDiv').removeAttr('style');
			
			// 테스트용 사업자번호 입력 TODO
			$('#buisnessNum').val("5048600471");
			$('#buisnessStartDate').val("20120709");
		});
		
		
		// form1 시작
		
		// 메일 주소 선택
		$('#site').on('change', function() {
			// 주소 변경 시 validation 초기화
			$('#email2').removeClass('is-invalid');
			$('#email2').removeClass('is-valid');
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
			} else {
				$('#email1').addClass('is-valid');
			}

			// 이메일 주소 미입력 시
			if ($('#email2').val() == '') {
				$('#email2').addClass('is-invalid');
				$('#emailValidation').html('이메일을 확인하세요.');
				isValid = false;
			} else {
				$('#email2').addClass('is-valid');
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
			} else {
				$('#password1').addClass('is-valid');
				$('#password2').addClass('is-valid');
			}
			
			// 이메일 중복체크 TODO
			if (isValid) {
				const email = $('#email1').val() + '@' + $('#email2').val();
				
				$.ajax('emailCheck?email='+email)
				.done ( isValidEmail => {
					
					if (!isValidEmail) {
						// 이메일 중복
						$('#email1').addClass('is-invalid');
						$('#email2').addClass('is-invalid');
						$('#emailValidation').html('이미 사용중인 이메일입니다.');
					} else {
						// validation 통과
						$('#email1').removeClass('is-invalid');
						$('#email2').removeClass('is-invalid');
						$('#email1').addClass('is-valid');
						$('#email2').addClass('is-valid');
						$('#tabs-text-2-tab')[0].click();
					}
				})
			}
			
			 
		});
		
		// form1 입력값 수정 시 validation 초기화
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
		$('#tel').on('keydown', event => { if (!isFinite(event.key) && event.key != 'Backspace') event.preventDefault(); } );
		
		// 연락처 커서 이동
		$('#tel2').on('keyup', event => { if (event.target.value.length == 4) $('#tel3').focus(); } );
		
		
		// 사업자등록번호에 문자 입력 방지
		$('#buisnessNum').on('keydown', event => { if (!isFinite(event.key) && event.key != 'Backspace') event.preventDefault(); } );

		// 개업일에 문자 입력 방지
		$('#buisnessStartDate').on('keydown', event => { if (!isFinite(event.key) && event.key != 'Backspace') event.preventDefault(); } );
		
		// 주소 검색 기능
		$('#addressSearchBtn').on('click', event => {
			event.preventDefault();
			
			// kakao 주소검색 api
			new daum.Postcode({
				oncomplete : function(data) {
					// 주소 validation 결과 초기화
					$('#zipcode').removeClass('is-invalid');
					$('#address1').removeClass('is-invalid');
					$('#addressValidation').html('&nbsp;');
					
					$('#zipcode').val(data.zonecode);
					$('#address1').val(data.roadAddress);
				}
			}).open();
		});
		
		// 회원가입 버튼 클릭 시 form2 체크
		$('#registerBtn').on('click', () => {
			let isValid = true;
			
			
			// 이름 미입력 시
			if ($('#name').val() == '') {
				$('#name').addClass('is-invalid');
				$('#nameValidation').html('이름을 입력하세요.');
				isValid = false;
			} else {
				$('#name').addClass('is-valid');
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
				$('#zipcode').addClass('is-invalid');
				$('#address1').addClass('is-invalid');
				$('#addressValidation').html('주소를 입력하세요.');
				isValid = false;
			} else {
				$('#zipcode').addClass('is-valid');
				$('#address1').addClass('is-valid');
			}
			
			// 사업자등록번호 검증
			if ($('#buisnessDiv').attr('class') == 'row active') {
				// 사업자등록번호 미입력 시
				if ($('#buisnessNum').val() == '') {
					$('#buisnessNum').addClass('is-invalid');
					$('#buisnessNumValidation').html('사업자등록번호, 개업일을 확인하세요.');
					isValid = false;
				}
	
				if ($('#buisnessStartDate').val() == '') {
					$('#buisnessStartDate').addClass('is-invalid');
					$('#buisnessNumValidation').html('사업자등록번호, 개업일을 확인하세요.');
					isValid = false;
				}
			
				const data = {
						  		"businesses": [
					    			{
								      "b_no": $('#buisnessNum').val(),
								      "start_dt": $('#buisnessStartDate').val(),
								      "p_nm": "서강중",// $('#name').val(), TODO
								      "p_nm2": "",
								      "b_nm": "",
								      "corp_no": "",
								      "b_sector": "",
								      "b_type": ""
							    	}
							  	]
							};
				
				$.ajax({
				  url: "https://api.odcloud.kr/api/nts-businessman/v1/validate?serviceKey=0EXleDG3eHrYpbOj1Y9g6imFIIuMOJOpIOvaXrzGBflr8L7qSfTUMAU7MskTa5cKVWJtzQ5IQmA09P2fliKdnw%3D%3D",
				  type: "POST",
				  data: JSON.stringify(data),
				  dataType: "JSON",
				  contentType: "application/json",
				  accept: "application/json",
				  success: function(result) {
				      const isValidBuisness = (result.data[0].valid == '01')? true : false;
					  const buisnessStatus = isValidBuisness? result.data[0].status.b_stt_cd : '';
				      
					  // 사업자등록번호 확인 불가
				      if (!isValidBuisness) {
				    	  $('#buisnessNum').addClass('is-invalid');
				    	  $('#buisnessStartDate').addClass('is-invalid');
				    	  $('#buisnessNumValidation').html('사업자등록번호를 ' + result.data[0].valid_msg);
				    	  isValid = false;
				      }
	
					  // 사업상태가 계속사업자가 아님
				      if (buisnessStatus == '02' || buisnessStatus == '03') {
				    	  buisnessStatus = result.data[0].status.b_stt.substring(0,2);
				    	  $('#buisnessNum').addClass('is-invalid');
				    	  $('#buisnessStartDate').addClass('is-invalid');
				    	  $('#buisnessNumValidation').html(buisnessStatus + '상태의 사업자등록번호입니다.');
				    	  isValid = false;
				      }
				      
					  // validation 통과
					  if (isValidBuisness) {
				    	  $('#buisnessNum').removeClass('is-invalid');
				    	  $('#buisnessStartDate').removeClass('is-invalid');
				    	  $('#buisnessNumValidation').html('&nbsp;');
				    	  
				    	  $('#buisnessNum').addClass('is-valid');
				    	  $('#buisnessStartDate').addClass('is-valid');
					  }
				      
				      
				  },
				  error: function(result) {
					  alert('오류가 발생했습니다.');
				      console.log(result.responseText); //responseText의 에러메세지 확인
				  }
				});
			}
			
			// 약관 미동의 시
			if (!termCheckbox.checked) {
				$('#termCheckbox').attr('style', 'border: 1px solid red;');
				$('#termValidation').html('이용약관에 동의해야 합니다.');
				isValid = false;
			}
			
			
			// 회원가입 성공
			if (isValid) {
				const member = {
								"email": $('#email1').val() + '@' + $('#email2').val(),
								"password": $('#password1').val(),
								"name": $('#name').val(),
								"tel": $('#tel1').val() + '-' + $('#tel2').val() + '-' + $('#tel3').val(),
								"buisnessNum": $('#buisnessNum').val(),
								"address": $('#address1').val(),
								"addressDetail": $('#address2').val(),
								"buisnessType": $('#buisnessType').val(),
								};
				
				console.log(member);
				
				$.ajax({
					url: 'sign-up',
					method: 'post',
					data: JSON.stringify(member),
					contentType: 'application/json; charset=UTF-8'
				}).done( response => {
					
					if (response != 'fail') {
						swalWithBootstrapButtons.fire({
				            icon: 'warning',
				            title: '이메일이 발송되었습니다.',
				            text: '이메일 인증 완료 후 정상 이용이 가능합니다.',
				            showConfirmButton: true,
				        });
						setTimeout(() => { location.href = "<c:out value='${pageContext.request.contextPath}'/>"; }, 2000);
						
					} else {
						swalWithBootstrapButtons.fire({
			                icon: 'error',
			                title: '오류가 발생했습니다.',
			                text: '잠시 후 다시 시도해 주세요.'
			            });
					}
				}).fail(response => {
					console.log(response);
				})
			}
		});
		
		// form2 입력값 수정 시 validation 초기화
		// 주소 validation은 주소검색 완료에서 초기화
		$('#form2 input').on('change', event => {
			const id = event.target.id;
			
			if (id == 'name') {
				$('#name').removeClass('is-invalid');
				$('#nameValidation').html('&nbsp;');
			}
			
			if (id.startsWith('tel')) {
				$('#tel input').removeClass('is-invalid');
				$('#telValidation').html('&nbsp;');
			}
			
			if (id.startsWith('buisness')) {
				$('#buisnessDiv input').removeClass('is-invalid');
				$('#telValidation').html('&nbsp;');
			}
			

			if (id == 'termCheckbox') {
				$('#termCheckbox').removeClass('is-invalid');
				$('#termValidation').html('&nbsp;');
			}
		});
		
		
	</script>

</body>

</html>
