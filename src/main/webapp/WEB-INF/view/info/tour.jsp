<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/infoSideMenu.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.0.min.js"></script>
<script src="http://maps.googleapis.com/maps/api/js"></script>
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDuA0rit--LbTJS7Pi1ljaPtANfh1sz-yE"></script>

<title>주변 관광지 소개</title>

<style type="text/css">
th {
	background: #f1e3c4;
	border-bottom: 1px solid #000000;
	border-right: 1px solid black;
	border-left: 1px solid black;
	width: 150px;
	height: 40px;
	width: 150px;
}

td {
	text-indent: 30px;
	border-bottom: 1px solid #000000;
	border-right: 1px solid black;
}

table {
	border-top: 2px solid #000000;
	border-bottom: 2px solid #000000;
}

/* 버튼 CSS */
button {
	background: #1AAB8A;
	color: #fff;
	border: none;
	position: relative;
	height: 30px;
	font-size: 0.8em;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

button:hover {
	background: #fff;
	color: #1AAB8A;
}

button:before, button:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

button:hover:before, button:hover:after {
	width: 100%;
	transition: 800ms ease all;
}
.contain{
	height: 1200px;
}
</style>
<script>
	function initialize() {

		var flagHotel = 0;
		var flagAquarium = 0;
		var flagBeach = 0;
		var flagRestaurant = 0;
		// 가상 호텔의 위도, 경도
		var x_Point = 33.428973;
		var y_Point = 126.933119;

		var hotel = new google.maps.LatLng(33.428973, 126.933119);
		// 아쿠아리움
		var tour1 = new google.maps.LatLng(33.433008, 126.927867);
		// 신양섭지코지해변
		var tour2 = new google.maps.LatLng(33.435483, 126.923643);
		// 강선생 레스토랑
		var tour3 = new google.maps.LatLng(33.435648, 126.922274);

		var hotelTitle = "SevenStar Hotel";
		var tour1Title = "SevenStar 아쿠아리움";
		var tour2Title = "SevenStar 해변산책로";
		var tour3Title = "SevenStar 레스토랑";
		var mapProp = {
			center : new google.maps.LatLng(33.428973, 126.933119),
			zoom : 14,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};

		var map = new google.maps.Map(document.getElementById("googleMap"),
				mapProp);
		var myLatLng = new google.maps.LatLng(x_Point, y_Point);

		// 말풍선 내용
		var markerMaxWidth = 300;
		var hotelString = '<div><h2>CHOONGANG Hotel</h2><p>주소 : 제주시 부평구 강호동 112-3 세븐스타호텔<br>연락처 : 012-3456-4856</p><p><img src = "../images/info/7.jpg" width="300" height="150"/></p></div>';
		var tour1String = '<div><h2>SevenStar 아쿠아리움</h2><p>주소 : 제주시 부평구 강호동 113-8 세븐스타 아쿠아리움<br> 연락처 : 012-3543-5486</p><p><img src = "../images/info/aqua.jpg" width="300" height="150"/></p></div>';
		var tour2String = '<div><h2>SevenStar 해변산책로</h2><p>주소 : 제주시 부평구 강호동 156-7 세븐스타 레스토랑 옆 길</p><p><img src = "../images/info/beach.jpg" width="300" height="150"/></p></div>';
		var tour3String = '<div><h2>SevenStar 레스토랑</h2><p>주소 : 제주시 부평구 강호동 156-7 세븐스타 레스토랑<br> 연락처 : 012-3545-5465</p><p><img src = "../images/info/1.jpg" width="300" height="150"/></p></div>';

		// 마커 정의
		var hotelMarker = new google.maps.Marker({
			position : hotel,
			title : hotelTitle
		});
		var tour1Marker = new google.maps.Marker({
			position : tour1,
			title : tour1Title
		});
		var tour2Marker = new google.maps.Marker({
			position : tour2,
			title : tour2Title
		});
		var tour3Marker = new google.maps.Marker({
			position : tour3,
			//map : map,
			title : tour3Title
		});
		
		// 말풍선 정의
		var hotelWindow = new google.maps.InfoWindow({
			content : hotelString,
			maxWidth : markerMaxWidth
		});
		var tour1Window = new google.maps.InfoWindow({
			content : tour1String,
			maxWidth : markerMaxWidth
		});
		var tour2Window = new google.maps.InfoWindow({
			content : tour2String,
			maxWidth : markerMaxWidth
		});
		var tour3Window = new google.maps.InfoWindow({
			content : tour3String,
			maxWidth : markerMaxWidth
		});

		// 버튼 클릭시 지도에 마커와 설명이 뜨게 됩니다.
		// 호텔
		$('#hotel').click(function() {
			if (flagHotel == 0) {
				// 마커띄움
				hotelMarker.setMap(map);

				// 말풍선 띄움
				hotelWindow.open(map, hotelMarker);
				// 클릭시 말풍선 띄움
				google.maps.event.addListener(hotelMarker, 'click', function() {
					hotelWindow.open(map, hotelMarker);
				})
				flagHotel = 1;
			} else {
				hotelWindow.close();
				hotelMarker.setMap(null);
				flagHotel = 0;
			}
		});
		// 아쿠아리움
		$('#aquarium').click(function() {
			if (flagAquarium == 0) {
				// 마커띄움
				tour1Marker.setMap(map);

				// 말풍선 띄움
				tour1Window.open(map, tour1Marker);
				// 클릭시 말풍선 띄움
				google.maps.event.addListener(tour1Marker, 'click', function() {
					tour1Window.open(map, tour1Marker);
				})
				flagAquarium = 1;
			} else {
				tour1Window.close();
				tour1Marker.setMap(null);
				flagAquarium = 0;
			}
		});
		// 해변
		$('#beach').click(function() {
			if (flagBeach == 0) {
				// 마커띄움
				tour2Marker.setMap(map);
				// 말풍선 띄움
				tour2Window.open(map, tour2Marker);
				// 마커 클릭시 말풍선 띄움
				google.maps.event.addListener(tour2Marker, 'click', function() {
					tour2Window.open(map, tour2Marker);
				})
				flagBeach = 1;
			} else {
				tour2Window.close();
				tour2Marker.setMap(null);
				flagBeach = 0;
			}
		});
		// 레스토랑		
		$('#restaurant').click(function() {
			if (flagRestaurant == 0) {
				// 마커 띄움.
				tour3Marker.setMap(map);
				
				// 말풍선 띄움
				tour3Window.open(map, tour3Marker);
				// 마커 클릭시 말풍선 띄움
				google.maps.event.addListener(tour3Marker, 'click', function() {
					tour3Window.open(map, tour3Marker);
				});
				flagRestaurant = 1;
			} else {
				tour3Window.close();
				tour3Marker.setMap(null);
				flagRestaurant = 0;
			}
		});
	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>

<%-- 키값--%>


</head>

<body>
	<c:import url="/WEB-INF/common/top.jsp"></c:import>
	<c:import url="/WEB-INF/common/menu.jsp"></c:import>
	<div class="subBody mypageBody">
		<div class="contain">
			<div class="container">
				<c:import url="/WEB-INF/view/info/infoSideMenu.jsp"></c:import>
				<div class="contents" id="contents">
					<div class="ctnIntroduction ctnAboutSevenstar">
						<div class="ctnAcmd ctnDeluxe">
							<div class="headTit">
								<h2 class="tit">주변 관광지 소개</h2>
							</div>

							<!-- content start -->
							<br> <br>
							<!-- Right Cont// -->
							<div class="right_cont">
								<div id="googleMap" style="width: 700px; height: 600px;"></div>
							</div>
							<br>
							<div>
								<table>
									<tr>
										<th>CHOONGANG <br>Resort<br>
											<button id="hotel">세부정보 및 위치</button>
										</th>
										<td>깨끗하고 안락한 내부시설과 최고의 서비스를 자랑하는 대한민국 최고의 호텔입니다.</td>
									</tr>
									<tr>
										<th>CHOONGANG <br>아쿠아리움<br>
											<button id="restaurant">세부정보 및 위치</button>
										</th>
										<td>다양하고 신기한 해양 생명체를 볼 수 있는 수족관입니다.</td>
									</tr>
									<tr>
										<th>CHOONGANG <br>해변 산책로<br>
											<button id="beach">세부정보 및 위치</button>
										</th>
										<td>아름다운 경관을 자랑하는 해변과 다양한 꽃을 구경할 수 있는 산책로 입니다.</td>
									</tr>
									<tr>
										<th>CHOONGANG <br>레스토랑<br>
											<button id="aquarium">세부정보 및 위치</button>
										</th>
										<td>강대호 쉐프가 책임지고 맛있는 음식을 만드는 레스토랑입니다.</td>
									</tr>
								</table>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</body>
</html>