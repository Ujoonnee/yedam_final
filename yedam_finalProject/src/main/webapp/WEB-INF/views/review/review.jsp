<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.js"></script> -->

<script src="resources/Editor/js/HuskyEZCreator.js"></script>


<link rel="stylesheet" href="resources/css/notice_write.css">
<style>
  #star a{
   text-decoration: none;
   color: gray;
  }
  #star a.on{
   color: yellow;
  } 
</style>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>


<body>
<h3>리뷰 작성</h3>
<div> 해당서비스명 출력</div>
<div>
평점 <p id="star"> <!-- 부모 -->
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

	<div class="jsx-2303464893 editor">
		<div class="fr-box fr-basic fr-top" role="application">
			<div class="fr-wrapper show-placeholder" dir="auto"
				style="overflow: scroll;">
				<textarea name="notice_content" id="smartEditor"
					style="width: 100%; height: 412px;"></textarea>
			</div>
		</div>
	</div>
<hr>

<script>
$('#star a').click(function(){ 
	 $(this).parent().children("a").removeClass("on");    
	 $(this).addClass("on").prevAll("a").addClass("on");
	 console.log($(this).attr("value"));
});
</script>
<!-- SmartEditor2 --> 
<script type="text/javascript" src = "resources/js/notice-write.js"></script>
</body>

</html>

