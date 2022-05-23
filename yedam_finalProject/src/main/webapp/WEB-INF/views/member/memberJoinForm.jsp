<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

<form id="frm" name="frm" action="memberJoin.do" method="post">
		<h3>@@@@@회원가입@@@@@</h3>
		
		<div id="Join" align="left">
			<div id="id_pass">
				<table>
					<tr>
						<th>*ID</th>
						<td id="user_id">
						<input type="text" id="email" 
							required="required" placeholder="이메일을 입력하세요." value="test">
						<span id="middle">@</span>
						<input type="text" id="email_address" list="user_email_address">
						<datalist id="user_email_address">
							<option value="naver.com" selected></option>
							<option value="google.com"></option>
							<option value="nate.com"></option>
							<option value="직접입력"></option>
						</datalist>
						<input type="hidden" id="totalemail" name="email" value="">
			
							<button type="button" id="checkId" value="No"
								onclick="isIdCheck()">중복체크</button>
						</td>
					</tr>
					<tr>
						<th>*비밀번호</th>
						<td id="user_password"><input type="password" id="password"
							name="password" onchange="isSame()" required="required"
							placeholder="비밀번호를 입력하세요." value="111111"></td>
					</tr>
					<tr>
						<th>*비밀번호확인</th>
						<td id="user_passwordCheck"><input type="password"
							id="password1" name="password1" onchange="isSame()"
							required="required" placeholder="비밀번호를 확인하세요." value="111111">&nbsp;&nbsp;
							<span id="pwSame"></span></td>
					</tr>

					<tr>
						<th>*이름/업체명</th>
						<td id="user_name"><input type="text" id="name" name="name"
							required="required" placeholder="이름을 입력하세요." value="test"></td>
					</tr>
					<!-- 
					<tr>
						<th>이메일</th>
						<td id="user_email"><input type="email" id="email"
							name="userEmail" required="required" placeholder="이메일을 입력하세요."></td>
					</tr>
					 -->
					<tr>
						<th>*전화번호</th>
						<td id="user_tel">
						<input type="tel1" list="member_tel" id="tel" name="tel" type="number" size="3" maxlength="3" class="input-num-size" required > -
							<datalist id="member_tel">
								<option value="010" selected></option>
								<option value="011"></option>
								<option value="직접입력"></option>
							</datalist>
						<input type="tel2" id="tel" name="tel" type="number" size="4" maxlength="4" class="input-num-size" required value="1234"> -
						<input type="tel3" id="tel" name="tel" type="number" size="4" maxlength="4" class="input-num-size" required value="5678">
						</td>
					</tr>
					<!-- 
					<tr>
						<th>생년월일</th>
						<td id="user_birth"><input type="date" id="birth"
							name="userBirth" required="required">
						</td>
					</tr>
					 -->
					<tr>
						<th>사업분류</th>
						<td>
						
						</td>
					</tr> 
					<tr>
						<th>사업자등록번호</th>
						<td id="member_buisness_num">
						<input type="text" id="buisnessNum"
							name="businessNo" required class="member_buisness_num" maxlength="12" placeholder="000-00-00000"><p>*기업회원은 사업자등록번호를 필히 기입하시기 바랍니다.*</p>
						</td>
						
					</tr>
					<tr>
						<th>우편번호</th>
						<td id="user_address">
						<input type="text" name="zip" style="width: 80px;" value="111111"/>
						<button type="button" style="width: 60px;"
								onclick="openZipSearch()">검색</button></td>
					</tr>
					<tr>
						<th>*주소</th>
						<td>
						<input type="text" id="addr1" name="address"	style="width: 300px;" readonly value="test"/>
						</td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td>
						<input type="text" id="addr2" name="addr2"	style="width: 300px;" />
						</td>
					</tr>

				</table>
			</div>

		</div>
	</form>

			<div id="btns">
				<button id="submitBtn">회원가입</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" onclick="history.back()">취소</button>
			</div>

	<script>
		function isIdCheck() {
			var str = document.getElementById('id').value;
			$.ajax({
				url : "ajaxMemberIdCheck.do",
				type : "post",
				data : {
					"str" : $("#id").val()
				},
				dataType : "text",
				success : function(result) {
					if (result == '1') {
						alert("사용가능한 아이디 입니다.");
						if (!confirm("아이디를 사용하시겠습니까?")) {
		
				        } else {
				    
							$("#checkId").attr("disabled", "disabled");
							$("#checkId").val('Yes');
							$("#password").focus();
				        }

					} else {
						alert("이미 사용중인 아이디 입니다.");
						$("#checkId").val('');
						$("#id").focus();
					}
					;
					
				}
			});
		}
		
		
		// 이메일 항목 세개를 합치는 function
		$("#email").blur(function(){
			email();
		});
		
		$("#email_address").change(function(){
			email();
		});
		
		function email() {
			const email = $("#email").val();
			const middle = $("#middle").html();
			const address = $("#email_address").val();
			if(email != "" && address != "") {
				alert(email + middle + address);
				$("#totalemail").val(email + middle + address);
			}
		};
		
		
		
		// 비밀번호 일치 확인 function
		function isSame() {
			 var passwordC = $("#password").val()
			 if (passwordC.length < 6 || passwordC.length > 16) {
		        window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
		        $("#password").val('');
		        $("#password1").val('');
		        $("#pwSame").text('');
		        $("#password").focus();	        
			 }
			 if (($("#password").val().length > 0) && ($("#password1").val().length > 0)){
				 if($("#password").val() == $("#password1").val()){
					 $("#pwSame").text('비밀번호가 일치합니다.');
					 $("#pwSame").css("color", "blue");
					 $("#checkId").val('Yes');
				 }else{
					 $("#pwSame").text('비밀번호가 불일치합니다.');
					 $("#pwSame").css("color", "red");
					 $("#checkId").val('No'); 
				 }
			 }
		}
		
		
		
		
		
		
		// 전화번호 입력시 포커스 자동이동 function
		$('.input-num-size').keyup(function (){
			var charLimit = $(this).attr("maxlength");
			//console.log(charLimit);
			if(this.value.length >= charLimit) {
				//console.log(this.value.length);
				$(this).next('.input-num-size').focus();
				return false;
			}
		});
		
		
		
		// 사업자번호 자동'-' 추가 function
		$('.member_buisness_num').on('keyup',function(){
			var num = $('.member_buisness_num').val();
			num.trim();
			this.value = AutoHypen(num);
		})
		
		
		
		
		function AutoHypen(buisnessNum){
			buisnessNum = buisnessNum.replace(/[^0-9]/g,'');
			var tempNum = '';
			
			if(buisnessNum.length < 4){
				return buisnessNum;
			}
			else if(buisnessNum.length < 6){
				tempNum += buisnessNum.substr(0,3);
				tempNum += '-';
				tempNum += buisnessNum.substr(3,2);
				return tempNum;
			}
			else if(buisnessNum.length < 11){
				tempNum += buisnessNum.substr(0,3);
				tempNum += '-';
				tempNum += buisnessNum.substr(3,2);
				tempNum += '-';
				tempNum += buisnessNum.substr(5);
				return tempNum;
			}
			else {
				tempNum += buisnessNum.substr(0,3);
				tempNum += '-';
				tempNum += buisnessNum.substr(3,2);
				tempNum += '-';
				tempNum += buisnessNum.substr(5);
				return tempNum;
			}
		}
		
		
		
		
		//
		function formCheck() {
			if ($("#checkId").val() != 'Yes') {
				alert("아이디 중복체크를 해주세요..");
				return false;
			}

			if ($("#password").val() != $("#password1").val()) {
				alert("패스워드가 일치 하지 않습니다.");
				$("#password").val("");
				$("#password1").val("");
				$("#password").focus();
				return false;
			}

			return true;
		}
		
		
		
		// 주소 검색 
		function openZipSearch() {
			new daum.Postcode({
				oncomplete : function(data) {
					$('[name=zip]').val(data.zonecode); // 우편번호 (5자리)
					//document.getElementById('addr1').val() = data.address + data.buildingName
					$('#addr1').val(data.address + ' ' + data.buildingName); 
// 					$('[name=addr1]').val(data.address) + $('[name=addr2]').val(data.buildingName);
				}
			}).open();
		}
		
		$('#submitBtn').on('click', () => {
			const addr = $('#addr1').val() + ' ' + $('#addr2').val();
			$('#addr1').val(addr);
			
			document.getElementById('frm').submit();
		})
	</script>


</body>
</html>