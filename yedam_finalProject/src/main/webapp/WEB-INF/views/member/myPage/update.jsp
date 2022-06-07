<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <main>

	<div class="row justify-content-center">
	    <div class="col-12 d-flex align-items-center justify-content-center">
	        <div class="bg-white shadow border-0 rounded border-light p-4 p-lg-5 w-100 fmxw-500">
	            <div class="text-center text-md-center mb-4 mt-md-0">
	                <h1 class="mb-0 h3" style="font-family: 'Jeju Gothic', sans-serif;">비밀번호 확인</h1>
	            </div>
                <input type="hidden"id="email" name="email" value="${user.email }">
                
                <div class="form-group">
                    <!-- Form -->
                    <div class="form-group mb-4">
                        <label for="password">비밀번호</label>
                        <div class="input-group">
                            <span class="input-group-text" id="basic-addon2">
                                <svg class="icon icon-xs text-gray-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"></path></svg>
                            </span>
                            <input type="password" placeholder="비밀번호" class="form-control" id="password" name="password" required style="font-family: sans-serif;">
                        </div>  
                    </div>
                    <!-- End of Form -->
                </div>
	            
	            <div class="d-grid">
	                <button id="submit" class="btn btn-gray-800">확인</button>
	            </div>
	            
	        </div>
	    </div>
	</div>
</main>
    

<script>
	
	window.onload = function() {
		// 알림창
		const swalWithBootstrapButtons = Swal.mixin({
	        customClass: {
	            confirmButton: 'btn btn-primary',
	            cancelButton: 'btn btn-gray'
		        },
		        buttonsStyling: false
		    });
		
		// 로그인 버튼 클릭 시
		$('#submit').on('click', () => {
			const form = $('<form>');
			form.append($('<input>').attr('name','email').attr('value', $('#email').val()))
				.append($('<input>').attr('name','password').attr('value', $('#password').val()));
			
			$.ajax({
				url: 'sign-in',
				method: 'post',
				data: form.serialize()
			}).done(result => {
				
				if (result == 'success') {
					$('<form>').attr('method', 'post').attr('action','updateInfo').appendTo('main').submit();
					
				} else if(result == 'email') {
					swalWithBootstrapButtons.fire({
		                icon: 'error',
		                title: '이메일을 확인해 주세요.',
		                timer: 800
		            });
					
				} else if(result == 'pw') {
					swalWithBootstrapButtons.fire({
		                icon: 'error',
		                title: '비밀번호를 확인해 주세요.',
	                	timer: 800
		            });
				}
			});
		});
		
	}
	
</script>

</body>
</html>