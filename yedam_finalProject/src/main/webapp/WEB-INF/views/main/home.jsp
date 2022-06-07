<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- <div id="search" > -->
	
<!-- 	<div style="background-image: url('resources/img/home_bg.png'); height: 624px;"></div> -->
	
<!-- 	<h3>검색</h3> -->
	
<!-- 	<div> -->
<!-- 			<div>map</div> -->
		
<!-- 			<div id="requirements"> -->
<!-- 				<div> -->
<!-- 					지역 :  -->
<!-- 					<select> -->
<!-- 						<option value="서울특별시">서울특별시</option> -->
<!-- 						<option value="부산광역시">부산광역시</option> -->
<!-- 						<option value="대구광역시">대구광역시</option> -->
<!-- 						<option value="인천광역시">인천광역시</option> -->
<!-- 						<option value="광주광역시">광주광역시</option> -->
<!-- 						<option value="대전광역시">대전광역시</option> -->
<!-- 						<option value="울산광역시">울산광역시</option> -->
<!-- 						<option value="제주특별시">제주특별시</option> -->
<!-- 					</select> -->
<!-- 				</div> -->
<!-- 				<div> -->
<!-- 					카테고리 : -->
<!-- 					<select id="category"> -->
<!-- 						<option value="">선택</option> -->
<!-- 						<option value="00201">공연</option> -->
<!-- 						<option value="00202">전시</option> -->
<!-- 						<option value="00203">시설</option> -->
<!-- 					</select> -->
<!-- 				</div> -->
<!-- 				<div> -->
<!-- 					기간 :  -->
<!-- 					<input type="date"> ~ <input type="date"> -->
<!-- 				</div> -->
<!-- 				<div> -->
<!-- 					<span id="categoryName">서비스명</span> :  -->
<!-- 					<input> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
	
	
<!-- </div> -->

<!-- <div id="recommends"> -->
<!-- 	<h3>추천 서비스</h3> -->
	
<!-- 	<div id="tabs"> -->
<!-- 		<ul> -->
<!-- 			<li>공연</li> -->
<!-- 			<li>전시</li> -->
<!-- 			<li>시설</li> -->
<!-- 		</ul> -->
<!-- 	</div> -->
	
<!-- 	<div id="result"> -->
<!-- 		<div id="showList"></div> -->
<!-- 		<div id="exhibitionList"></div> -->
<!-- 		<div id="facilityList"></div> -->
<!-- 	</div> -->
	
<!-- </div> -->
    
    
<script>
// 	search
	const cat = document.querySelector('#category');
	$(cat).on('change', () => $('#categoryName').text(cat.options[cat.selectedIndex].text + '명') );
	
	
// 	recommends
// 	function paintContent(thumbnail, name, start, end) {
// 		const content = $('div').html(
// 			`<div>
// 				<img src="\${thumbnail}">
// 			 </div>
// 			 <div>\${name}</div>
// 			 <div>\${start} ~ \${end}</div>`
// 		);
		
// 		return content;
// 	}
	
	$(document).ready(() => {

// 		const showRecommedation= ${recommendation.showList};
// 		const facilityRecommedation= ${recommendation.facilityList};

// 		const exhibitionRecommendation= ${exhibitionList};
// 		exhibitionRecommendation.forEach( rec => {
// 			$('#exhibitionList').append(paintContent(rec.thumbnail, rec.name, rec.startDate, rec.endDate));
// 		})
		
	})
	
	
</script>