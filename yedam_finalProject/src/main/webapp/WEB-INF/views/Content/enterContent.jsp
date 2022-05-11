<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
#rowbutton{
	width : 30px;
	height : 25px;
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
					<thead id = "thead"></thead>
					<tbody id = "tbody"></tbody>
					
					
					
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
	
// 		주소값 입력받아 주소 + 상세주소로 나눠줌
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
		
		function createTable(days){
			var table = document.getElementById('insertRow');
//			start date -> string		
			var start = new Date(document.getElementById('service_start_time').value);
			var end = new Date(document.getElementById('service_end_time').value);
			start = getFormatDate(start);
			end = getFormatDate(end);
			console.log(start);
			console.log(end);
			/* 기존의 table row 삭제 */
			console.log(table.rows.length);
			for(let i = 0; i <= table.rows.length + 100; i++){
				table.deleteRow(-1);
			}
						var a = table.insertRow();
						var n0 = a.insertCell(0);						
						var n1 = a.insertCell(1);						
						var n2 = a.insertCell(2);						
						var n3 = a.insertCell(3);						
						n0.innerText = '날짜';
						n1.innerText = '회차';
						n2.innerText = '회차시간';
						n3.innerText = '정원';
						
						
			/* 기간만큼 table row 생성 */
			if(0 <= days){
						
				for (let y = 0 ; y < days; y++ ){
					
						var newRow = table.insertRow();
						var newCell0 = newRow.insertCell(0);
						var newCell1 = newRow.insertCell(1);
						
						newCell0.innerHTML = '<input type="date" name="asd" value = "">&nbsp;&nbsp;<input type = "button" id="rowbutton" value = "+" onclick="addRow()">&nbsp;&nbsp;<input type = "button" id ="rowbutton" value = "-"onclick="delRow()"> ';
						newCell1.innerHTML = '<table id = "newTable"></table>';
				}
			}
		}
		
		function scheduleWrite(){
			var start = new Date(document.getElementById('service_start_time').value);
			var end = new Date(document.getElementById('service_end_time').value);	
			
			var days = Math.abs(end-start) / (1000*3600*24) +1;
			console.log(days)
			createTable(days);
		}
		
		function addRow(){
			
			var table1 = document.getElementById('newTable');
			
			
			
			var newRow = table1.insertRow();
			
			const newCell0 = newRow.insertCell(0);
			const newCell1 = newRow.insertCell(1);
			const newCell2 = newRow.insertCell(2);
			
			newCell0.innerText = "fdas";
			newCell1.innerText = "fdas";
			newCell2.innerText = "fdas";
		}

		function delRow(){
			
		}
		function getFormatDate(date){
		    var year = date.getFullYear();              //yyyy
		    var month = (1 + date.getMonth());          //M
		    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
		    var day = date.getDate();                   //d
		    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
		    return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
		}
	</script>
</body>

</html>