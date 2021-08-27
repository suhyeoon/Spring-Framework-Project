<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/infoSideMenu.css" rel="stylesheet" type="text/css">

<title>오시는 길</title>

<script src="http://maps.googleapis.com/maps/api/js"></script>
<script>
	function initialize() {

		// 위도, 경도
		var x_Point = 33.428973;
		var y_Point = 126.933119;

		var markerTitle = "ChoongangResort";
		var mapProp = {
			center : new google.maps.LatLng(x_Point, y_Point),
			zoom : 15,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("googleMap"),
				mapProp);
		var myLatLng = new google.maps.LatLng(x_Point, y_Point);

		// 마커 소스
		var marker = new google.maps.Marker({
			position : myLatLng,
			map : map,
			title : markerTitle
		});

		// 말풍선
		var markerMaxWidth = 300;
		var contentString = '<div><h2>Choongang</h2><p>No Korean</p></div>';
		var infowindow = new google.maps.InfoWindow({
			content : contentString,
			maxWidth : markerMaxWidth
		});
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, marker);
		})
	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>

<%-- 키값--%>
<script
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDuA0rit--LbTJS7Pi1ljaPtANfh1sz-yE"></script>

<style type="text/css">
th {
	background: #f1e3c4;
	border-bottom: 1px solid #000000;
	border-right: 1px solid black;
	border-left: 0.1px solid black;	
	width: 150px;
	height: 40px;
}

td {
	text-indent: 30px;
	border-bottom: 1px solid #000000;
	border-right: 0.1px solid black; 
	/* width:500px; */ 
}
table{
	border-top: 2px solid #000000;
	border-bottom: 2px solid #000000;
}
.tableInfo{
	border: 1px solid #ffffff;
}

.info {
	text-indent: 0px;
	width: 500px;
	height: 200px;
	border-bottom: 1px solid #ffffff;
	border-right: 0.1px solid white; 
}
/* 리스트 */
.ctnLocation .locWrap {
	
}

.ctnLocation .locWrap .con {
	margin-bottom: 5px;
}

.ctnLocation .locWrap .con h5 {
	border: 1px solid #ededed;
	background: #f4f4f4;
}

.ctnLocation .locWrap .con h5 a img {
	vertical-align: top;
}

.ctnLocation .locWrap .con h5 a {
	padding: 12px 50px 12px 10px;
	line-height: 100%;
	display: block;
	background: url(/images/ko/jeju/inquires/openBtn.gif) no-repeat
		800px 12px;
}

.ctnLocation .locWrap .con .btTx {
	padding: 0 0 0 0;
	display: none;
}

.ctnLocation .locationMapTxtA {
	
}

/* .hidden {
    overflow: hidden;
    margin: 0;
    padding: 0;
    position: relative;
    width: 0;
    height: 0;
} */
.ctnLocation .locWrap .con h5 {
	border: 1px solid #ededed;
	background: #f4f4f4;
}
</style>
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
								<h2 class="tit">CHOONGANG Resort 오시는 길</h2>
							</div>
							<!-- content start -->
							<br> <br>
							<!-- Right Cont// -->
							<div class="right_cont">
								<div id="googleMap" style="width: 700px; height: 600px;"></div>
								<div>
									<br> <br>
									<table cellpadding="0" cellspacing="0" class="tableST01">
										<tbody>
											<tr>
												<th>주소</th>
												<td colspan="3" width="600px">제주특별자치도 서귀포시 성산읍 고성리 127-3 중앙 제주 리조트</td>
											</tr>
											<tr>
												<th>대표전화</th>
												<td colspan="3">064-3190-1430</td>
											</tr>

										</tbody>
									</table>

								</div>
								<!-- // 20160427 텍스트화 변경작업  -->

							</div>
							<!-- //Right Cont -->

							<!-- 리스트 -->
							<div class="locWrap">
								<div class="con">
									<div class="headTit">
										<h4 class="tit">공항 리무진 버스 정보</h4>
									</div>
									<div class="btTx">
										<div class="locationMapTxtA">

											<div class="hidden">
												<div class="hidden">

													<table class="tableInfo">
														<tr>
															<td class="info">
																<h5>제주국제공항 → 중앙 리조트</h5>
																<table cellpadding="0" cellspacing="0" summary="제주국제공항에서 중앙 리조트로 가는 공항 리무진 버스정보">
																	<caption>공항 리무진 버스정보</caption>

																	<tbody>
																		<tr>
																			<th>운행시간</th>
																			<td>06:10 ~ 22:50</td>
																		</tr>
																		<tr>
																			<th class="pe_qK">운행간격</th>
																			<td>14분 ~ 16분</td>
																		</tr>
																		<tr>
																			<th class="pe_qK">탑승장소</th>
																			<td>도착장 5번 Gate</td>
																		</tr>
																		<tr>
																			<th class="pe_qK">소요시간</th>
																			<td>약 50분</td>
																		</tr>
																	</tbody>
																</table>
															</td>
															<td class="info">
																<h5>중앙 리조트 → 제주국제공항</h5>
																<table cellpadding="0" cellspacing="0" summary="중앙 리조트에서 제주국제공항로 가는 공항 리무진 버스정보">
																	<caption>공항 리무진 버스정보</caption>

																	<tbody>
																		<tr>
																			<th class="pe_qK">운행시간</th>
																			<td>06:40 ~ 22:00</td>
																		</tr>
																		<tr>
																			<th class="pe_qK">운행간격</th>
																			<td>14분 ~ 16분</td>
																		</tr>
																		<tr>
																			<th class="pe_qK">탑승장소</th>
																			<td>제주중앙 6층 정문 앞</td>
																		</tr>
																		<tr>
																			<th class="pe_qK">소요시간</th>
																			<td>약 50분</td>
																		</tr>
																	</tbody>
																</table>
															</td>
														</tr>
													</table>


												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="con">
									<div class="headTit">
										<h4 class="tit">중앙 리조트 공항 데스크 운영 안내</h4>
									</div>
									<div class="btTx">
										<div class="locationMapTxtA">

											<div class="hidden">
												<div class="hidden">
													<p>공항과 호텔간의 편안한 호텔 차량으로 모십니다.</p>
													<h5>제주국제공항 → 중앙 리조트</h5>
													<table cellpadding="0" cellspacing="0"
														summary="제주중앙공항 데스크 운영 안내를 설명하는 게시판으로 위치,데스크 운영시간,운영시간,문의 항목을 제공합니다.">


														<tbody>
															<tr>
																<th class="pe_qK">위치</th>
																<td>제주공항 1층, Gate 1 옆</td>
															</tr>
															<tr>
																<th class="pe_qK">데스크 운영시간</th>
																<td>10:00 ~ 16:30</td>
															</tr>
															<tr>
																<th class="pe_qK">운영시간</th>
																<td width="750px">왕복 3회 운영 / 호텔 -&gt;공항 (11:30, 12:10, 15:00),
																	공항-&gt; 호텔 (13:30, 14:30, 16:30)</td>
															</tr>
															<tr>
																<th class="pe_qK">문의</th>
																<td>064- 738 - 4466</td>
															</tr>
														</tbody>
													</table>
													<ul>
														<li class="first">호텔 투숙객 대상 무료로 제공되는 서비스 입니다.</li>
														<li>사전 예약 불가하며 선착순 탑승하시면 됩니다.</li>
														<li>버스 출발 15분전까지 데스크로 오셔서 탑승 확인 바랍니다.</li>
														<li class="last">차량 대기 장소/시간은 사정에 따라 변경될 수 있으니 양해
															바랍니다.</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
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