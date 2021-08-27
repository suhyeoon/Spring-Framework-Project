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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/commonEx.js"></script>
<title>소개</title>

<style type="text/css">
th {
	background: #f1e3c4;
	border-bottom: 1px solid #000000;
	border-right: 1px solid black;
	border-left: 0.1px solid black;
	width: 150px;
	height: 40px;
	width: 150px;
}

td {
	text-indent: 30px;
	border-bottom: 1px solid #000000;
	border-right: 0.1px solid black;
}

table {
	border-top: 2px solid #000000;
	border-bottom: 2px solid #000000;
}

.clearfix {
	overflow: visible;
	zoom: 1;
}

.hidden {
	overflow: hidden;
	margin: 0;
	padding: 0;
	position: relative;
	width: 0;
	height: 0;
}

.ctnhotelMap .hmBox {
	position: relative;
	width: 866px;
	height: 355px;
	overflow: hidden;
	margin: 30px 0;
	/* background: url(../../images/ko/jeju/inquires/hmBack.jpg) no-repeat; */
}

img {
	border: 0;
}
.popLayerHotelMap {
    width: 600px;
    left: 50%;
    top: 100px;
    margin: 0px 0 0 -300px;
    position: absolute;
}

.popLayer {
    position: absolute;
    background: #FFF;
    left: 10px;
    top: 100px;
    z-index: 1500;
    zoom: 1;
    box-shadow: 1px 1px 2px #555;
}
.popLayer .popHead {
    position: relative;
    height: 30px;
    zoom: 1;
    z-index: 10;
    background: #9b7f5b;
    border: #9b7f5b solid 5px;
}

.popLayer .popHead .tit {
    width: 70%;
    float: left;
    padding: 0px 0 0 25px;
    height: 27px;
    color: #ccc;
    font-weight: bold;
    font-size: 14px;
    text-align: left;
    overflow: hidden;
    line-height: 100px;
    overflow: hidden;
}
.popLayer .popHead .btn {
    float: right;
    padding: 6px 22px 0 0;
}
.popLayer .popCtn {
    padding: 25px 27px;
    background: #FFF;
    border: #9b7f5b solid 5px;
    border-top: none;
}
.popLayer .popHead .btn .btnClose {
    width: 19px;
    height: 19px;
    background: url(<%=request.getContextPath()%>/images/info/popLayerBtnClose.gif) no-repeat;
    text-indent: -9999%;
    overflow: hidden;
    display: block;
}
.contain{
	height: 1100px;
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
								<h2 class="tit">배치도</h2>
							</div>

							<!-- content start -->
							<br> <br>

							<div class="hmMainBox">
								<div class="clearfix">

									<img
										src="<%=request.getContextPath()%>/images/info/R0000000D2A3_KR.gif"
										alt="호텔지도">
									<div class="hidden">
										<div class="hidden">
											<p>글램핑 &amp; 캠핑</p>
										</div>
										<div class="hidden">
											<h5>West Wing</h5>
											<ul>
												<li class="first">객실 : 6~ 7층</li>
												<li>카지노: 5층</li>
												<li>객실 : 3~5층</li>
												<li>천지/히노데/더파크뷰: 3층</li>
												<li class="last">&nbsp; : 1~2층</li>
											</ul>
										</div>
										<div class="hidden">
											<h5>Main Building</h5>
											<ul>
												<li class="first">&nbsp; : 6~ 7층</li>
												<li>입구/ 로비/ 이컨시어지/ 바당/ 올래/ 패스트리 부티크: 5층</li>
												<li>&nbsp; : 2~5층</li>
												<li class="last">스파/ 피트니스 클럽/ 키즈클럽/ 실내 수영장; : 1층</li>
											</ul>
										</div>
										<div class="hidden">
											<h5>East Wing</h5>
											<ul>
												<li class="first">객실 : 6~ 7층</li>
												<li>아케이드/연회장(한라홀, 월라홀, 마라홀, 아라홀, 오라홀): 5층</li>
												<li>객실 : 3~5층</li>
												<li>연회장: 3층</li>
												<li class="last">로터스홀/로즈홀/릴리홀 : 1~2층</li>
											</ul>
										</div>
									</div>
								</div>
								<br> <br>
								<div class="hmBox">
									<img
										src="<%=request.getContextPath()%>/images/info/R0000000D29Z_KR.gif"
										alt="HotelMap 정보">

									<div class="hidden">
										<div class="hidden">
											<h5>west wing</h5>
											<p>객실 : 3~7층</p>
											<p>카지노</p>
											<p>Dining / Restaurant</p>
											<h5>main building</h5>
											<p>입구 / 로비 / 이컨시어지</p>
											<p>바당 / 올래 / 패스트리 부티크</p>
											<p>스파 / 피트니스 클럽 / 키즈클럽</p>
											<h5>East Wing</h5>
											<p>객실 : 3~7층</p>
											<h5>연회장</h5>
										</div>
										<div class="hidden">
											<ul>
												<li class="first">Halla hall</li>
												<li>Weolla room</li>
												<li>Mara room</li>
												<li>Ara room</li>
												<li class="last">Ora room</li>
											</ul>
											<ul>
												<li class="first">Lotus hall</li>
												<li>Rose room</li>
												<li class="last">Lily room</li>
											</ul>
										</div>
									</div>

									<div class="hmBtnBox">
										<div class="hidden">
											<h5>Floor Map Information</h5>
										</div>
										<div class="clearfix">
											<a href="#"
												onclick="openDivPopup('FloorPop1');  return false;"> <img
												alt="지상1층 Floor Map"
												src="<%=request.getContextPath()%>/images/info/R0000000D2HA_KR.gif">

											</a> <a href="#"
												onclick="openDivPopup('FloorPop2');  return false;"> <img
												alt="지상3층 Floor Map"
												src="<%=request.getContextPath()%>/images/info/R0000000D2HD_KR.gif">

											</a> <a href="#"
												onclick="openDivPopup('FloorPop3');  return false;"> <img
												alt="지상6층 Floor Map"
												src="<%=request.getContextPath()%>/images/info/R0000000D2HG_KR.gif">

											</a> <a href="#"
												onclick="openDivPopup('FloorPop4');  return false;"> <img
												alt="야외 시설 Map"
												src="<%=request.getContextPath()%>/images/info/R0000000D2HJ_KR.gif">

											</a>

										</div>


									</div>
								</div>
							</div>



						</div>
					</div>

					<div id="FloorPop1" style="display: none;">
						<div class="popLayer popLayerHotelMap" tabindex="-1"
							style="top: 367px; left: 558px;">
							<div class="popHead">
								<h2 class="tit">


									<img alt="지상1층 Floor Map"
										src="<%=request.getContextPath()%>/images/info/R0000000BOCS_KR.jpg">


								</h2>
								<div class="btn">
									<a class="btnClose" href="/jeju/inquires/hotelMap.do"
										onclick="closePopup('FloorPop1'); return false;"><span>닫기</span></a>
								</div>
							</div>
							<div class="popCtn">
								<div>


									<img alt="지상1층 Floor Map"
										src="<%=request.getContextPath()%>/images/info/R0000000BOCK_KR.jpg">


								</div>
							</div>
						</div>
						<div class="mdScreen" style="display: block; height: 1605px;"></div>
					</div>

					<div id="FloorPop2" style="display: none">
						<div class="popLayer popLayerHotelMap">
							<div class="popHead">
								<h2 class="tit">


									<img alt="지상3층 Floor Map"
										src="<%=request.getContextPath()%>/images/info/R0000000BOCU_KR.jpg">


								</h2>
								<div class="btn">
									<a class="btnClose" href="/jeju/inquires/hotelMap.do"
										onclick="closePopup('FloorPop2'); return false;"><span>닫기</span></a>
								</div>
							</div>
							<div class="popCtn normalPopCtn">
								<div>


									<img alt="지상3층 Floor Map"
										src="<%=request.getContextPath()%>/images/info/R0000000BOCM_KR.jpg">


								</div>
							</div>
						</div>
						<div class="mdScreen" style="display: block; height: 1605px;"></div>
					</div>

					<div id="FloorPop3" style="display: none">
						<div class="popLayer popLayerHotelMap">
							<div class="popHead">
								<h2 class="tit">


									<img alt="지상6층 Floor Map"
										src="<%=request.getContextPath()%>/images/info/R0000000BOCW_KR.jpg">


								</h2>
								<div class="btn">
									<a class="btnClose" href="/jeju/inquires/hotelMap.do"
										onclick="closePopup('FloorPop3'); return false;"><span>닫기</span></a>
								</div>
							</div>
							<div class="popCtn normalPopCtn">
								<div>


									<img alt="지상6층 Floor Map"
										src="<%=request.getContextPath()%>/images/info/R0000000BOCO_KR.jpg">


								</div>
							</div>
						</div>
						<div class="mdScreen" style="display: block; height: 1605px;"></div>
					</div>

					<div id="FloorPop4" style="display: none">
						<div class="popLayer popLayerHotelMap">
							<div class="popHead">
								<h2 class="tit">


									<img alt="야외 시설 Map"
										src="<%=request.getContextPath()%>/images/info/R0000000BOCY_KR.jpg">


								</h2>
								<div class="btn">
									<a class="btnClose" href="/jeju/inquires/hotelMap.do"
										onclick="closePopup('FloorPop4'); return false;"><span>닫기</span></a>
								</div>
							</div>
							<div class="popCtn normalPopCtn">
								<div>


									<img alt="야외 시설 Map"
										src="<%=request.getContextPath()%>/images/info/R0000000CJOZ_KR.jpg">


								</div>
							</div>
						</div>
						<div class="mdScreen" style="display: block; height: 1605px;"></div>
					</div>
				</div>

			</div>
		</div>
	</div>
<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</body>
</html>