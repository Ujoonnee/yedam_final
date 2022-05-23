<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>

	<script src="resources/Editor/js/HuskyEZCreator.js"></script>

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
	<meta charset="UTF-8">

	<title>Insert title here</title>
</head>


<body>
	<h3>리뷰 작성</h3>
	<div> 해당서비스명 출력</div>
	<div>
		평점 <p id="star">
			<!-- 부모 -->
			<a href="#" value="1">★</a> <!-- 자식들-->
			<a href="#" value="2">★</a>
			<a href="#" value="3">★</a>
			<a href="#" value="4">★</a>
			<a href="#" value="5">★</a>
			<p>
	</div>
	<div>시설관리자에게만 보이기<input type="checkbox"></div>
	<hr>
	에디터

	
	<hr>

	<!-- 	모달 -->


	<button id="cancelRes">예약취소</button> <button id="review">리뷰작성</button>

	<button type="button" class="btn btn-block btn-primary mb-3" data-bs-toggle="modal"
		data-bs-target="#modal-default">Default</button>

	<div class="modal fade" id="modal-default" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5>리뷰</h5><br>
					<h2 class="h6 modal-title">평점</h2>
					<div>
						<p id="star">
							<!-- 부모 -->
							<a href="#" value="1">★</a> <!-- 자식들-->
							<a href="#" value="2">★</a>
							<a href="#" value="3">★</a>
							<a href="#" value="4">★</a>
							<a href="#" value="5">★</a>
							<p>
					</div>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
	
    <form id="smartEditorText" name="smartEditorText">
		<div class="jsx-2303464893 editor">
			<div class="fr-box fr-basic fr-top" role="application">
				<div class="fr-wrapper show-placeholder" dir="auto" style="overflow: scroll;">
					<input type="text" name="content" id="smartEditor" style="width: 100%; height: 412px;">
				</div>
			</div>
		</div>
		<button type="button" id="saveBtn">전송</button>
	</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary">Accept</button>
					<button type="button" class="btn btn-link text-gray ms-auto" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<script>
		$('#star a').click(function () {
			$(this).parent().children("a").removeClass("on");
			$(this).addClass("on").prevAll("a").addClass("on");
			console.log($(this).attr("value"));
		});

		$("#saveBtn").click(
			function ajax() {
				var score = $('#star a.on').last().attr("value");
				//var score = $(this).attr("value");
				console.log(score);
				var content = $("#smartEditor").val();
				console.log(content);
				$.ajax({
					url: "rev_insert.do",
					method: "POST",
					data: {
						score: score,
						content: content
					},
					success: function (data) {
						alert("성공")
					},
					error: function () {
						alert("에러")
					}
				})
			});


		//function submitContents() {
		//	oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
		//}

		/* $("#saveBtn").on("click", function(){
			$("#smartEditor").html()
		}) */
	</script>
	<!-- SmartEditor2 -->
	<script type="text/javascript" src="resources/js/notice-write.js"></script>
</body>

</html>