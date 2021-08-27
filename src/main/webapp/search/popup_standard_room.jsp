<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>standard 도면</title>
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
<div id="hotelOutFmapPop" style="display: block;">
	<div class="popLayer popLayerHotelMap" tabindex="-1" style="top: 770px; left: 669px;">
		<div class="popHead">
			<h2 class="tit"><img src="<%=request.getContextPath()%>/images/accommodation/standard/StandardpopTitle.gif" alt="스탠다드 도면보기"></h2>
		</div>
		<div class="popCtn">
			<img alt="도면" src="<%=request.getContextPath()%>/images/accommodation/standard/R00000000N4F_KR.gif">
		</div>
	</div>
	<div class="mdScreen" style="display:block"></div>
</div>
</body>
</html>