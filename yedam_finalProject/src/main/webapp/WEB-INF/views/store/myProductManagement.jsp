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
<!--FileSaver savaAs 이용 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
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
			<tr>
			<td align="center">${list.prodNo }</td>		
			<td align="center">${list.prodThumbnail }</td>		
			<td align="center">${list.prodName }</td>		
			<td align="center">${list.prodCat }</td>		
			<td align="center">${list.price }</td>		
			<td align="center">${list.stock }</td>		
			<td align="center">${list.soldOut }</td>		
			</tr>
		</c:forEach>
	</tbody>
	</table>
	<button type="button" id="excelDownload" class="download">재고다운로드</button>
</c:if>
<!-- 	기본 양식 -->
	<table id="excelForm" style="display: none;">
		<tr><th>prod_name</th><th>prod_cat</th><th>price</th><th>stock</th><th>카테고리 종류 : 스낵류, 유제품, 커피 , 라면</th></tr>
	</table>

<script>
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
	        	console.log('성공');
	        	alert("ㅇ")
	        	
	        },
	        error : function(e){
	        	console.log(e);
	        }
	})
	}
	
</script>
</body>
</html>