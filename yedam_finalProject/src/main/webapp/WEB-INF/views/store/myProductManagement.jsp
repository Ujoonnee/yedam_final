<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Sheet JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<!--FileSaver savaAs 이용 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
    <!-- <script type="text/javascript" src="js/main.js"></script> -->
 <style>
	.modal { 
		position: absolute; 
		top: 0; 
		left: 0; 
		width: 100%; 
		height: 100%; 
		display: none; 
		background-color: rgba(0, 0, 0, 0.4); 
	} 
	.modal.show {
	        display: block;
	      }
	
	  .modal_body {
	    position: absolute;
	    top: 50%;
	    left: 50%;
	
	    width: 400px;
	    height: 600px;
	
	    padding: 40px;
	
	    text-align: center;
	
	    background-color: rgb(255, 255, 255);
	    border-radius: 10px;
	    box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	
	    transform: translateX(-50%) translateY(-50%);
	  }
 </style>
</head>
<body>
<c:if test="${empty ProductList }">
	<tr><td>등록된 매장이 없습니다.</td></tr>
</c:if>
<button type="button" id="excelFormDownload" class="download">양식다운</button>
<input type="file" id="id_file_upload"/>

<c:if test="${not empty ProductList }">
	<table id="tableData" >
	<thead>
		<tr>
		<th>제품번호</th>
		<th>사진</th>
		<th>제품명</th>
		<th>카테고리</th>
		<th>가격</th>
		<th>수량</th>
		<th>상태</th>
		</tr>
	</thead>
	<c:forEach items="${ProductList }" var = "list">
	<tbody>
	<c:if test="${list.soldOut ne 'D' }">
			<tr>
			<td align="center"><input type ="checkbox" id = "checkf" name="checkf" value="${list }"
				 data-name="${list.prodName }" data-price="${list.price }" data-stock="${list.stock }" data-prodnum ="${list.prodNo }" data-prodCat="${list.prodCat }" 
				 data-thumbnail="${list.prodThumbnail }" data-soldOut ="${list.soldOut }" >
				 ${list.prodNo }</td>	
			<c:if test="${empty list.prodThumbnail }">
			<td align="center"><button >이미지 업로드</button></td></c:if>	
			<td align="center">${list.prodThumbnail }</td>
			<td align="center">${list.prodName }</td>		
			<td align="center">${list.prodCat }</td>		
			<td align="center">${list.price }</td>		
			<td align="center">${list.stock }</td>		
			<td align="center">
			<c:if test="${list.soldOut eq 'N' }">판매중</c:if>
			<c:if test="${list.soldOut eq 'Y' }">품절</c:if>
			<c:if test="${list.soldOut eq 'T' }">임시품절</c:if></td>		
			</tr>
		</c:if>
	</c:forEach>
	</tbody>
	</table>
	<button type="button" id="excelDownload" class="download">재고다운로드</button>
	<!-- 	메인모달 -->
	<div class="modal"> 
		<div class="modal_body">
		<form>
			<div id="management"></div>
			<div id = "modalButton"><button class = "btn-sub-popup">결제하기</button></div>
		</form>
		</div>
	</div> 
	<button class="btn-open-popup" onclick="getCheckboxValue()">상품관리</button>
	<button id = "outOfStock" onclick = "tempOutOfStock()">임시품절</button>
	<button id = "prodDel"onclick = "Productdeletion()">상품삭제</button>
	<button id = "forSale"onclick = "ProductForSale()">판매</button>
	
<!-- 	통계확인 페이지로 storeNo값 넘김. -->
	<form id ="statisticsFrm" method = "post" action = "statisticsForm">
	<input type = "hidden" name = "storeNo" value ="${ProductList[0].storeNo }">
	<div><button type = "submit" id ="statistics" name="storeNo" onclick = "statisticsView${ProductList[0].storeNo }">통계확인</button></div>
	</form>
</c:if>

<!-- 	기본 양식 -->
	<table id="excelForm" style="display: none;">
		<tr><th>prodName</th><th>prodCat</th><th>price</th><th>stock</th><th>카테고리 종류 : 스낵류, 유제품, 커피 , 라면</th></tr>
	</table>



<script>
// 	function statisticsView(n){
// 		statisticsFrm.storeNo.value = n;
// 		alert(n);
// 		statisticsFrm.action = "statisticsForm";
// 		statisticsFrm.submit();
// 	}





	// 모달 생성
	const body = document.querySelector('body');
	const modal = document.querySelector('.modal'); 
	const btnOpenPopup = document.querySelector('.btn-open-popup'); 
	
	btnOpenPopup.addEventListener('click', () => {
	      modal.classList.toggle('show');
	
	      if (modal.classList.contains('show')) {
	        body.style.overflow = 'hidden';
	      }
	    });
	
	modal.addEventListener('click', (event) => {
	  if (event.target === modal) {
	    modal.classList.toggle('show');
	
	    if (!modal.classList.contains('show')) {
	      body.style.overflow = 'auto';
	    }
	  }
	});
	
//  체크처리한 값 모달로 가져오기
    function getCheckboxValue()  {
    	const newP = document.createElement('p');
    	
  	  // 선택된 목록 가져오기
  	  const query = 'input[name="checkf"]:checked';
  	  const selectedEls = document.querySelectorAll(query);
  	  
  	  // 선택된 목록을 모달창에 value출력
  	  let result = '';
  	  var obj_length = Object.keys(selectedEls).length;
  	  
// 		for문사용 -> var result에 체크한 값 담기
  	  for(var step = 0; step < obj_length ; step++){
  		  result += selectedEls[step].dataset.thumbnail +' '+selectedEls[step].dataset.name + ' '+selectedEls[step].dataset.prodCat +' '
  		  +selectedEls[step].dataset.price +' '+selectedEls[step].dataset.stock +"\n";
  	  }

  	  console.log(result);
  	  // 모달에 result 출력.
  	  document.getElementById('management').innerText = result;
  	  
  	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
// 엑셀시작
	const excelDownload = document.querySelector('#excelDownload');
	const excelFormDownload = document.querySelector('#excelFormDownload');
	document.addEventListener('DOMContentLoaded', ()=>{
	    excelDownload.addEventListener('click', exportExcel);
	    excelFormDownload.addEventListener('click', exportFormExcel);
	});
// 	재고다운로드
	function exportExcel(){ 
		  // step 1. workbook 생성
		  var wb = XLSX.utils.book_new();
	
		  // step 2. 시트 만들기 
		  var newWorksheet = excelHandler.getWorksheet();
	
		  // step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.  
		  XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName());
	
		  // step 4. 엑셀 파일 만들기 
		  var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});
	
		  // step 5. 엑셀 파일 내보내기 
		  saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName());
		}
	var excelHandler = {
		    getExcelFileName : function(){
		        return '재고.xlsx';	//파일명
		    },
		    getSheetName : function(){
		        return '가게 재고';	//시트명
		    },
		    getExcelData : function(){
		        return document.getElementById('tableData'); 	//TABLE id
		    },
		    getWorksheet : function(){
		        return XLSX.utils.table_to_sheet(this.getExcelData());
		    }
	}
	
// 	양식 다운로드

	var excelFormHandler = {
		    getExcelFileName : function(){
		        return '상품 등록 양식.xlsx';	//파일명
		    },
		    getSheetName : function(){
		        return '등록 양식';	//시트명
		    },
		    getExcelData : function(){
		        return document.getElementById('excelForm'); 	//TABLE id
		    },
		    getWorksheet : function(){
		        return XLSX.utils.table_to_sheet(this.getExcelData());
		    }
	}
	function exportFormExcel(){ 
		  // step 1. workbook 생성
		  var wb = XLSX.utils.book_new();
	
		  // step 2. 시트 만들기 
		  var newWorksheet = excelFormHandler.getWorksheet();
	
		  // step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.  
		  XLSX.utils.book_append_sheet(wb, newWorksheet, excelFormHandler.getSheetName());
	
		  // step 4. 엑셀 파일 만들기 
		  var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});
	
		  // step 5. 엑셀 파일 내보내기 
		  saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), excelFormHandler.getExcelFileName());
		}
	
	function s2ab(s) { 
		  var buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
		  var view = new Uint8Array(buf);  //create uint8array as viewer
		  for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
		  return buf;    
	}
	
	function upload(event){ 
		var input = event.target; 
		var reader = new FileReader(); 
		reader.onload = function(){
			var fdata = reader.result; 
			var read_buffer = XLSX.read(fdata, {type : 'binary'}); 
			read_buffer.SheetNames.forEach(function(sheetName){
				var rowdata =XLSX.utils.sheet_to_json(read_buffer.Sheets[sheetName]); 
				console.log(JSON.stringify(rowdata));
// 				엑셀 등록 처리 AJAX
				var obj = JSON.stringify(rowdata);
				console.log(typeof obj);
				insertProduct(obj);

			}) 
		};
		reader.readAsBinaryString(input.files[0]);
	}
	
	$('#id_file_upload').on('change', event => {
		console.log(event.target);
		upload(event); 
	});

	function insertProduct(obj){
		console.log("여기는 insertProduct"+obj);
		$.ajax({
	        type: "post",
	        url : "productInsert",
	        dataType: "json",
	        data : {file: obj},
	        success : function (data){
	        	console.log(data);	
	        	alert("등록성공");
	  			location.reload();
	        },
	        error : function(e){
	        	console.log(e);
	        }
	})
	}
// 	엑셀 끝

// 	input생성 frm: form 이름 . nm : 추가할 input의 name/id값 . value : input 들어갈값
	function fnAddElement(fNm, nm, value){
		var theForm = document.forms[fNm]; 
		if ( theForm.elements[name] == null){
			var input   = document.createElement('input'); 
			input.type   = 'hidden'; 
			input.name  = nm; 
			input.id  = nm; 
			input.value  = value; 
			theForm.appendChild(input); 
		}else{
			$("#" + nm).val(value);
		}
	}
		
		
// 	임시품절
	function tempOutOfStock(){
		const query = 'input[name="checkf"]:checked';
	  	const selectedEls = document.querySelectorAll(query);
	  	console.log(typeof selectedEls);
	  	console.log(selectedEls);
	  	  // 선택된 목록을 모달창에 value출력
	  	  let result = '';
	  	  var obj_length = Object.keys(selectedEls).length;
	  	  
		 let prodList = [];
	  	 for(let obj of selectedEls) {
	  		 obj.dataset.soldOut = 'T';
	  		 console.log(obj);
	  		 let prod = {
	  				 soldOut : obj.dataset.soldOut,
	  				 prodNo : obj.dataset.prodnum,
	  				 prodName : obj.dataset.name,
	  				 price: obj.dataset.price,
	  				 stock: obj.dataset.stock
	  		 };
	  		 prodList.push(prod);
	  	 }
	  	  console.log(JSON.stringify(prodList));
	  	  
	  	 $.ajax({
	  		 url: 'updateTempStock',
	  		 type : 'post',
	  		 contentType: "application/json; charset=utf-8",
	  		 data: JSON.stringify(prodList),
	  		 success: function(result){
	  			 	alert("임시품절 완료");
		  			location.reload();
	  		 },
	  		 error: function(result){
		  			console.log(result) 
	  		 }
	  	 });
	}
	
// 	상품삭제
	function Productdeletion(){
		const query = 'input[name="checkf"]:checked';
	  	const selectedEls = document.querySelectorAll(query);
	  	console.log(typeof selectedEls);
	  	console.log(selectedEls);
	  	  // 선택된 목록을 모달창에 value출력
	  	  let result = '';
	  	  var obj_length = Object.keys(selectedEls).length;
	  	  
		 let prodList = [];
	  	 for(let obj of selectedEls) {
	  		 obj.dataset.soldOut = 'D';
	  		 console.log(obj);
	  		 let prod = {
	  				 soldOut : obj.dataset.soldOut,
	  				 prodNo : obj.dataset.prodnum,
	  				 prodName : obj.dataset.name,
	  				 price: obj.dataset.price,
	  				 stock: obj.dataset.stock
	  		 };
	  		 prodList.push(prod);
	  	 }
	  	  console.log(JSON.stringify(prodList));
	  	  
	  	 $.ajax({
	  		 url: 'updateTempStock',
	  		 type : 'post',
	  		 contentType: "application/json; charset=utf-8",
	  		 data: JSON.stringify(prodList),
	  		 success: function(result){
	  			 	alert("삭제 완료");
		  			location.reload();
	  		 },
	  		 error: function(result){
		  			console.log(result) 
	  		 }
	  	 });
	}

	$(document).ready(function() {
	    $("#modal_show").click(function() {
	        $("#exampleModal").modal("show");
	    });
	
	    $("#close_modal").click(function() {
	        $("#exampleModal").modal("hide");
	    });
	});
	
	
// 	판매중변경
	function ProductForSale(){
		const query = 'input[name="checkf"]:checked';
	  	const selectedEls = document.querySelectorAll(query);
	  	console.log(typeof selectedEls);
	  	console.log(selectedEls);
	  	  // 선택된 목록을 모달창에 value출력
	  	  let result = '';
	  	  var obj_length = Object.keys(selectedEls).length;
	  	  
		 let prodList = [];
	  	 for(let obj of selectedEls) {
	  		 obj.dataset.soldOut = 'N';
	  		 console.log(obj);
	  		 let prod = {
	  				 soldOut : obj.dataset.soldOut,
	  				 prodNo : obj.dataset.prodnum,
	  				 prodName : obj.dataset.name,
	  				 price: obj.dataset.price,
	  				 stock: obj.dataset.stock
	  		 };
	  		 prodList.push(prod);
	  	 }
	  	  console.log(JSON.stringify(prodList));
	  	  
	  	 $.ajax({
	  		 url: 'updateTempStock',
	  		 type : 'post',
	  		 contentType: "application/json; charset=utf-8",
	  		 data: JSON.stringify(prodList),
	  		 success: function(result){
	  			 	alert("판매중 변경 완료");
		  			location.reload();
	  		 },
	  		 error: function(result){
		  			console.log(result) 
	  		 }
	  	 });
	}

	$(document).ready(function() {
	    $("#modal_show").click(function() {
	        $("#exampleModal").modal("show");
	    });
	
	    $("#close_modal").click(function() {
	        $("#exampleModal").modal("hide");
	    });
	});
	
	
</script>
</body>
</html>