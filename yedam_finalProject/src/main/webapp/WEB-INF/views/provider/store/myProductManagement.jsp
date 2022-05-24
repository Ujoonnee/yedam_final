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
  .btn-file{
            position: relative;
            overflow: hidden;
        }
        .btn-file input[type=file] {
            position: absolute;
            top: 0;
                right: 0;
            min-width: 100%;
            min-height: 100%;
            font-size: 100px;
            text-align: right;
            filter: alpha(opacity=0);
            opacity: 0;
            outline: none;
            background: white;
            cursor: inherit;
            display: block;
        }

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
<button type="button" id="excelFormDownload" class="download">양식다운</button>
    <label class="btn btn-primary btn-file">
        재고변경<input type="file" id="id_file_upload" style="display: none;">
    </label>
	<tr><td>등록된 매장이 없습니다.</td></tr>
</c:if>

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
	<c:if test="${list.status ne '00603' }">
			<tr>
			<td align="center"><input type ="checkbox" id = "checkf" name="checkf" value="${list }"
				 data-prodName="${list.prodName }" data-price="${list.price }" data-stock="${list.stock }" data-prodNo ="${list.prodNo }"
				 data-thumbnail="${list.prodThumbnail }"  data-prodCat="${list.prodCat }" data-status ="${list.status }"
				 >
				 ${list.prodNo }</td>	
			<c:if test="${list.prodThumbnail eq null } ">	
			<td align="center"><button >사진등록</button></td>
			</c:if>	
			<td align="center">${list.prodThumbnail }</td>
			<td align="center">${list.prodName }</td>		
			<td align="center">${list.prodCat }</td>		
			<td align="center">${list.price }</td>		
			<td align="center"> ${list.stock }</td>		
			<td align="center">
			<c:if test="${list.status eq '00601' }">판매중</c:if>
			<c:if test="${list.status eq '00602' }">품절</c:if>
			<c:if test="${list.status eq '00603' }">삭제</c:if></td>		
			</tr>
		</c:if>
	</c:forEach>
	</tbody>
	</table>
</c:if>
	<button type="button" id="excelDownload" class="download">재고다운로드</button>
	<!-- 	메인모달 -->
	<div class="modal"> 
		<div class="modal_body">
<!-- 		<form method = "post" action = "updateStock" id = "frm"> -->
			<div id="management">
				<table>
					<thead>
						<tr>
							<th>사진</th>
							<th>카테고리</th>
							<th>가격</th>
							<th>상품명</th>
							<th>상태</th>
							<th>수량</th>
						</tr>
					</thead>
					<tbody id="tbody"></tbody>
				</table>
			</div>
			<div id = "modalButton"><button class = "btn-sub-popup" onclick="productUpdate()">버튼임둥</button></div>
<!-- 		</form> -->
		</div>
	</div> 
	<button class="btn-open-popup" onclick="getCheckboxValue()">상품관리</button>
	<button id = "showButton" onclick = "addTextBox()">단일상품등록</button>
<!-- 	; this.onclick=null; -->
	<form id = "productRegist" name="productRegist">
        <div id="box">
        </div>
        <input type="button" id ="submitOne" style="visibility: hidden;" value="전송">
	</form>        
	

	<input type="hidden" id ="prodNo" value="${ProductList[0].prodNo }" > 
<!-- 	통계확인 페이지로 storeNo값 넘김. -->
	<form id ="statisticsFrm" method = "post" action = "statisticsForm">
	
	<input type = "hidden" name = "storeNo" value ="${ProductList[0].storeNo }">
	
	<div><button type = "submit" id ="statistics" name="storeNo" onclick = "statisticsView${ProductList[0].storeNo }">통계확인</button></div>
	</form>


<!-- 	기본 양식 -->
	<table id="excelForm" style="display: none;">
		<tr><th>prodName</th><th>prodCat</th><th>price</th><th>stock</th><th>카테고리 종류 : 스낵류, 유제품, 커피 , 라면</th></tr>
	</table>   


<script>
		$("#submitOne").on('click',function(){ // 제출 버튼 이벤트 지정
		    $.ajax({
		        url: "singleProductRegist", 
		        type: "POST", 
		        data: $("#productRegist").serialize(), // 전송 데이터
		        dataType: 'text', // 전송 데이터 형식
		        success: function(res){ // 성공 시 실행
		            alert("입력성공");
		            location.reload();
		        },
		        error:function(err){ //실패 시 실행
		            alert("실패 원인 : " + err);
		        }
		    });
		});
		function check(){
			var f = document.productRegist;
			if(f.prodName.value ==""){
				alert("상품명을 입력하세요.");
				f.prodName.focus();
				
				return false;
			}
			if(f.price.value ==""){
				alert("가격을 입력하세요.");
				f.price.focus();
				
				return false;
			}
			if(f.stock.value ==""){
				alert("수량을 입력하세요.");
				f.stock.focus();
				return false;
			}
		}
	
		function addTextBox(){
			$('#showButton:button').attr("disabled", true);
			document.getElementById("submitOne").style.visibility = "visible";
			
		    const box = document.getElementById("box");
		    const newP = document.createElement('p');
		    newP.innerHTML = "<input type ='text' name='prodName' placeholder='상품명을 입력하세요.'><select name = 'prodCat'><option value = '전체'>전체</option><option value = '라면'>라면</option><option value = '커피'>커피</option><option value = '스낵류'>스낵류</option><option value = '유제품'>유제품</option></select><input type ='text' name='price'  placeholder='가격을 입력하세요.'><input type ='number' name='stock'  placeholder='수량을 입력하세요.'> <input type='button' value='취소' onclick='remove(this)'>";
		    box.appendChild(newP);
		}
		
		function remove(obj){
			$('#showButton:button').attr("disabled", false);
		    document.getElementById('box').removeChild(obj.parentNode);
			document.getElementById("submitOne").style.visibility = "hidden";
		}
//   재고 변경
	function productUpdate(){
		// 선택된 목록 가져오기
  	    var list = [];
  	    const trVal = $("tr[name='checkVal']")
  	    var prodNo = document.getElementById('prodNo'); 
	  	for(var i =0; i< trVal.length ; i++){
	  		
	  		var status = trVal.eq(i).find("select[name='selectValue']").val();
	  		var stock = trVal.eq(i).find("input[name='checkValName']").val();
	  		var prodNo = trVal.eq(i).find("input[name='checkValProdNo']").val();
	  		list.push({status,stock,prodNo})
	  	}
	  	
	  	$.ajax({
	  		 url: 'updateTempStock',
	  		 type : 'post',
	  		 contentType: "application/json; charset=utf-8",
	  		 data: JSON.stringify(list),
	  		 success: function(result){
	  			 	alert("상품수정 완료");
		  			location.reload();
	  		 },
	  		 error: function(result){
		  			console.log(result) 
	  		 }
	  	 });
	}


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
		
  	  // 선택된 목록 가져오기
		const query = 'input[name="checkf"]:checked';
  	    const selectedEls = document.querySelectorAll(query);
  	  
  	  // 선택된 목록을 모달창에 value출력
  	    let result = '';
  	    var obj_length = Object.keys(selectedEls).length;
  	    var checkList = [];
  		var inputNo = document.createElement('input');
  		var inputStock = document.createElement('input');
//   	    오브젝트 생성
// 		for문사용 -> var result에 체크한 값 담기

		for(let obj of selectedEls){
			
			let checkValue ={
				사진 : obj.dataset.thumbnail,
				상품번호 :  obj.dataset.prodno,
				카테고리 : obj.dataset.prodcat,
				상품명 : obj.dataset.prodname,
				가격 : obj.dataset.price,
				재고 : obj.dataset.stock,
				상태 : obj.dataset.status
			};
			checkList.push(checkValue);
			
		};

		$('#tbody').html('');
		
		for(let obj of checkList) {
			
			const tr = $('<tr>').attr('name','checkVal');
			tr.append($('<td>').html(obj.사진))
			tr.append($('<td>').html(obj.카테고리))
			tr.append($('<td>').html(obj.가격))
			tr.append($('<td>').html(obj.상품명))
				
// 			select 생성
			const select = $('<select>').attr('name','selectValue');
			
			const 판매중 = $('<option>').attr('value','00601').html('판매중').appendTo(select);
			const 일시품절 = $('<option>').attr('value','00602').html('일시품절').appendTo(select);
			const 삭제 = $('<option>').attr('value','00603').html('삭제').appendTo(select);
			
			switch(obj.상태) {
				case '00601':
					판매중.attr('selected','selected');
					break;
				case '00602':
					일시품절.attr('selected','selected');
					break;
				case '00603':
					삭제.attr('selected','selected');
					break;
			}

			tr.append($('<td>').html(select));
			
			const stock = $('<input>').attr('value',obj.재고).attr('name','checkValName').attr('style','width:50px;')
			const prod = $('<input>').attr('value',obj.상품번호).attr('type','hidden').attr('name','checkValProdNo').attr('style','width:50px;')
			tr.append($('<td>').append(stock));
			tr.append($('<td>').append(prod));
			
			$('#tbody').append(tr);
		}
// 			tr.append($('<td>'). )
// 		const stock2 = $('<select>').attr('option','option');
  	  
		
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
// 				엑셀 등록 처리 AJAX
				var obj = JSON.stringify(rowdata);
				insertProduct(obj);

			}) 
		};
		reader.readAsBinaryString(input.files[0]);
	}
	
	$('#id_file_upload').on('change', event => {
		if(!confirm("확인을 누를시 기존의 재고는 삭제되고 작성한 데이터가 반영됩니다. 하시겠습니까?")){
			alert("취소되었습니다.")
		}else{
			console.log(event.target);
			upload(event); 
		}
				
	});

	function insertProduct(obj){
		$.ajax({
	        type: "post",
	        url : "productInsert",
	        dataType: "json",
	        data : {file: obj},
	        success : function (data){
	  			location.reload();
	        	console.log(data);	
	        	alert("등록성공");
	        },
	        error : function(e){
	  			location.reload();
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
		
		

	
</script>
</body>
</html>