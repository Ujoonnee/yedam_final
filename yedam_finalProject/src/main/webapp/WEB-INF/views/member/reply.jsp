<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="${pageContext.request.contextPath}/resources/Editor/js/HuskyEZCreator.js"></script>



</head>
<div>
<form id="frm" name="smartEditorText" method="POST" action="/finalPrj/member/rev_insert" > 
						<div class="jsx-2303464893 editor"> 
							<div class="fr-box fr-basic fr-top" role="application"> 
							<div class="fr-wrapper show-placeholder" dir="auto" style="overflow: scroll;"> 
									<input type="text" name="content" id="smartEditor" style="width: 100%; height: 412px;"> 
									<input type="hidden" name="score" id="score" value="">
									<input type="hidden" value="" name="resNo" id="resNoInReply">
									<input type="hidden" value="" name="category" id="category">
									<input type="hidden" value="" name="serviceName" id="serviceName">
									<input type="hidden" name="memNo" value="${user.memNo }">
								</div> 
 							</div> 
						</div> 
 					</form> 
</div>				
 					<!-- 	 SmartEditor2  -->
<script type="text/javascript" src = "${pageContext.request.contextPath}/resources/Editor/js/notice-write.js"></script>

