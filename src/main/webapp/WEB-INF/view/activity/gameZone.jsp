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
<title>피트니스</title>
<script type="text/javascript">
function openCtrlPopup(){
	window.open("../search/popup_pla.jsp","popup_pla",
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

.contain{
	padding:0;
	height: 1100px;
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
</head>
<body>
	<c:import url="/WEB-INF/common/top.jsp"></c:import>
	<c:import url="/WEB-INF/common/menu.jsp"></c:import>

<div class="contain">
		<div class="container">
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
		<p class="list"><span class="crPosit">현재 페이지 위치 : </span> &gt; 액티비티 &gt; <strong>게임존</strong></p>
	</div>
	
	
					<div class="headTit">
						<h4 class="tit">

<img alt="게임존 실내" src="${pageContext.request.contextPath}/images/contents/activ/PLA/R00000009UX2_KR.gif">

</h4>
					</div>

					<div class="topPhotoBox">
						

<img alt="게임존 사진 1" src="${pageContext.request.contextPath}/images/contents/activ/PLA/R00000009E6V_KR.jpg">


					</div>

					<div class="btmCon">
						<div class="leftArea_r">
							<div class="topTxtwrap">
								<div class="topTxt">									

<img src="${pageContext.request.contextPath}/images/contents/activ/PLA/R0000000D0W7_KR.jpg" alt="실내 체육관(하단 내용 참조)">

									<div class="topTxtA mgt40">										

<img src="${pageContext.request.contextPath}/images/contents/activ/PLA/R0000000D0WB_KR.jpg" alt="운영시간 및 기타(하단 내용 참조)">
										<div class="rightArea">
											<ul class="btnSet actBtnR mgb50">
												<li class="first last"><a href="/jeju/activities/gym.do" onclick="openCtrlPopup();  return false;"><img src="${pageContext.request.contextPath}/images/ko/jeju/activities/btnFloorMap.gif"
												 alt="Floor Map"></a></li>
											</ul>
										</div>
									</div>
								</div>
	
								<h5 class="mgb10"><img src="${pageContext.request.contextPath}/images/ko/jeju/activities/subTitPlaystIntroB.gif" alt="주요시설"></h5>
								<div class="fiTsSwrap">
									<div class="pic">
										<span class="Mr18">
<table class="tableTypeD newSt" summary="PS3 Zone, PS2 Zone, PSP Zone"> 
<caption>시설현황</caption> 
<colgroup> 
<col class="col1"> 
<col width="33%" class="col2"> 
<col width="33%" class="col3"> 
</colgroup> 
<thead> 
<tr> 
<th class="first pe_qK" scope="col">PS3 Zone</th> 
<th class="pe_qK" scope="col">PS2 Zone</th> 
<th class="last pe_qK" scope="col">PSP Zone</th> 
</tr> 
</thead> 
<tbody> 
<tr class="first last"> 
<td class="first" style="margin-bottom: 15px"><br>Play Station3<br> PS3 모니터 3대</td> 
<td style="margin-bottom: 15px"><br>Play Station2 <br>PS2 모니터 7대</td> 
<td class="last" style="margin-bottom: 15px"><br>Play Station Portable<br> PSP 시연대</td> 
</tr> 
</tbody> 
</table>
</span>
									</div>
									<div class="topTxt">
										


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
										

<img alt="게임방위치 도면" src="${pageContext.request.contextPath}/images/contents/activ/PLA/R0000000AAQ8_KR.jpg">


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