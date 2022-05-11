<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
						<option value="1">편의점</option>
						<option value="2">약국</option>
						<option value="3">그 외</option>
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
					<td id="location_show"><input type="text" id="location" name="location" required = "required"
					 style="width: 100px;"><input type="hidden" id= "service_address" name = "service_address" >
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
				document.getElementById('address').value = data.address +' '+data.buildingName ;
// 				document.getElementById('latitude').value =  ;
// 				document.getElementById('longitude').value =  ;
				document.getElementById('location').value = data.zonecode;
				document.getElementById('addr1').value = data.address;
				document.getElementById('addr2').value = data.buildingName;
			}
		}).open();
	}
	</script>
</body>
</html>