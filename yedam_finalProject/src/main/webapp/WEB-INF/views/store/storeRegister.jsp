<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="frm" name="frm" action="regist" method="post">
		<div>
		<h2> 매장등록신청양식</h2>
		<div id = "st_Table">
			<table style = "width : 100%;">
				<tr>
					<th>매장 구분  </th>
					<td><select id="st_cat" name="store_cat" >
						<option value="0">전체</option>
						<option value="편의점">편의점</option>
						<option value="약국">약국</option>
						<option value="기타">그 외</option>
					</select></td>
				</tr>
				<tr>
					<th>매장 이름  </th>
					<td id="store_name"><input type="text" id= "st_name" name="name"
					required = "required" placeholder="매장명을 입력하세요.">
					</td>
				</tr>
					<tr>
					<th>사업자 이름  </th>
					<td id = "member_name"><input type="text" placeholder="사업자이름세션값" >
					</td>
				</tr>
				<tr>
					<th>매장 이미지 </th>
					<td id="store_thumbnail"><input type="file" id= "st_thumbnail" name="thumbnail" style="height : 30px">
				</tr>
				<tr>
					<th>매장 전화번호  </th>
					<td id = "store_tel"><input type="text" id="st_tel" name="tel" placeholder= "매장 전화번호 입력하세요."required>
					</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td id="location_show">
					<input type="text" id="location" name="location" required = "required" 
					style="width: 100px;" readonly>
					 <input type="hidden" id= "service_address" name = "service_address" >
					 <button type="button" style="width: 60px;"
					 onclick = "locationSearch()">검색</button>
					 </td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" id="addr1"
						style="width: 300px;" readonly /></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td><input type="text" id="addr2"
						style="width: 300px;" /></td>
				</tr>
			</table>
				<input type = "hidden" id = "address" name = "address">
				<input type = "hidden" id = "latitude" name = "latitude">
				<input type = "hidden" id = "longitude" name = "longitude">
				<div id=btns><button type="submit" value="등록">등록하기</button>
		<button type= "button" onclick="history.back()">뒤로가기</button>
		</div>
		</div>
	
		</div>
	</form>
	<script>
	function locationSearch() {
		new daum.Postcode({
			oncomplete : function(data) {
				console.log(data);					
				var addValue = data.address + ' ' + data.buildingName;
				document.getElementById('location').value = data.zonecode;
				document.getElementById('addr1').value = addValue;
				xyget(addValue);
			}
		}).open();
	}
	function xyget(addValue){
		console.log(addValue);
		$.ajax({
			url:"https://dapi.kakao.com/v2/local/search/address.json?query="+encodeURIComponent(addValue),
			type : "GET",
			headers: {'Authorization' : 'KakaoAK ee381ad2653c27997305ec26eef7c94b'},
		success:function(data){
			console.log(data)
			console.log(data.documents[0].x)
			document.getElementById('latitude').value = data.documents[0].y;
		    document.getElementById('longitude').value = data.documents[0].x;
		},
		error : function(e){
			console.log(e);
		}

		});
		
	};
	
	/* 카카오 토큰 발급 ajax형식 function  삭제 X 추후에 쓰일수잇음.*/
	function token(){
		$.ajax({
			type : "GET",
			url:"https://kauth.kakao.com/oauth/token",
			headers : {
				"Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
			},
			data : {
				grant_type:"authorization_code",
				client_id:"ee381ad2653c27997305ec26eef7c94b",
				redirect_uri:"http://localhost.com",
				code:"SrnvwOMAnd2mhKCSHbpHJMDIk2GAqXooKr2KKKCxEAU51tRM9XtCNzztnRRg2q_J3QoAGQopb9UAAAGAtin1OA"
			},
			success : function(a){
				console.log(a)
			},
			error : function(e){
				console.log(e);
			}
		})
		
	}
	$(function(){
		$('#frm').on('submit',function(){
			
			var address_val = '';
			address_val += $("#addr1").val() + ' ';
			address_val += $("#addr2").val();
			document.getElementById('address').value = address_val;
			
			
			 if(!$('#location').val()){
				   alert('주소를 입력해주세요');
				   return false;
				 }
	})
	});
	</script>
</body>
</html>