<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${approvalStatus == 00401}">
`			<script>
				alert("매장관리페이지로 이동합니다.")
				location.href="http://localhost/finalPrj/store/product/management";
			</script>
		</c:when>
		<c:when test="${approvalStatus == 00402}">
`			<script>
				alert("매장신청이 반려되었습니다. ")
				history.back()
			</script>
		</c:when>
		<c:when test="${approvalStatus == 00403}">
`			<script>
				alert("매장이 심사중에 있습니다. 조금만 기다려주십시오.")
				history.back()
			</script>
		</c:when>
		<c:otherwise>
			<form id="frm" name="frm" action="regist" method="post" enctype="multipart/form-data">
			<div>
			<h2> 매장등록신청양식</h2>
				<div id = "st_Table">
				
					<table  class="form-control" >
						<colgroup>
							<col width="30%">
							<col width="50%">
							<col width="10%">
						</colgroup>
						
						<tr>
							<th>매장 구분  </th>
							<td><select id="st_cat" name="storeCat" class="form-select" style="width:200px" >
								<option value="편의점">편의점</option>
								<option value="약국">약국</option>
								<option value="기타">그 외</option>
							</select></td>
						</tr>
						<tr>
							<th>매장 이름  </th>
							<td id="store_name"><input class="form-control mb-3 mt-3" type="text" id= "st_name" name="name" style="width:200px"
							required = "required" placeholder="매장명을 입력하세요.">
							</td>
						</tr>
							<tr>
							<th>사업자 이름  </th>
							<td id = "member_name"><input type="text"class="form-control mb-3 mt-3" style="width:200px" placeholder="${user.name }" >
							</td>
						</tr>
						<tr>
							<th>매장 이미지 </th>
							<td id="store_thumbnail"><input type="file" class="form-control mb-3 mt-3" id= "st_thumbnail" name="fileUpload" style=" width : 250px;">
						</tr>
						<tr>
							<th>매장 전화번호  </th>
							<td id = "store_tel"><input type="text" id="st_tel" class="form-control mb-3 mt-3" name="tel" style="width:200px" placeholder= "${user.tel }"required>
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<div class="row mt-4">
									<input class="form-control col-6 me-3 ms-3" style="width:203px" id="location" name="location" value="우편번호" readonly>
									<button type="button" class="col-4 btn btn-outline-gray-700" id="postCodeBtn" onclick="locationSearch()">우편번호 검색</button>
								</div> 
								<input class="form-control mt-2 mt-2" id="addr1" readonly required value="도로명주소">
								<input class="form-control mt-2 mb-4" id="addr2" placeholder="상세주소 입력">
								
							</td>
						</tr>
					</table>
						<input type = "hidden" id = "address" name = "address">
						<input type = "hidden" id = "latitude" name = "latitude">
						<input type = "hidden" id = "longitude" name = "longitude">
					<div class="mt-4">
						<button type="submit" class="btn btn-sm btn-primary" value="등록">등록하기</button>
						<button type="button" class="btn btn-sm btn-primary" onclick="history.back()">뒤로가기</button>
					</div>
				</div>
			</div>
			</form>
		</c:otherwise>
	</c:choose>
	
	
	
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