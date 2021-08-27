<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Drinks Menu</title>
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
<div class="popLayer popLayerActDrink" tabindex="-1" style="top: 900px; left: 600px;"> 
<div class="popHead"> 
<h2 class="tit"><img alt="음료 &amp; 주류" src="<%=request.getContextPath()%>/images/ko/jeju/activities/ActDrinkpopTitle.gif"></h2> 
<div class="btn"><a class="btnClose" onclick="closePopup('actDrinkPop');  return false;" href="${REQ_URI}"></a></div></div> 
<div class="popCtn"> 
<div class="headTit"> 
<h4 class="tit">음료 &amp; 주류 리스트</h4></div> 
<div class="allWrap"> 
<div class="leftCon"> 
<h5><img alt="Beer" src="<%=request.getContextPath()%>/images/ko/jeju/activities/actTxtbeer.png"></h5> 
<ul> 
<li class="first"> 
<p><strong>아사히 생맥주, 기네스 생맥주, 호가든 생맥주</strong></p> 
<p>Asahi Draft Beer, Guinness Draft Beer, Hoegaarden Draft Beer</p> 
<p>16,000원</p></li> 
<li> 
<p><strong>클라우드</strong></p> 
<p>Kloud 355ml(Can)</p> 
<p>12,000원</p></li> 
<li> 
<p><strong>칭따오</strong></p> 
<p>Tsingtao 330ml(Can)</p> 
<p>13,000원</p></li> 
<li> 
<p><strong>하이네켄</strong></p> 
<p>Heineken Club Bottle 330ml(Can)</p> 
<p>14,000원</p></li> 
<li class="last"> 
<p><strong>화요소주(375ml/17%) </strong></p> 
<p>Hwayo Soju</p> 
<p>35,000원</p></li> 
</ul></div> 
<div class="rightCon"><!--<div> <h5><img alt="Drink" src="../../../images/ko/jeju/activities/actTxtDrink.gif"></h5> <ul> <li> <p><strong>아사히 생맥주(340ml)</strong></p> <p>Asahi Draft Beer</p> <p>16,000원</p> </li> <li> <p><strong>기네스 생맥주(340ml)</strong></p> <p>Guinness Draft Beer</p> <p>16,000원</p> </li> <li> </li> </ul> </div> --> 
<div> 
<h5><img alt="Soju" src="<%=request.getContextPath()%>/images/ko/jeju/activities/actTxtSoju.png"></h5> 
<ul> 
<li class="first last"> 
<p><strong>콜라 / 사이다</strong></p> 
<p>Coke / Cider</p> 
<p>5,000원</p></li> 
</ul></div></div></div></div> 
<div class="btnAcc"><a class="btnClose" onclick="closePopup();  return false;" href="${REQ_URI}"></a></div></div>
</body>
</html>