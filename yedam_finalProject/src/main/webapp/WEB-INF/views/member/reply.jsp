<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="${pageContext.request.contextPath}/resources/Editor/js/HuskyEZCreator.js"></script>

<head>
	<style>
		#star a {
			text-decoration: none;
			color: gray;
		}

		#star a.on {
			color: yellow;
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

			width: 1000px;
			height: 1000px;

			padding: 40px;

			text-align: center;

			background-color: rgb(255, 255, 255);
			border-radius: 10px;
			box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

			transform: translateX(-50%) translateY(-50%);
		}  
	</style>
	<meta charset="UTF-8">

	<title>Insert title here</title>
</head>

<!-- 모달 팝업 -->

	<div class="modal fade" id="modal-reply" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h6>답변작성</h6><br>
					
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
				<div id="serviceNameDiv"></div><br>
					<h2 class="h6 modal-title"></h2>
					<div>
					</div>
				    <form id="frm" name="smartEditorText" method="POST" action="/finalPrj/member/rev_insert.do"> 
						<div class="jsx-2303464893 editor"> 
							<div class="fr-box fr-basic fr-top" role="application"> 
							<div class="fr-wrapper show-placeholder" dir="auto" style="overflow: scroll;"> 
									<input type="text" name="replyConent" id="replyConent" style="width: 100%; height: 412px;"> 
									<input type="hidden" value="" name="resNoForReply" id="resNoForReply">

								</div> 
 							</div> 
						</div> 
 					</form> 
				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-secondary" id="saveBtn">답변등록</button>
					<button type="button" class="btn btn-link text-gray ms-auto" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
<script>

		$("#saveBtn").on("click", function(){
			
			//id가 smarteditor인 textarea에 에디터에서 대입       
			oEditors.getById["replyConent"].exec("UPDATE_CONTENTS_FIELD", []);                 
			
				$.ajax({
					url: "/finalPrj/review/rev_insert",
					method: "POST",
					data: 	$("#frm").serialize(),		
					success: function (re) {
						//모달창닫기
						$("#modal-default").hide();
						//리뷰작성 버튼 숨기기
						$("#btnModal").hide();
						
						alert("성공");
						location.reload(true);
						 
						
					},
					error: function () {
						alert("에러")
					}
				})
			});
		
		

	</script>
	
 					<!-- 	 SmartEditor2  -->
<script type="text/javascript" src = "${pageContext.request.contextPath}/resources/Editor/js/notice-write.js"></script>

