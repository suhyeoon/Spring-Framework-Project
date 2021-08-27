<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/room/main.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/room/base.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/activities.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/accommodation.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/jquery.ad-gallery.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/inquires.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/lightslider.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/css/menu_common/roomSideMenu.css" rel="stylesheet"/>
<title>프리미어룸_테라스</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/lightslider.js"></script>
<script>
	$(document).ready(function() {
		$("#content-slider").lightSlider({
			loop : true,
			auto : true,
			keyPress : true
		});
		$('#image-gallery').lightSlider({
			gallery : true,
			item : 1,
			thumbItem : 9,
			slideMargin : 0,
			speed : 500,
			auto : true,
			loop : true,
			onSliderLoad : function() {
				$('#image-gallery').removeClass('cS-hidden');
			}
		});
	});
	function openDivPopup() {
		var windowW = 600; // 창의 가로 길이
		var windowH = 900; // 창의 세로 길이

		var left = Math.ceil((window.screen.width - windowW) / 2);
		var top = Math.ceil((window.screen.height - windowH) / 2);
		window.open("${pageContext.request.contextPath}/search/popup_Div.jsp", "popup_Div", "top=" + top
				+ ",left=" + left
				+ ",width=600,height=500,resizable=no,scrollbars=yes")
	}
	function openAmenityPopup() {
		var windowW = 600; // 창의 가로 길이
		var windowH = 900; // 창의 세로 길이

		var left = Math.ceil((window.screen.width - windowW) / 2);
		var top = Math.ceil((window.screen.height - windowH) / 2);
		window.open("/Resort_04/search/popup_Amenity.jsp", "popup_Amenity", "top=" + top
				+ ",left=" + left
				+ ",width=620,height=600,resizable=no,scrollbars=yes")
	}
	
</script>

</head>
<style type="text/css">

.item .location .list {
	display: block;
	font-size: 11px;
	line-height: 12px;
}

.location {
	text-align: right;
	font: 12px/160% Dotum, '돋움', sans-serif;
	color: #101010;
}

.demo .clearfix {
    clear: both;
    margin-top: 0px;
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

		<div class="demo">
			<c:import url="/WEB-INF/view/room/roomSideMenu.jsp"></c:import>
		
			<div class="item">

				<div class="location">
					<p class="list">
						<span class="crPosit">현재 페이지 위치 : </span> 홈 &gt; 객실 &gt; 프리미어 &gt;
						<strong>프리미어_테라스</strong>
					</p>
				</div>
				<div class="headTit">
				<h4 class="tit">
				<img alt="프리미어"
				src="${pageContext.request.contextPath}/images/contents/accmo/PE/R00000009TW6_KR.gif">
				</h4>
				</div>
				<div class="clearfix" style="max-width: 866px;">
				<ul id="image-gallery" class="gallery list-unstyled cS-hidden">
					<li
						data-thumb="<%=request.getContextPath()%>/images/contents/accmo/terrace/thumb/R00000000FUU_KR.jpg">
						<img
						src="<%=request.getContextPath()%>/images/contents/accmo/terrace/R00000000FUS_KR.jpg" />
					</li>
					<li
						data-thumb="<%=request.getContextPath()%>/images/contents/accmo/terrace/thumb/R00000000FUZ_KR.jpg">
						<img
						src="<%=request.getContextPath()%>/images/contents/accmo/terrace/R00000000FUX_KR.jpg">
					</li>
					<li
						data-thumb="<%=request.getContextPath()%>/images/contents/accmo/terrace/thumb/R00000000FV4_KR.jpg">
						<img
						src="<%=request.getContextPath()%>/images/contents/accmo/terrace/R00000000FV2_KR.jpg" />
					</li>
					<li
						data-thumb="<%=request.getContextPath()%>/images/contents/accmo/terrace/thumb/R00000000FV9_KR.jpg">
						<img
						src="<%=request.getContextPath()%>/images/contents/accmo/terrace/R00000000FV7_KR.jpg" />
					</li>
					<li
						data-thumb="<%=request.getContextPath()%>/images/contents/accmo/terrace/thumb/R000000012R9_KR.jpg">
						<img
						src="<%=request.getContextPath()%>/images/contents/accmo/terrace/R000000012R7_KR.jpg" />
					</li>
					<li
						data-thumb="<%=request.getContextPath()%>/images/contents/accmo/terrace/thumb/R000000012RE_KR.jpg">
						<img
						src="<%=request.getContextPath()%>/images/contents/accmo/terrace/R000000012RC_KR.jpg" />
					</li>
					<li
						data-thumb="<%=request.getContextPath()%>/images/contents/accmo/terrace/thumb/R000000012RJ_KR.jpg">
						<img
						src="<%=request.getContextPath()%>/images/contents/accmo/terrace/R000000012RH_KR.jpg" />
					</li>
					<li
						data-thumb="<%=request.getContextPath()%>/images/contents/accmo/terrace/thumb/R000000012RO_KR.jpg">
						<img
						src="<%=request.getContextPath()%>/images/contents/accmo/terrace/R000000012RM_KR.jpg" />
					</li>
					<li
						data-thumb="<%=request.getContextPath()%>/images/contents/accmo/terrace/thumb/FILE445d227ca6ec5ca4 (2).jpg">
						<img
						src="<%=request.getContextPath()%>/images/contents/accmo/terrace/FILE445d227ca6ec5ca4.jpg" />
					</li>
				</ul>
			</div>
				<div id="aa" class="keepArea">


			<!-- <div class="printArea">
				<a id="printBtn" href="/jeju/accommodation/viewAccmo.do"
					onclick="window.print();  return false;" class="print">인쇄하기</a>
			</div> -->
			<div class="btmCon">
				<div class="leftArea">
					<div class="topTxtwrap">
						<div class="topTxt">


							<img
								src="<%=request.getContextPath()%>/images/contents/accmo/PE/R0000000EFOS_KR.jpg"
								alt="Premier room 소개(하단 내용 참조)">
							<div class="hidden">
								<p>고급스러운 별장의 게스트 룸과 같은 매력을 지닌 프리미어&nbsp;룸</p>
								<p>이국적인 리조트 느낌의 화사한 인테리어로 기본 스탠다드 룸보다 넓은 객실입니다.</p>
								<p>문의전화 :&nbsp;1588-1142 (대표)</p>
								<p>스튜디오 타입 디자인</p>
								<p>스튜디오 타입 객실에 블루 패턴의 카페트와 화이트 패브릭 소파가 세련된 느낌을 자아내며, 휴식을 취할
									수 있는 다이닝 테이블과 체어를 완비한 제주신라의 객실로 5 ~ 8층에 위치해 제주의 멋진 자연 풍광을 감상할 수
									있는 객실입니다.</p>
								<dl>
									<dt>위치</dt>
									<dd>5 ~ 8층</dd>
									<dt>전망</dt>
									<dd>산 또는 바다</dd>
									<dt>침대</dt>
									<dd>더블, 트윈</dd>
									<dt>크기</dt>
									<dd>46㎡</dd>
									<dt>구성</dt>
									<dd>침실 1, 욕실 1</dd>
								</dl>
							</div>
						</div>
						<div class="btBtm">
							<a id="accAmenityPopBtn" href="#"
								onclick="openAmenityPopup(); return false;"><img
								src="<%=request.getContextPath()%>/images/ko/jeju/accommodation/btnAmenityview.gif"
								alt="객실어매니티 - 팝업"></a>
						</div>
					</div>
					<table summary="In Room,In Hotel,Room Service로 구성된 테이블 입니다."
						class="tableTypeB tableRoomInfor">
						<caption>프리미어 서비스소개</caption>
						<colgroup>
							<col width="20%" class="col1">
							<col width="*" class="col2">
						</colgroup>
						<tbody>
							<tr class="first">
								<th scope="row"><img
									src="<%=request.getContextPath()%>/images/ko/jeju/accommodation/inRoom.gif"
									alt="In Room"></th>
								<td>
									<div class="introList">
										<ul>
											<li class="first">위성 TV 무료 – 41개 채널 <a
												class="channelView"><span>위성채널정보
														보기</span></a>
											</li>
											<li>유·무선 인터넷(wi-fi)</li>
											<li>220V 또는 110V 전원</li>
											<li class="last">엑스트라 베드 또는 침구 1개 추가 48,400원/1박<br>(12개월
												이하 영아 침대 1개 무료 제공)
											</li>
										</ul>

									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><img
									src="<%=request.getContextPath()%>/images/ko/jeju/accommodation/inHotel.gif"
									alt="In Hotel"></th>
								<td>
									<div class="introList">
										<ul>
											<li class="first">피트니스 클럽, 실내외 수영장 무료 이용</li>
											<li>사우나 이용 시 유료</li>
											<li>키즈클럽 시설 이용 무료 <br>(프로그램 이용 시 별도 요금 부가)
											</li>
											<li class="ofh last"><span class="left">유아 물품 대여
													서비스 (무료) </span>
												<div class="bookWrap">
													<span class="icoBooking"><a href="">설명</a></span>
													<div class="txtBalloon">
														<div class="txtBalloonIn">
															<div class="ballonCon">
																<p class="first">
																	<strong>유아 동반 고객은 유아 관련 필요 물품을<br> <br>무료로
																		대여하실 수 있습니다.
																	</strong>
																</p>
																<p>
																	- 대여 가능한 유아 용품: 아기침대, 아기의자,<br> &nbsp;<br>&nbsp;
																	어린이용 컵, 젖병 소독기, 아기욕조 등
																</p>
															</div>
															<a class="btnClose" href="#none">닫기</a>
														</div>
													</div>
													<em class="bfBoooking">(사전예약필요)</em>
												</div></li>
										</ul>

									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><img
									src="<%=request.getContextPath()%>/images/ko/jeju/accommodation/roomService.gif"
									alt="roomService"></th>
								<td>
									<div class="introList">
										<ul>
											<li class="first">객실에서 즐기실 수 있는 다양한 룸서비스 메뉴가 준비되어 있습니다.
											</li>
											<li>한식, 일식: 조식07:00~10:00, 점심12:00~14:30, 저녁18:00~22:00
											</li>
											<li class="last">양식 및 음료: 24시간</li>
										</ul>
									</div>
								</td>
							</tr>
						</tbody>
					</table>





					<!-- <ul class="snsList">
						<li class="first"><a title="twitter - popup"
							href="http://www.shilla.net:80/jeju/accommodation/viewAccmo.do?contId=PE"
							onclick="openSNS('twitter','http://www.shilla.net:80/jeju/accommodation/viewAccmo.do?contId=PE', '누구나 한번쯤 꿈꾸는 일상으로부터의 탈출 | 제주신라호텔'); return false;"
							class="Twitter"><span>twitter</span></a></li>
						<li class="last"><a title="Facebook - popup"
							href="http://www.shilla.net:80/jeju/accommodation/viewAccmo.do?contId=PE"
							onclick="openSNS('facebook','http://www.shilla.net:80/jeju/accommodation/viewAccmo.do?contId=PE', '누구나 한번쯤 꿈꾸는 일상으로부터의 탈출 | 제주신라호텔'); return false;"
							class="Facebook"><span>Facebook</span></a></li>
					</ul> -->


				</div>
				<div class="rightArea">
					<center>
						<ul class="btnSet">
								<li class="first"><a id="accmoMapBtn" 
								href="/jeju/accommodation/viewAccmo.do" 
								onclick="openDivPopup(); return false;"><img 
								src="<%=request.getContextPath()%>/images/ko/jeju/accommodation/btnFloorPlanView.gif"
									alt="도면보기 - 팝업"></a></li>
								
								<li>
									<!-- <a href="javascript:openAsk('ROOM_PAC','');"> -->
									<a href="<%=request.getContextPath()%>/qna/list"><img src="<%=request.getContextPath()%>/images/accommodation/standard/btnInquiry.gif" alt="문의하기"></a></li>
								<li class="last"><a href="<%=request.getContextPath()%>/reservationStep01"><img src="<%=request.getContextPath()%>/images/accommodation/standard/btnBooking.gif" alt="예약하기"></a></li>
							</ul>
						<!-- <ul class="btnSet" style="width: 50px;"></ul> -->
					</center>
					





					<div style="display: none">
						<div class="conTitle1">
							<h5 class="tit">Package</h5>
						</div>

						<div class="packagePicw">
							<div class="spBox">
								<span class="img"><a
									href="/jeju/offers/pack/viewPack.do?spofrId="><img
										alt="package 이미지보기"
										src="<%=request.getContextPath()%>/images/upload/"></a></span> <span
									class="info"> <span class="name"><a
										href="/jeju/offers/pack/viewPack.do?spofrId="></a></span> <span
									class="date"> ~ </span> <span class="mask"></span>
								</span>
							</div>
						</div>

					</div>
					<div class="HotelInfoBox ">
						<div class="HotelBoxTop"
							style="padding-right: 17px; background: #faf7ed;">
							<div class="conTitle2" style="width: 180px; height: 20px;">
								<h6 class="tit"></h6>
							</div>
								<div class="introLeft" align="left">
									<p class="tit">조식 이용 안내</p>
									<div class="useIntro">
										<p>- 시간: 07:00 ~ 10:00</p>
										<p>- 식당: 한식, 뷔페</p>
									</div>
								</div>
								<div class="introRight" align="left">
									<p class="tit">체크인/체크아웃 시간</p>
									<div class="useIntro">
										<p>- 체크인: 오후 2시 이후</p>
										<p>- 체크아웃: 11시</p>
									</div>
								</div>
								<div class="introBtm" align="left">
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
		
	</center>
	<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</body>

</html>