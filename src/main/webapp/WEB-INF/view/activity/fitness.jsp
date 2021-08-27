<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/activities.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/accommodation.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/jquery.ad-gallery.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/inquires.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/activitySideMenu.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/css/activity/main.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/activity/base.css" rel="stylesheet" type="text/css">
<style type="text/css">
.contain{
	height:1200px;
}
.contents{
	margin-left:35px;
}
.contents .location .list strong {
    color: black;
    font-weight: bold;
    text-decoration: none;
}
</style>
<title>피트니스</title>
<script type="text/javascript">
function openCtrlPopup(){
	var windowW = 600;  // 창의 가로 길이
    var windowH = 900;  // 창의 세로 길이
	
	var left = Math.ceil((window.screen.width - windowW)/2);
    var top = Math.ceil((window.screen.height - windowH)/2);
	window.open("../search/popup2.jsp","popup2",
			"top="+top+",left="+left+
	"width=450,height=400,resizable=no,scrollbars=yes")
}


</script>
<style type="text/css">
th {
	background: white;
	border-bottom: 1px solid #ffffff;
	border-right: 1px solid black;
	width: 150px;
	height: 40px;
}

td {
	text-indent: 30px;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/common/top.jsp"></c:import>
	<c:import url="/WEB-INF/common/menu.jsp"></c:import>

<div class="contain">
		<div class="container" style="padding:0;">
			<c:import url="/WEB-INF/view/activity/activitySideMenu.jsp"></c:import>
			<div class="contents" id="contents">

				<script>
					$(document).ready(
							function() {
								$(".gnbMenu .m4 .s1>a").addClass("on").parent()
										.parent().parent().children("a")
										.addClass("on").next().show();
								$(".lnbMenu .menu .m1 .s1>a").addClass("on");
							});
				</script>
	
		
			<div class="contents" id="contents">
				



<script>
$(document).ready(function() { 
	$(".gnbMenu .m4 .s4>a").addClass("on").parent().parent().parent().children("a").addClass("on").next().show();
	$(".lnbMenu .menu .m4 .s2>a").addClass("on");
}); 


function popLayerShow(areaId, classId){
	var area = $("#"+areaId);
	if(classId == null) classId= "popLayer";
	
	var sTop = $(document).scrollTop();
	var sLef = $(document).scrollLeft();
	
	var widthHalf = area.find("."+classId).width()/2;
	area.find("."+classId).css("top" , sTop+70<200 ? 200 : sTop+70);
	var diff = parseInt($(window).width()/2 - widthHalf);
	
	var _left = parseInt(($(window).width()/2) - widthHalf);
	
	area.find("."+classId).css("left",sLef + widthHalf + (diff<15 ? 15 : diff) );
	
	if(areaId == "actDrinkPop") {
		area.find("."+classId).css("left",sLef + (_left * 2));
	}
	
	area.show();
	area.find("."+classId).attr("tabindex",-1).focus();
	$(document).scrollTop(sTop);
	$(document).scrollLeft(sLef);
}
</script>
				<div class="ctnActivities">
					
	<div class="location">
		<p class="list"><span class="crPosit">현재 페이지 위치 : </span> &gt; 액티비티 &gt; <strong>피트니스</strong></p>
	</div>
	
	
					<div class="headTit">
						<h4 class="tit">

<img alt="실내 체육관" src="${pageContext.request.contextPath}/images/contents/activ/GYM/R00000009UOT_KR.gif">

</h4>
					</div>

					<div class="topPhotoBox">
						

<img alt="실내 체육관 사진 1" src="${pageContext.request.contextPath}/images/contents/activ/GYM/R0000000BCVT_KR.jpg">


					</div>

					<div class="btmCon">
						<div class="leftArea_r">
							<div class="topTxtwrap">
								<div class="topTxt">
									

<img src="${pageContext.request.contextPath}/images/contents/activ/GYM/R0000000BCVQ_KR.jpg" alt="실내 체육관(하단 내용 참조)">
<div class="hidden">
	<h3>인체공학적 설계로 운동기구의 명품으로 인정받은 Star Trac 제품으로 구성, 체성분 측정, 체력 측정을 통해 과학적인 피트니스 프로그램으로 몸과 마음에 활기를 되찾아 드립니다.</h3><dl><dt>문의전화</dt><dd>064-735-5130</dd></dl>
</div>
									<div class="topTxtA mgt40">
										

<img src="${pageContext.request.contextPath}/images/contents/activ/GYM/R0000000D319_KR.jpg" alt="운영시간 및 기타(하단 내용 참조)">
<div class="hidden">
	<dl><dt>운영시간</dt><dd>06:30 ~ 24:00</dd></dl> 
<p>※ 17세 이상 이용이 가능합니다.</p> 
<p>※ 체크 아웃 당일에는 15시까지 이용 가능하며, 이용을 원하실 경우 13시 전에 입장하여 주시기 바랍니다.</p>
</div>
										<div class="rightArea">
											<ul class="btnSet actBtnR mgb50">
												<li class="first last"><a href="/jeju/activities/gym.do" onclick="openCtrlPopup();  return false;"><img src="${pageContext.request.contextPath}/images/ko/jeju/activities/btnFloorMap.gif"
												 alt="Floor Map"></a></li>
											</ul>
										</div>
									</div>
								</div>
	
								<h5 class="mgb10"><img src="${pageContext.request.contextPath}/images/ko/jeju/activities/subTitFitsGymA.gif" alt="주요시설"></h5>
								<div class="fiTsSwrap">
									<div class="pic">
										<span class="Mr18">

<img alt="실내체육관 사진 2" src="${pageContext.request.contextPath}/images/contents/activ/GYM/R00000009LS5_KR.jpg">

</span>
										

<img alt="실내체육관 사진 3" src="${pageContext.request.contextPath}/images/contents/activ/GYM/R00000009LS7_KR.jpg">


									</div>
									<div class="topTxt">
										

<img src="${pageContext.request.contextPath}/images/contents/activ/GYM/R0000000BCVM_KR.jpg" alt="Treadmill, Total Body Trainer, Bike, Weight Training, Free Weight Training">
<div class="hidden">
	<p>Treadmill, Total Body Trainer, Bike, Weight Training, Free Weight Training</p>
</div>
									</div>
								</div>
	
							</div>
	
						 </div>
	
					</div>
					<!-- POPUP Layer : actFloorMapPop_KR-->
					<div id="actFloorMapPop" style="display:none">
						<div class="popLayer popLayerActFloorMap">
							<div class="popHead">
								<h2 class="tit">
									<img src="${pageContext.request.contextPath}/images/ko/jeju/activities/floorMapTitle.gif" alt="Floor Map">
								</h2>
								<div class="btn"><a class="btnClose" href="/jeju/activities/gym.do" onclick="closePopup('actFloorMapPop');  return false;"><span>닫기</span></a></div>
							</div>
							<div class="popCtn">
								<div class="popWrap">
									<div>
										

<img alt="1층 도면" src="${pageContext.request.contextPath}/images/contents/activ/GYM/R0000000AANI_KR.jpg">


									</div>
								</div>
							</div>
						</div>
						<div class="mdScreen" style="display: block; height: 1671px;"></div>
					</div>
				</div>
			</div>
		</div>	
	</div>
</div>

<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</body>
</html>