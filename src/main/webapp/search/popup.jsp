<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!--
	팝업닫기,,
 <script>
	function closePopup(){
		self.close();
	}
</script> 

-->
</head>
<body>
<div id="hotelOutFmapPop" style="display: block;"><div class="popLayer popLayerHotelMap" tabindex="-1" style="top: 770px; left: 669px;">
	<div class="popHead">
		<h2 class="tit"><img src="<%=request.getContextPath()%>/images/ko/jeju/activities/btnFloorMap.gif" alt="야외 시설 Map"></h2>
		<div class="btn"><a class="btnClose" href="" onclick="closePopup(); return false;"></a></div>
	</div>
	<div class="popCtn">
		

<img alt="야외 시설 Floor Map" src="<%=request.getContextPath()%>/images/contents/activ/GCV/R00000009CMW_KR.jpg">


	</div>
</div>
<div class="mdScreen" style="display:block"></div></div>
</body>
</html>