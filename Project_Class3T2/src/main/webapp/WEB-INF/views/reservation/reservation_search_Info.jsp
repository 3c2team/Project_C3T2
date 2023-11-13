<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<link href="${pageContext.request.contextPath }/resources/css/top.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/bottom.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/reservation.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/reservation.js"></script>
<head>
<meta charset="UTF-8">
<title>Jai Faim</title>
</head>
<script type="text/javascript">
	function check() {
		let result = confirm("예약 취소 하시겠습니까?");
		if(result){
			alert("취소 완료되었습니다.")
			location.href='ReservationDelete?reservation_guest_num=${reservation.reservation_guest_num}&reservation_person_name=${reservation.reservation_person_name}';
		}
	}
</script>
<body>
		<header>
			<jsp:include page="../inc/top.jsp"></jsp:include>
		</header>
	<div id="mainLayout">
		<main>
				<h2 class="sign" align="center">Reservation</h2>
				<table class="custom_table">
					<tr>
						<th id="searchInfo" align="center">예약 상세 조회</th>
					</tr>
					<tr>
						<th>예약일자</th>
						<td>${reservation.reservation_date }&nbsp;${reservation.reservation_time }</td>
					</tr>
					<tr>
						<th>예약번호</th>
						<td>${reservation.reservation_guest_num }</td>
					</tr>
					<tr>
						<th>예약인원</th>
						<td>${reservation.reservation_person_count }명</td>
					</tr>
					<tr>
						<th>예약자 성함</th>
						<td>${reservation.reservation_person_name }</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${reservation.reservation_email }</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="홈으로" onclick="location.href='./'">
							<input type="button" value="예약취소" onclick="check()">
							<input type="button" value="예약수정" 
							onclick="location.href ='ReservationUpdate?reservation_guest_num=${reservation.reservation_guest_num}&reservation_person_name=${reservation.reservation_person_name}'">
						</td> <!-- ?reservation_guest_num=${reservation.reservation_guest_num} -->
					</tr>
				</table>
			<div id="map" style="margin:auto; width:700px; height:600px; margin-bottom: 85px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0d79e4be802855b8c8c9dc38e9b02f6d"></script>
			<script>
				var container = document.getElementById('map');
				var options = {
					center: new kakao.maps.LatLng(35.15860, 129.0620),
					level: 1
				};
			
				var map = new kakao.maps.Map(container, options);
				
	// 			var markerPosition  = new kakao.maps.LatLng(35.15860, 129.0620); 
			
	// 			// 마커를 생성합니다
	// 			var marker = new kakao.maps.Marker({
	// 			    position: markerPosition
	// 			});
			
	// 			// 마커가 지도 위에 표시되도록 설정합니다
	// 			marker.setMap(map);
	
				var imageSrc = '/c3t2/resources/main_img/free-icon-food-and-restaurant-1515636.png', // 마커이미지의 주소입니다    
			    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
			    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			      
				// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
				    markerPosition = new kakao.maps.LatLng(35.15860, 129.0620); // 마커가 표시될 위치입니다
				
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition, 
				    image: markerImage // 마커이미지 설정 
				});
				
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);  
			</script>
		</main>
	</div>
		<footer id="footer">
			<jsp:include page="../inc/bottom.jsp"></jsp:include>
		</footer>
</body>
</html>