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
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha206-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<!--FileSaver savaAs 이용 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>

    <!-- <script type="text/javascript" src="js/main.js"></script> -->
 <style>
	 #popup_mask { /* 팝업 배경 css */
		        position: fixed;
		        width: 100%;
		        height: 1000px;
		        top: 0px;
		        left: 0px;
		         display: none; 
		         background-color:#000;
		         opacity: 0.8;
		    }
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
	
	    width: 600px;
	    height: 800px;
	
	    padding: 40px;
	
	    text-align: center;
	
	    background-color: rgb(205, 205, 205);
	    border-radius: 10px;
	    box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	
	    transform: translateX(-50%) translateY(-50%);
	  }
 </style>
</head>
<body >

<c:if test="${ProductList eq null }">
	<h3 align="center">등록된 매장이 없습니다.</h3>

</c:if>

<c:if test="${ProductList ne null }">
	<c:if test="${empty ProductList }">
	
		<div align="center">등록된 상품이 없습니다.</div>
		<div><br>
			<button type="button" id="excelFormDownload" class="btn btn-sm btn-primary col-1 download">양식다운</button>
		    <label class="btn btn-primary btn-file col-1" style="height: 35px;">
		        재고등록<input type="file" id="id_file_upload" style="display: none;">
		    </label>
	    </div>
	</c:if>

<div align="center">
	<div class="row justify-content-center" style="width: 80%;">
		<div class="col-12">
			<c:if test="${not empty ProductList }">


				<h3 align="left">상품 등록</h3>
				<div class="card border-0 shadow mb-4">
					<div class="card-body">
						<div class="table-responsive">
							<table id="tableData"
								class="table table-centered table-nowrap mb-0 rounded">
								<thead class="thead-light">
									<tr class="border-0 rounded-start">
										<th class="border-0 rounded-start display-3 col-1"></th>
										<th class="border-0 col-1" >제품번호</th>
										<th class="border-0 col-2">사진</th>
										<th class="border-0">제품명</th>
										<th class="border-0">카테고리</th>
										<th class="border-0">가격</th>
										<th class="border-0">수량</th>
										<th class="border-0 rounded-end">상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${ProductList }" var="list">
										<c:if test="${list.status ne '00603' }">
											<tr>
												<td valign="middle"><input type="checkbox"
													id="checkf" name="checkf" value="${list }"
													data-prodName="${list.prodName }"
													data-price="${list.price }" data-stock="${list.stock }"
													data-prodNo="${list.prodNo }"
													data-thumbnail="${list.prodThumbnail }"
													data-prodCat="${list.prodCat }"
													data-status="${list.status }"></td>
												<td valign="middle">${list.prodNo }</td>
												<c:if test="${list.prodThumbnail != null}">
													<td valign="middle"><img
														src="/img/${list.prodThumbnail } " class="selected_img"
														height="150px" width="150px"> <input type="hidden"
														class="prodThumbnail" value="${list.prodThumbnail }">
														<input type="hidden" class="prodNo_img"
														value="${list.prodNo }"></td>
												</c:if>
												<c:if test="${list.prodThumbnail == null }">
													<td valign="middle">
														<div class="imageValue">
															<input type="file" class="thumbnail_file_upload"
																name="fileUpload" value="사진등록"> <input
																type="hidden" class="prodNo" value="${list.prodNo }">
														</div>
													</td>
												</c:if>
												<td valign="middle">${list.prodName }</td>
												<td valign="middle">${list.prodCat }</td>
												<td valign="middle">${list.price }</td>
												<td valign="middle">${list.stock }</td>
												<td valign="middle">${list.statusName }</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</c:if>
			<br>
			
			<c:if test ="${empty ProductList }">
				<div align="left">
					<div style="float: left; padding:3px;">
						<button type="button" id="excelDownload"
							class="btn btn-sm btn-primary  download" disabled="disabled" style="background-color: 	#F2F2F2; color:	#F2F2F2; ; border: none;">재고다운로드</button>
						<button class="btn-open-popup btn btn-sm btn-primary "
							onclick="getCheckboxValue()" disabled="disabled"  style="background-color: 	#F2F2F2; color:	#F2F2F2; ; border: none;">상품관리</button>
						<button id="showButton" class="btn btn-sm btn-primary "
							onclick="addTextBox()" disabled="disabled"  style="background-color: 	#F2F2F2; color:	#F2F2F2; ; border: none;">단일상품등록</button>
					</div>
				<!-- 	통계확인 페이지로 storeNo값 넘김. -->
					<div style="float: left; padding:3px;">
						<form id="statisticsFrm" method="post" action="statisticsForm">
							<input type="hidden" name="storeNo"
								value="${ProductList[0].storeNo }">
							<button type="submit" id="statistics" name="storeNo" disabled="disabled"
								class="btn btn-sm btn-primary "  style="background-color: 	#F2F2F2; color:	#F2F2F2; ; border: none;"
								onclick="statisticsView${ProductList[0].storeNo }">통계확인</button>
						</form>
					</div>
				</div>
			</c:if>
			
			
			<c:if test ="${not empty ProductList }">
			
				<div><br>
					<button type="button" id="excelFormDownload" class="btn btn-sm btn-primary col-1 download"disabled="disabled" style="background-color: 	#F2F2F2; color:	#F2F2F2; ; border: none;">양식다운</button>
			    </div>
				<div align="left">
					<div style="float: left; padding:3px;">
						<button type="button" id="excelDownload"
							class="btn btn-sm btn-primary  download">재고다운로드</button>
						<button class="btn-open-popup btn btn-sm btn-primary "
							onclick="getCheckboxValue()">상품관리</button>
						<button id="showButton" class="btn btn-sm btn-primary "
							onclick="addTextBox()">단일상품등록</button>
					</div>
				<!-- 	통계확인 페이지로 storeNo값 넘김. -->
					<div style="float: left; padding:3px;">
						<form id="statisticsFrm" method="post" action="statisticsForm">
							<input type="hidden" name="storeNo"
								value="${ProductList[0].storeNo }">
							<button type="submit" id="statistics" name="storeNo"
								class="btn btn-sm btn-primary "
								onclick="statisticsView${ProductList[0].storeNo }">통계확인</button>
						</form>
					</div>
				</div>
			</c:if>
		</div>

		<!-- 	메인모달 -->
	<div id ="popup_mask" ></div> <!-- 팝업 배경 DIV -->
	<div id = "modal" class="modal"> 
		<div id = "modal_body" class="modal_body">
<!-- 		<form method = "post" action = "updateStock" id = "frm"> -->
			<div id="management">
				<table style ="margin: auto;">
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
			<div id = "modalButton"><button class = "btn-sub-popup btn-sm btn-primary" onclick="productUpdate()">상품수정</button></div>
<!-- 		</form> -->
		</div>
	</div> 

<!-- 	; this.onclick=null; -->
<br>
	<form id = "productRegist" name="productRegist">
        <div id="box"></div><input type="button" id ="submitOne" style="visibility: hidden; float:left;" class="btn-sm btn-primary" value="전송">
	</form>        
	</div>
</div>

	<input type="hidden" id ="prodNo" value="${ProductList[0].prodNo }" > 



<!-- 	기본 양식 -->
	<table id="excelForm" style="display: none;">
		<tr><th>prodName</th><th>prodCat</th><th>price</th><th>stock</th><th>카테고리 종류 : 스낵류, 유제품, 커피 , 라면</th></tr>
	</table>   

</c:if>


<script>


		$('.thumbnail_file_upload').on('change', event => {
			if(!confirm("사진을 등록하시겠습니까?")){
				alert("취소되었습니다.")
				
			}else{
				var form = new FormData();
				var parentTarget = event.target.parentElement.children[1].value;
				
				console.log(parentTarget);
// 				console.log(parentTarget.children('.prodNo'));
				
				
				  form.append( "prodThumbnail", event.target.files[0] );
				  form.append("prodNo", parentTarget);
					console.log(form);
				  jQuery.ajax({
		             url : "thumbnailUpdate"
		           , type : "POST"
		           , processData : false
		           , contentType : false
		           , data : form
		           , success:function(response) {
		               alert("성공하였습니다.");
		               location.reload();
		               
		           }
		           ,error: function (jqXHR) { 
		        	   
		        	   alert("에러 발생.  다시 시도해주세요.       " );
		           }
			
				});
			}
			
		})
		
		$(".selected_img").on('click',function(){
			if(!confirm("등록된 사진을 삭제하시겠습니까?")){
				alert("사진삭제가 취소되었습니다.")
			}else{
				var form = new FormData();
				var thumbnailValue = event.target.parentElement.children[1].value;
				var prodNoValue = event.target.parentElement.children[2].value;
				console.log(thumbnailValue)
				console.log(prodNoValue)
				form.append("prodThumbnail",thumbnailValue );
				form.append("prodNo",prodNoValue);
				console.log(form);
				jQuery.ajax({
				        url: "thumbnailDelete", 
				        type: "POST", 
				        processData : false,
				        contentType : false,
				        data: form, // 전송 데이터
				        success: function(res){ // 성공 시 실행
				            alert("삭제성공");
				            location.reload();
				        },
				        error:function(err){ //실패 시 실행
				            alert("일시적 에러. 다시 시도해주세요. " +err);
				        }
				 });
			}
				
		})
		
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
		    newP.innerHTML = "<select name = 'prodCat' class='form-select' style='width :13%; float:left;' ><option value = '전체'>전체</option><option value = '라면'>라면</option><option value = '커피'>커피</option><option value = '스낵류'>스낵류</option><option value = '유제품'>유제품</option></select><input type ='text' name='prodName' class = 'form-control' style='width :17%; float:left;'  placeholder='상품명을 입력하세요.'><input type ='text' name='price' class='form-control' style='width :17%; float:left;'  placeholder='가격을 입력하세요.'><input type ='number' name='stock' class='form-control' style='width :17%; float:left;' placeholder='수량을 입력하세요.'><input type='button' style='float:left;' class='btn-sm btn-primary' value='취소' onclick='remove(this)'>";
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
		
		const query = 'input[name="checkf"]:checked';
  	    const selectedEls = document.querySelectorAll(query);
	  	  if(selectedEls.length == 0){
		  		return; //체크된 값이 없을 시 모달창 띄우지않게함
		  	}
		
			modal.classList.toggle('show');
			$("#modal").css({
			   "top": (($(window).height()-$("#modal").outerHeight())/2+$(window).scrollTop())+"px",
			   "left": (($(window).width()-$("#modal").outerWidth())/2+$(window).scrollLeft())+"px"
			   //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
			
			}); 
	      
			$("#popup_mask").css("display","block"); //팝업 뒷배경 display block
	        $("#modal").css("display","block"); //팝업창 display block

	        $("body").css("overflow","hidden");//body 스크롤바 없애기
	      
	      if (modal.classList.contains('show')) {
	        body.style.overflow = 'hidden';
	      }
	    });
	
	modal.addEventListener('click', (event) => {
	  if (event.target === modal) {
	    modal.classList.toggle('show');
	    $("#popup_mask").css("display","none"); //팝업창 뒷배경 display none
        $("#modal").css("display","none"); //팝업창 display none
        $("body").css("overflow","auto");//body 스크롤바 생성
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
  	    
  	    
  	  	if(selectedEls.length == 0){
  	  		alert("체크된 값이 없습니다.")//체크된값이 없을시 function 종료
  	  		return;
  	  	}
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
			
// 			<img src="/img/${list.prodThumbnail } "
// 			height="150px" width="150px">

			const imgVal = '/img/'+obj.사진
			const img = $('<img>').attr('src', imgVal).attr('height','50px').attr('width','50px');
// 			tr.append($('<td>').html(obj.사진))
			tr.append($('<td>').append(img));
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
		
  	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
// 엑셀시작
	const excelDownload = document.querySelector('#excelDownload');
	const excelFormDownload = document.querySelector('#excelFormDownload');
	document.addEventListener('DOMContentLoaded', ()=>{
	    excelFormDownload.addEventListener('click', exportFormExcel);
	    
	    excelDownload.addEventListener('click', exportExcel);
	    
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