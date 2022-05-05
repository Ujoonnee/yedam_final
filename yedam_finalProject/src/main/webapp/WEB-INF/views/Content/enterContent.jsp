<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
#enter{
	padding: 200px 0;
	align : center;
}
#enter> h1{
	margin-bottom: 50px;
	align : left;
}
#btns{
	margin-top: 50px;
}
th {
	width: 200px;
	padding-left: 80px;
	font-size: 1.2em;
}

td {
	padding-bottom: 10px;
	width: 430px;
}
input{
	height: 40px;
	width: 250px;
}
button{
	height: 40px;
}
</style>
</head>
<body>
	<form id="frm" name="frm" action="enterContent.do" method="post">
		<div>
		<h2> 서비스 등록 신청</h2>
		<div id = "en_Table">
			<table style = "width : 100%;">
				<tr>
					<th>카테고리</th>
					<td><select id="category" name="service_type" >
						<option value="1">공연/전시</option>
						<option value="2">시설대여</option>
					</select></td>
				</tr>
				<tr>
					<th>서비스명</th>
					<td id="serName"><input type="text" id= "service_name" name="service_name"
					required = "required" placeholder="공연 제목을 입력하셈.">
					</td>
				</tr>
					<tr>
					<th>썸네일</th>
					<td id="serThumbnail"><input type="file" id= "service_thumbnail" name="service_thumbnail" style="height : 30px">
					</td>
				</tr>
				<tr>
					<th>장소명</th>
					<td id="serLocation"><input type="text" id= "service_location" name="service_location"
					required = "required" placeholder="장소명 입력하셈.">
					</td>
				</tr>
				<tr>
					<th>기간</th>
					<td><input type="date" id="service_start_time" name="service_start_time" required="required">&nbsp;~&nbsp;
					<input type="date" id="service_end_time" name="service_end_time" required="required">
					<button type="button" id="tableInsert"  style="width:80px; " onclick = "scheduleWrite()" >출력</button>
					</td>
				</tr>
				<tr>
					<th>회차정보</th>
					<td> <table id = "insertRow">
						<tr>
							<td>날짜</td><td>회차</td><td>회차 시간</td><td>정원</td>
						</tr>
		
					
					
					
					</table></td>
				</tr>
				<tr>
					<th>설명</th>
					<td><textarea name="service_description" rows=15 cols=50 style="text-align=center;"></textarea></td>
				</tr>
				<tr>
					<th>정원</th>
					<td><input type="text" id= "service_capacity" name="service_capacity"
					required = "required" placeholder="정원명 입력하셈.">
					</td>
				</tr>
		<!-- 설명, 썸네일, 전화번호, 정원 상태, -->
				<tr>
					<th>전화번호</th>
					<td id="tel"><input type="tel" id="service_tel" name="service_tel"
						required="required" placeholder="전화번호를 입력하세요."></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td id="location_show"><input type="text" id="location" name="location"
					 style="width: 100px;"><input type="hidden" id= "service_address" name = "service_address">
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
					document.getElementById('service_address').value = data.address +' '+data.buildingName ;
					document.getElementById('location').value = data.zonecode;
					document.getElementById('addr1').value = data.address;
					document.getElementById('addr2').value = data.buildingName;
				}
			}).open();
		}
		
		function tablecreate(days){
			var table = document.getElementById('insertRow');
			
			const input = document.querySelector('input');
			const log = document.getElementById('value');
			var y = 0;
			/* 기존의 table row 삭제 */
			for(let i = 0; i <= 365; i++){
				table.deleteRow(-1);
			}
			/* 기간만큼 table row 생성 */
			if(y < days){
				while(y < days){
					if(y === days)break;
					
						var newRow = table.insertRow();		
						var newCell0 = newRow.insertCell(0);
						var newCell1 = newRow.insertCell(1);
						var newCell2 = newRow.insertCell(2);
						var newCell3 = newRow.insertCell(2);
						newCell0.innerHTML = '<input type="date" name="asd" value="${days}">';
						newCell1.innerText = '과ㄹ';
						newCell2.innerText = '과2';
						newCell3.innerText = '과3';
					y++;
				}
			}
			
			
			
		}
		
		function scheduleWrite(){
			var start = new Date(document.getElementById('service_start_time').value);
			var end = new Date(document.getElementById('service_end_time').value);		
			var days = Math.abs(end-start) / (1000*3600*24) +1;
			console.log(days)
			tablecreate(days);
			
		}
		


	</script>
</body>

</html>