<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/js/jquery-3.2.0.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ad-gallery.js"></script>
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/activities.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/accommodation.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/jquery.ad-gallery.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/inquires.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/activitySideMenu.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/css/activity/main.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/activity/base.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/standard/demo.css" rel="stylesheet" type="text/css" media="screen" />
<link href="<%=request.getContextPath()%>/css/menu_common/standard/flexslider.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
.btmCon{
	height: 532px;
}
.contain{
	height: 2100px;
}
.slider {
    margin: 0px 0 10px!important;
}
.contents .location .list strong {
    color: black;
    font-weight: bold;
    text-decoration: none;
}
</style>
<title>캠프</title>
<script type="text/javascript">
	function openCtrlPopup() {
		var windowW = 600; // 창의 가로 길이
		var windowH = 600; // 창의 세로 길이

		var left = Math.ceil((window.screen.width - windowW) / 2);
		var top = Math.ceil((window.screen.height - windowH) / 2);
		window.open("../search/popup.jsp", "popup", "top=" + top + ",left="
				+ left + ",width=600,height=600,resizable=no,scrollbars=yes")
	}

	function openMenuPopup() {
		var windowW = 600; // 창의 가로 길이
		var windowH = 900; // 창의 세로 길이

		var left = Math.ceil((window.screen.width - windowW) / 2);
		var top = Math.ceil((window.screen.height - windowH) / 2);
		window.open("../search/popup_menu.jsp", "popup_menu", "top=" + top
				+ ",left=" + left
				+ ",width=600,height=900,resizable=no,scrollbars=yes")
	}
</script>
<script>
					$(document).ready(
							function() {
								$(".gnbMenu .m4 .s1>a").addClass("on").parent()
										.parent().parent().children("a")
										.addClass("on").next().show();
								$(".lnbMenu .menu .m1 .s1>a").addClass("on");
							});
				</script>
</head>

<body>
	<c:import url="/WEB-INF/common/top.jsp"></c:import>
	<c:import url="/WEB-INF/common/menu.jsp"></c:import>
	<div class="contain">
		<div class="container" style="padding:0;">
			<c:import url="/WEB-INF/view/activity/activitySideMenu.jsp"></c:import>
			<div class="contents" id="contents">
				
				<div class="ctnActivities">
					<div class="location">
						<p class="list">
							<span class="crPosit">현재 페이지 위치 : </span> &gt; 액티비티 &gt; <strong>글램핑
								빌리지</strong>
						</p>
					</div>
					<div class="headTit">
						<h4 class="tit">
							<img alt="글램핑 빌리지"
								src="<%=request.getContextPath()%>/images/contents/activ/GCV/R0000000A73Z_KR.jpg">
						</h4>
					</div>
					
					 <section class="slider">
				        <div id="slider" class="flexslider">
				          <ul class="slides">
				            <li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009W5_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009W8_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009WB_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009WE_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R00000002AOU_KR.jpg" />
				  	    	</li>
				  	    	
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009W5_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009W8_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009WB_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009WE_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R00000002AOU_KR.jpg" />
				  	    	</li>
				  	    	
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009W5_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009W8_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009WB_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009WE_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R00000002AOU_KR.jpg" />
				  	    	</li>
				  	    	
				              
				          </ul>
				        </div>
				        <div id="carousel" class="flexslider">
				          <ul class="slides">
				            <li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009W5_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009W8_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009WB_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009WE_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R00000002AOU_KR.jpg" />
				  	    	</li>
				  	    	
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009W5_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009W8_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009WB_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009WE_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R00000002AOU_KR.jpg" />
				  	    	</li>
				  	    	
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009W5_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009W8_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009WB_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009WE_KR.jpg" />
				  	    	</li>
				  	    	<li>
				  	    	    <img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R00000002AOU_KR.jpg" />
				  	    	</li>
				  	    	
				  	    	
				          </ul>
				        </div>
				      </section>
				      <!-- jQuery -->
					  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
					  <script>window.jQuery || document.write('<script src="js/libs/jquery-1.7.min.js">\x3C/script>')</script>
					
					  <!-- FlexSlider -->
					  <script defer src="${pageContext.request.contextPath}/js/jquery.flexslider.js"></script>
					
					  <script type="text/javascript">
					    $(function(){
					      SyntaxHighlighter.all();
					    });
					    $(window).load(function(){
					      $('#carousel').flexslider({
					        animation: "slide",
					        controlNav: false,
					        animationLoop: false,
					        slideshow: false,
					        itemWidth: 210,
					        itemMargin: 5,
					        asNavFor: '#slider'
					      });
					
					      $('#slider').flexslider({
					        animation: "slide",
					        controlNav: false,
					        animationLoop: false,
					        slideshow: false,
					        sync: "#carousel",
					        start: function(slider){
					          $('body').removeClass('loading');
					        }
					      });
					    });
					  </script>
					<%-- <div class="flexslider" style="margin-bottom: 30px;">
						<ul class="slides">
							<li data-thumb="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009W6_KR.jpg">
								<img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009W5_KR.jpg" />
							</li>
							<li data-thumb="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009W9_KR.jpg">
								<img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009W8_KR.jpg" />
							</li>
							<li data-thumb="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009WC_KR.jpg">
								<img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009WB_KR.jpg" />
							</li>
							<li data-thumb="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009WF_KR.jpg">
								<img src="<%=request.getContextPath()%>/images/contents/activ/GCV/R000000009WE_KR.jpg" />
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
					  <script defer src="${pageContext.request.contextPath}/js/jquery.flexslider.js"></script>
					
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
					  </script>	 --%>

					

					<div class="btmCon">
						<div class="leftArea">
							<div class="topTxtwrap">
								<!-- <div class="topTxt">
									<img src="../../../images/ko/jeju/activities/cgCampingTxt.gif" alt="럭셔리 글램핑 카바나 & 바비큐 - 글램핑 카바나 빌리지"> -->
								<div class="topTxt">
									<img
										src="<%=request.getContextPath()%>/images/ko/jeju/activities/cgCampingTxt_A.gif"
										alt=" 글램핑 &amp; 바비큐 글램핑 빌리지(하단 내용 참조)">
									<div class="hidden">
										<p>글램핑 &amp; 바비큐 글램핑 빌리지</p>
										<p>카바나 스타일의 넓고 아늑한 텐트에서 즐기는 바비큐 파티의 낭만,</p>
										<p>세계적인 럭셔리 아웃도어 트랜드 글램핑에서 만나보세요.</p>
										<p>예약 / 문의 064-735-5179</p>
										<p>위치 숨비정원 글램핑 &amp; 캠핑 빌리지</p>
									</div>
									<div class="mgt44">
										<img
											src="<%=request.getContextPath()%>/images/ko/jeju/activities/cgCampingTxt_B.gif"
											alt=" 글램핑이란?">
									</div>
									<div>
										<img
											src="<%=request.getContextPath()%>/images/ko/jeju/activities/cgCampingImg_A.gif"
											alt=" 글램핑 빌리지 사진 1"> <img
											src="<%=request.getContextPath()%>/images/ko/jeju/activities/cgCampingImg_B.gif"
											alt=" 글램핑 빌리지 사진 2">
									</div>
									<div class="mgt4">
										<img
											src="<%=request.getContextPath()%>/images/ko/jeju/activities/cgCampingTxt_C.gif"
											alt="글램핑이란?(하단 내용 참조)">
										<div class="hidden">
											<p>화려하다의 뜻의 Glamorous와‘야영’이라는 Camping의 합성어로 유럽 지역에서 발원해</p>
											<p>북미 지역으로 옮겨간 럭셔리 캠핑을 뜻합니다.</p>
											<p>아름다운 야외 정원에서 최고급 글램핑 바비큐 메뉴와 함께 특별한 추억을 만들어보세요.</p>
											<p>텐트 안에서는 족욕, 갤럭시 탭, 보드 게임 등을 즐길 수 있습니다.</p>
											<p>고급스러운 카바나 스타일의 넓고 아늑한 대형 텐트에서 글램핑의 럭셔리함을 느껴보세요.</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="rightArea">
							<div class="HotelInfoBoxB">
								<div class="HotelBoxTop">
									<div class="conTitle2 titNew">
										<h6 class="tit">운영시간 및 이용요금</h6>
									</div>
									<div class="introList">
										<p class="tit">운영시간</p>
										<div class="useIntro">
											<p>- 런치 11:00 ~ 15:00</p>
											<p>- 디너 18:00 ~ 24:00</p>
										</div>
									</div>
									<div class="introList">
										<p class="tit">이용요금</p>
										<div class="useIntro">
											<p>-&nbsp;런치 : 290,000원/2인</p>
											<p>- 디너 : 360,000원/2인</p>
											<p>-&nbsp;키즈 : 39,000원/1인</p>
										</div>
									</div>
									<div class="introList ">
										<p class="tit">추가요금</p>
										<div class="useIntro">
											<p>-&nbsp;런치 : 120,000원/1인</p>
											<p>-&nbsp;디너 : 140,000원/1인</p>
										</div>
									</div>
									<div class="introList">
										<p class="tit">입장</p>
										<div class="useIntro">
											<p>여유로운 캠핑을 위해 20:00까지(런치 12:30)</p>
											<p>입장하여 주시기 바랍니다.</p>
										</div>
									</div>
									<div class="introList">
										<p class="tit">예약</p>
										<div class="useIntro">
											<p>당일 저녁 예약은 17:00까지 가능하며</p>
											<p>점심 예약은 1일 전까지 가능합니다.</p>
										</div>
									</div>
									<div class="introList mgb0">
										<p class="tit">취소</p>
										<div class="useIntro">
											<p>당일 취소 시 10%의 요금이 부과됩니다.</p>
											<p>
												<br>
											</p>
											<p>※ 기상 상황 또는 호텔 사정에 의해 장소 변경 및</p>
											<p>&nbsp;&nbsp;&nbsp; 취소 될 수 있습니다.</p>
										</div>
									</div>
								</div>

							</div>
							<ul class="btnSet actBtnR">
								<!-- li class="first ml"><a href="/jeju/activities/viewActiv.do" onclick="openCtrlPopup('./notiles/actFloorMapPop.do','actFloorMapPop');  return false;"><img src="../../../images/ko/jeju/activities/btnFloorMap.gif" alt="Map"></a></li -->
								<li class="first ml last"><a href="#"
									onclick="openCtrlPopup(); return false;"><img
										src="<%=request.getContextPath()%>/images/ko/jeju/activities/btnFloorMap.gif"
										alt="FloorMap"></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="btmConB">

					<div class="titBtnWrap mbm10">
						<h5>
							<img
								src="<%=request.getContextPath()%>/images/ko/jeju/activities/subTitmenu.gif"
								alt="메뉴 구성">
						</h5>
						<a href="#" onclick="openMenuPopup(); return false;"><img
							src="<%=request.getContextPath()%>/images/ko/jeju/activities/btnMenudrinkR.gif"
							alt="음료&amp;주류 Menu"></a>
					</div>
					<div class="Fl">
						<img
							src="<%=request.getContextPath()%>/images/ko/jeju/activities/subTitmenuimg.gif"
							alt="메뉴 이미지 사진">
					</div>
					<div class="bCBright mbt50">
						<table class="tableTypeB_N tableActivitiesMenu"
							summary="Lunch Menu,Dinner Menu,단품 Menu로 구성된 테이블 입니다.">
							<caption>메뉴구성 소개</caption>
							<colgroup>
								<col width="110" class="col1">
								<col width="145" class="col2">
								<col width="85" class="col3">
								<col width="*" class="col4">
							</colgroup>
							<tbody>
								<tr class="first">
									<th class="pe_qK" scope="row"><img alt="런치 메뉴"
										src="http://www.shilla.net/images/ko/jeju/activities/lunchMenu.gif"></th>
									<td colspan="2">
										<div class="introList">
											<ul>
												<li class="first">글램핑 카바나&nbsp;시설 이용</li>
												<li>웰컴 과일 및 프리미엄 생수 제공</li>
												<li class="last">글램핑 바비큐 런치 제공(2인)</li>
											</ul>
										</div>
									</td>
									<td>
										<div class="menuList">
											<p style="margin-top: -10px">
												<br>에멘탈 치즈를 곁들인 감자스프(닭고기: 국내산)<br> 발사믹 드레싱을 곁들인
												앤다이브 셀러드<br> 전복, 바닷가재<br> 호주산 와규 꽃등심(쇠고기:
												호주산/200g)<br> 제주산 흑돼지 오겹살(200g)<br> 통마늘, 수제 피클,
												올리브, 칠리소스<br> (묵은지 - 배추: 국내산, 고춧가루: 국내산)<br> 해산물
												파스타<br> 스페셜 디저트
											</p>
										</div>
									</td>
								</tr>
								<tr>
									<th class="pe_qK" scope="row"><img alt="디너 메뉴"
										src="<%=request.getContextPath()%>/images/ko/jeju/activities/dinnerMenu.gif"></th>
									<td colspan="2">
										<div class="introList">
											<ul>
												<li class="first">글램핑 카바나&nbsp;시설 이용</li>
												<li>웰컴 과일 및 프리미엄 생수 제공</li>
												<li class="last">글램핑 바비큐 디너 제공(2인)</li>
											</ul>
										</div>
									</td>
									<td>
										<div class="menuList">
											<p style="margin-top: -10px">
												<br>과일 살사와 허니 레몬 드레싱을 곁들인<br> 키조개 세비체<br> 에멘탈
												치즈를 곁들인 감자스프(닭고기: 국내산)<br> 발사믹 드레싱을 곁들인 앤다이브 셀러드<br>
												전복, 바닷가재<br> 호주산 와규 꽃등심(쇠고기: 호주산/200g),<br> 제주산
												흑돼지 오겹살(200g)<br> 통마늘, 수제 피클, 올리브, 칠리소스<br> (묵은지 -
												배추: 국내산, 고춧가루: 국내산)<br> 해산물 파스타<br> 요리사가 직접 선보이는
												라이브 디저트
											</p>
										</div>
									</td>
								</tr>
								<tr>
									<th class="pe_qK" scope="row"><img alt="키즈 메뉴"
										src="<%=request.getContextPath()%>/images/ko/jeju/activities/kidMenu.gif"></th>
									<td colspan="3">
										<div class="menuList">
											<p>오므라이스(쌀: 국내산), 호주산 쇠갈비(120g), 마카롱, 계절 과일</p>
										</div>
									</td>
								</tr>
								<tr class="last">
									<th class="pe_qK" scope="row"><img alt="단품 Menu"
										src="<%=request.getContextPath()%>/images/ko/jeju/activities/simpleMenu.gif"></th>
									<td>
										<div class="introList">
											<div class="introList">
												<ul class="price">
													<li class="first">바닷가재<br>(1마리/700g)</li>
													<li>와규 꽃등심<br>(100g/25,000원)</li>
													<li>제주산 흑돼지 오겹살<br>(100g/15,000원)</li>
													<li>새우(2Pieces)</li>
													<li class="last">전복(2Pieces)</li>
												</ul>
											</div>
										</div>
									</td>
									<td>
										<p style="line-height: 21px;">
											50,000원<br>
											<br>50,000원<br>
											<br>30,000원 <br>
											<br>20,000원<br>20,000원
										</p>
									</td>
									<td>
										<div class="menuList">
											<strong>원산지</strong>
											<p>닭 고기, 돼지 고기: 국내산</p>
											<p>쇠고기: 호주산</p>
											<p>케이싱(돈장): 중국산</p>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<p style="margin-top: 5px;">
							* 단품 메뉴는 바비큐 구이 세트 메뉴 이용 시 추가 이용 가능합니다.<br> * 음료&amp;주류는 현장
							주문 가능합니다.
						</p>

					</div>


					<!-- <div class="etcTxt Cb">
							<p>* 단품 메뉴는 바비큐 구이 세트 메뉴 이용 시 추가 이용 가능합니다.</p>
							<p>* 음료 &amp; 주류는 현장 주문 가능합니다.</p>
						</div> -->

					<div class="txtGrayBox Cb">
						<ul>
							<li class="first">- 블루 멤버십 회원은 식료에 대해 20% 할인 혜택이 있습니다. (7~8월
								10% 할인)</li>
							<li>- 제휴카드의 할인 혜택이 적용되지 않습니다.</li>
							<li class="last">- 메뉴는 10%의 세금이 포함된 금액입니다.</li>
						</ul>
					</div>

				</div>


				<!-- <ul class="snsList">
					<li class="first"><a title="twitter - popup"
						href="http://www.shilla.net:80/jeju/activities/viewActiv.do?contId=GCV"
						onclick="openSNS('twitter','http://www.shilla.net:80/jeju/activities/viewActiv.do?contId=GCV', 'Activities | Glamping Cabana Village | 제주신라호텔'); return false;"
						class="Twitter"><span>twitter</span></a></li>
					<li class="last"><a title="Facebook - popup"
						href="http://www.shilla.net:80/jeju/activities/viewActiv.do?contId=GCV"
						onclick="openSNS('facebook','http://www.shilla.net:80/jeju/activities/viewActiv.do?contId=GCV', 'Activities | Glamping Cabana Village | 제주신라호텔'); return false;"
						class="Facebook"><span>Facebook</span></a></li>
				</ul> -->


				<!-- POPUP Layer : actDrinkPop_KR-->
				<div id="actDrinkPop" style="display: none">
					<div class="popLayer popLayerActDrink">
						<div class="popHead">
							<h2 class="tit">
								<img alt="음료 &amp; 주류"
									src="${pageContext.request.contextPath}/images/ko/jeju/activities/ActDrinkpopTitle.gif">
							</h2>
							<div class="btn">
								<a class="btnClose"
									onclick="closePopup('actDrinkPop');  return false;"
									href="${REQ_URI}"><span>닫기</span></a>
							</div>
						</div>
						<div class="popCtn">
							<div class="headTit">
								<h4 class="tit">음료 &amp; 주류 리스트</h4>
							</div>
							<div class="allWrap">
								<div class="leftCon">
									<h5>
										<img alt="Beer"
											src="../../../images/ko/jeju/activities/actTxtbeer.png">
									</h5>
									<ul>
										<li class="first">
											<p>
												<strong>아사히 생맥주, 기네스 생맥주, 호가든 생맥주</strong>
											</p>
											<p>Asahi Draft Beer, Guinness Draft Beer, Hoegaarden
												Draft Beer</p>
											<p>16,000원</p>
										</li>
										<li>
											<p>
												<strong>클라우드</strong>
											</p>
											<p>Kloud 355ml(Can)</p>
											<p>12,000원</p>
										</li>
										<li>
											<p>
												<strong>칭따오</strong>
											</p>
											<p>Tsingtao 330ml(Can)</p>
											<p>13,000원</p>
										</li>
										<li>
											<p>
												<strong>하이네켄</strong>
											</p>
											<p>Heineken Club Bottle 330ml(Can)</p>
											<p>14,000원</p>
										</li>
										<li class="last">
											<p>
												<strong>화요소주(375ml/17%) </strong>
											</p>
											<p>Hwayo Soju</p>
											<p>35,000원</p>
										</li>
									</ul>
								</div>
								<div class="rightCon">
									<!--<div> <h5><img alt="Drink" src="../../../images/ko/jeju/activities/actTxtDrink.gif"></h5> <ul> <li> <p><strong>아사히 생맥주(340ml)</strong></p> <p>Asahi Draft Beer</p> <p>16,000원</p> </li> <li> <p><strong>기네스 생맥주(340ml)</strong></p> <p>Guinness Draft Beer</p> <p>16,000원</p> </li> <li> </li> </ul> </div> -->
									<div>
										<h5>
											<img alt="Soju"
												src="${pageContext.request.contextPath}/images/ko/jeju/activities/actTxtSoju.png">
										</h5>
										<ul>
											<li class="first last">
												<p>
													<strong>콜라 / 사이다</strong>
												</p>
												<p>Coke / Cider</p>
												<p>5,000원</p>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="btnAcc">
							<a class="btnClose"
								onclick="closePopup('actDrinkPop');  return false;"
								href="${REQ_URI}"><span>닫기</span></a>
						</div>
					</div>
					<div class="mdScreen" style="display: block; height: 2741px;">
						<br>
					</div>
				</div>
				<!-- POPUP Layer : actFloorMapPop_KR-->
				<div id="actFloorMapPop" style="display: none"></div>
				<!-- POPUP Layer : 야외 시설 Map-->
				<div id="hotelOutFmapPop" style="display: none"></div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</body>
</html>