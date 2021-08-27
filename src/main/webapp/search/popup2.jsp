<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body{
	width: 450px;
	height: 400px;
	margin: 0;
	padding: 0;
}
</style>
<title>캠프 맵</title>
<!--
	팝업닫기,,
 <script>
	function closePopup(){
		self.close();
	}
</script> 

-->
</head>
<body onresize="parent.resizeTo(500,550)" onload="parent.resizeTo(500,550)">
<div id="hotelOutFmapPop" style="display: block;"><div class="popLayer popLayerHotelMap" tabindex="-1" style="top: 770px; left: 669px;">
	<div class="popHead">
		<h2 class="tit"><img src="<%=request.getContextPath()%>/images/ko/jeju/activities/hmOutMapTit.jpg" alt="야외 시설 Map"></h2>
		<div class="btn"><a class="btnClose" href="" onclick="closePopup(); return false;"></a></div>
	</div>
	<div class="popCtn">
		

<img alt="야외 시설 Floor Map" src="<%=request.getContextPath()%>/images/contents/activ/GYM/R0000000AANI_KR.jpg">


	</div>
</div>
<div class="mdScreen" style="display:block"></div></div>
</body>
</html>