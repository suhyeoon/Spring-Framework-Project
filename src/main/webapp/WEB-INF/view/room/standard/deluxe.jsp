<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/room/main.css" rel="stylesheet"type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/standard/base.css" rel="stylesheet"type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/standard/accommodation.css"rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/standard/demo.css" rel="stylesheet" type="text/css" media="screen" />
<link href="<%=request.getContextPath()%>/css/menu_common/standard/flexslider.css" rel="stylesheet" type="text/css" media="screen" />
<link href="<%=request.getContextPath()%>/css/menu_common/roomSideMenu.css" rel="stylesheet"/>

<title>standard | deluxe</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript">
	function openDeluxeMapPopup() {
		var windowW = 600; // 창의 가로 길이
		var windowH = 900; // 창의 세로 길이

		var left = Math.ceil((window.screen.width - windowW) / 2);
		var top = Math.ceil((window.screen.height - windowH) / 2);
		window.open("${pageContext.request.contextPath}/search/popup_deluxe_room.jsp", "popup_deluxe_map", "top="
				+ top + ",left=" + left
				+ ",width=600,height=550,resizable=no,scrollbars=yes")
	}

	function openAccAmenityPop() {
		var windowW = 600; // 창의 가로 길이
		var windowH = 900; // 창의 세로 길이

		var left = Math.ceil((window.screen.width - windowW) / 2);
		var top = Math.ceil((window.screen.height - windowH) / 2);
		window.open("${pageContext.request.contextPath}/search/popup_standard_amenity.jsp", "popup_amenity",
				"top=" + top + ",left=" + left
						+ ",width=620,height=630,resizable=no,scrollbars=yes")
	}
</script>
</head>
<style type="text/css">
th {
	background: white;
	border-bottom: 1px solid #ffffff;
	border-right: 1px solid black;
	width: 150px;
	height: 40px;
}

.contents .location .list {
	display: block;
	font-size: 11px;
	background: none;
	/* background: url(../../images/locaton.gif) no-repeat 0 1px; */
	line-height: 12px;
}

.location {
	text-align: right;
	font: 12px/160% Dotum, '돋움', sans-serif;
	color: #101010;
}

.HotelInfoBox .HotelBoxTop {
    background: #faf7ed;
    padding: 15px 15px;
    width: 350px;
    text-align: left;
}
.keepArea {
    text-align: right;
   	margin: 0px 0 0px 0; 
}

p {
    color: rgb(16, 16, 16);
    margin: 0px;
    padding: 0px;
    font: 12px/160% Dotum, 돋움, sans-serif;
}
.icoBooking {
    position: relative;
    width: 15px;
    height: 12px;
    overflow: hidden;
    cursor: text;
    background: url(${pageContext.request.contextPath}/images/accommodation/standard/question.gif) 0 0 no-repeat;
    padding: 1px 0 1px 0;
    display: inline-block;
    vertical-align: middle;
}
</style>

<body>
	<center>
		<c:import url="/WEB-INF/common/top.jsp"></c:import>
		<c:import url="/WEB-INF/common/menu.jsp"></c:import>
				<!-- 사이드 메뉴 -->
				<div class="demo">
					<c:import url="/WEB-INF/view/room/roomSideMenu.jsp"></c:import>
					<!-- 본문 -->
					<div class="contents" id="contents">
						<div class="subWrap subWrapJeju">
							<div class="ctnRetreat">
								<div class="location">
									<p class="list">
										<span class="crPosit">현재 페이지 위치 : </span> 홈 &gt; 객실 &gt; 스탠다드
										&gt; <strong>디럭스</strong>
									</p>
								</div>
								<div class="headTit">
									<h4 class="tit" align="left">
										<img alt="디럭스"
											src="<%=request.getContextPath()%>/images/accommodation/standard/deluxe/R00000009TT6_KR.gif">
									</h4>
								</div>
								
								<div class="flexslider">
									<ul class="slides">
										<li data-thumb="<%=request.getContextPath()%>/images/accommodation/standard/deluxe/R00000000T3N_KR.jpg">
											<img src="<%=request.getContextPath()%>/images/accommodation/standard/deluxe/R00000000T3M_KR.jpg" />
										</li>
										<li data-thumb="<%=request.getContextPath()%>/images/accommodation/standard/deluxe/R00000000T3Q_KR.jpg">
											<img src="<%=request.getContextPath()%>/images/accommodation/standard/deluxe/R00000000T3P_KR.jpg" />
										</li>
										<li data-thumb="<%=request.getContextPath()%>/images/accommodation/standard/deluxe/R00000000T3T_KR.jpg">
											<img src="<%=request.getContextPath()%>/images/accommodation/standard/deluxe/R00000000T3S_KR.jpg" />
										</li>
										<li data-thumb="<%=request.getContextPath()%>/images/accommodation/standard/deluxe/R00000000T3W_KR.jpg">
											<img src="<%=request.getContextPath()%>/images/accommodation/standard/deluxe/R00000000T3V_KR.jpg" />
										</li>
									</ul>
								</div>
								
								<!-- jQuery -->
								<script
									src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
								<script>
									window.jQuery
											|| document
													.write('<script src="js/libs/jquery-1.7.min.js">\x3C/script>')
								</script>

								 <!-- FlexSlider -->
								  <script defer src="../../js/jquery.flexslider.js"></script>
								
								  <script type="text/javascript">
								    $(function(){
								      SyntaxHighlighter.all();
								    });
								    $(window).load(function(){
								      $('.flexslider').flexslider({
								        animation: "slide",
								        controlNav: "thumbnails",
								        start: function(slider){
								          $('body').removeClass('loading');
								        }
								      });
								    });
								  </script>	
								  
								
								<!-- <div id="aa" class="keepArea">
									<div class="keepArea" style="margin-top: 5px;">
										<a id="printBtn"
							href="/jeju/accommodation/viewAccmo.do"
							onclick="window.print();  return false;" class="print">인쇄하기</a>
									</div>
								</div> -->

								<div class="btmCon">
									<div class="leftArea">
										<div class="topTxtwrap">
											<div class="topTxt">
												<img
													src="<%=request.getContextPath()%>/images/accommodation/standard/deluxe/R0000000EFKJ_KR.jpg"
													alt="디럭스룸 소개(하단 내용 참조)">												
											</div>
											<div class="btBtm">
												<a id="accAmenityPopBtn" href="#"
													onclick="openAccAmenityPop(); return false;"><img
													src="<%=request.getContextPath()%>/images/accommodation/standard/btnAmenityview.gif"
													alt="객실어매니티 - 팝업"></a>
											</div>
										</div>
										<table summary="In Room,In Hotel,Room Service로 구성된 테이블 입니다."
											class="tableTypeB tableRoomInfor">
											<caption>스탠다드 서비스소개</caption>
											<colgroup>
												<col width="20%" class="col1">
												<col width="*" class="col2">
											</colgroup>
											<tbody>
												<tr class="first">
													<th scope="row"><img
														src="<%=request.getContextPath()%>/images/accommodation/standard/inRoom.gif"
														alt="In Room"></th>
													<td>
														<div class="introList">
															<ul>
																<li class="first">- 위성 TV 무료 – 41개 채널 <a
																	class="channelView"><span>위성채널정보
														보기</span></a>
																</li>
																<li>- 유·무선 인터넷(wi-fi)</li>
																<li>- 220V 또는 110V 전원</li>
																<li class="last">- 엑스트라 베드 또는 침구 1개 추가 48,400원/1박<br>(12개월
																	이하 영아 침대 1개 무료 제공)
																</li>
															</ul>

														</div>
													</td>
												</tr>
												<tr>
													<th scope="row"><img
														src="<%=request.getContextPath()%>/images/accommodation/standard/inHotel.gif"
														alt="In Hotel"></th>
													<td>
														<div class="introList">
															<ul>
																<li class="first">- 피트니스 클럽, 실내외 수영장 무료 이용</li>
																<li>- 사우나 이용 시 유료</li>
																<li>- 키즈클럽 시설 이용 무료 <br>(프로그램 이용 시 별도 요금 부가)
																</li>
																<li class="ofh last"><span class="left">- 유아
																		물품 대여 서비스 (무료) </span>
																	<div class="bookWrap">
																		<a class="icoBooking"></a>
																		<div class="txtBalloon">
																			<div class="txtBalloonIn">
																				<div class="ballonCon">
																					<p class="first">
																						<strong>유아 동반 고객은 유아 관련 필요 물품을<br>무료로
																							대여하실 수 있습니다.
																						</strong>
																					</p>
																					<p>
																						- 대여 가능한 유아 용품: 아기침대, 아기의자,<br>&nbsp; 어린이용 컵,
																						젖병 소독기, 아기욕조 등
																					</p>
																				</div>
																				<a class="btnClose" href="#none">닫기</a>
																			</div>
																		</div>
																		<a class="bfBoooking">(사전예약필요)</a>
																	</div></li>
															</ul>

														</div>
													</td>
												</tr>
												<tr>
													<th scope="row"><img
														src="<%=request.getContextPath()%>/images/accommodation/standard/roomService.gif"
														alt="roomService"></th>
													<td>
														<div class="introList">
															<ul>
																<li class="first">- 객실에서 즐기실 수 있는 다양한 룸서비스 메뉴가 준비되어
																	있습니다.</li>
																<li>- 한식, 일식: 조식07:00~10:00, 점심12:00~14:30,
																	저녁18:00~22:00</li>
																<li class="last">- 양식 및 음료: 24시간</li>
															</ul>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
										<!-- <ul class="snsList">
											<li class="first"><a title="twitter - popup"
												href="http://www.shilla.net:80/jeju/accommodation/viewAccmo.do?contId=ST"
												onclick="openSNS('twitter','http://www.shilla.net:80/jeju/accommodation/viewAccmo.do?contId=ST', 'Accommodation | Standard | 제주신라호텔'); return false;"
												class="Twitter"><span>twitter</span></a></li>
											<li class="last"><a title="Facebook - popup"
												href="http://www.shilla.net:80/jeju/accommodation/viewAccmo.do?contId=ST"
												onclick="openSNS('facebook','http://www.shilla.net:80/jeju/accommodation/viewAccmo.do?contId=ST', 'Accommodation | Standard | 제주신라호텔'); return false;"
												class="Facebook"><span>Facebook</span></a></li>
										</ul> -->
									</div>
									<div class="rightArea">
										<ul class="btnSet">
											<li class="first"><a id="accmoMapBtn"
												href="/jeju/accommodation/viewAccmo.do"
												onclick="openDeluxeMapPopup(); return false;"><img
													src="<%=request.getContextPath()%>/images/accommodation/standard/btnFloorPlanView.gif"
													alt="도면보기 - 팝업"></a></li>
											<li>
												<!-- <a href="javascript:openAsk('ROOM_PAC','');"> --> <a
												href="<%=request.getContextPath()%>/qna/list"><img
													src="<%=request.getContextPath()%>/images/accommodation/standard/btnInquiry.gif"
													alt="문의하기"></a>
											</li>
											<li class="last"><a href="<%=request.getContextPath()%>/reservationStep01"> <img
													src="<%=request.getContextPath()%>/images/accommodation/standard/btnBooking.gif"
													alt="예약하기"></a></li>
										</ul>
										<div style="display: none">
											<div class="conTitle1">
												<h5 class="tit">Package</h5>
											</div>

											<div class="packagePicw">
												<div class="spBox">
													<span class="img"><a
														href="/jeju/offers/pack/viewPack.do?spofrId="><img
															alt="package 이미지보기" src="/images/upload/"></a></span> <span
														class="info"> <span class="name"><a
															href="/jeju/offers/pack/viewPack.do?spofrId="></a></span> <span
														class="date"> ~ </span> <span class="mask"></span>
													</span>
												</div>
											</div>
										</div>
										<div class="HotelInfoBox ">
											<div class="HotelBoxTop">
												<div class="conTitle2">
													<h6 class="tit">Hotel Info.</h6>
												</div>
												<div class="introLeft">
													<p class="tit">조식 이용 안내</p>
													<div class="useIntro">
														<p>- 시간: 07:00 ~ 10:00</p>
														<p>- 식당: 한식, 뷔페</p>
													</div>
												</div>
												<div class="introRight">
													<p class="tit">체크인/체크아웃 시간</p>
													<div class="useIntro">
														<p>- 체크인: 오후 2시 이후</p>
														<p>- 체크아웃: 11시</p>
													</div>
												</div>
												<div class="introBtm">
													<p class="tit">예약 취소/변경 및 No-Show 안내</p>
													<div class="useIntro">
														<p>성수기(5월 ~ 10월, 12월 24일 ~ 31일)</p>
														<p>- 숙박 예정일 7일 전: 위약금 없음</p>
														<p>- 숙박 예정일 6일 전 ~ 1일 전(18시까지 취소 및 변경</p>
														<p style="padding-left: 18px;">시): 최초 1박 요금의 20%</p>
														<p>
															- 숙박 예정일 1일 전(18시 이후 취소 및 변경, No-Sh<br>
														</p>
														<p style="padding-left: 18px;">ow 시): 최초 1박 요금의 80%</p>
														<p>비수기(성수기 외 기간)</p>
														<p>- 숙박 예정일 1일 전(18시까지): 위약금 없음</p>
														<p>
															- 숙박 예정일 1일 전(18시 이후 취소 및 변경, No-Sh<br>
														</p>
														<p style="padding-left: 20px;">ow 시): 최초 1박 요금의 10%</p>
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
	</center>
</body>
</html>