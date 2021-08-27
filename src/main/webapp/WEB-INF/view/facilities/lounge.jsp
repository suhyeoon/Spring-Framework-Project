<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/facilitiesSideMenu.css" rel="stylesheet"/>
<title>라운지</title>
</head>
<style type="text/css">
th {
	background: #f1e3c4;
	border-bottom: 1px solid #ffffff;
	border-right: 1px solid black;
	width: 150px;
	height: 40px;
}

td {
	text-indent: 30px;
}

.contents .location .list {
    display: block;
    font-size: 11px;
    /* background: url(../images/locaton.gif) no-repeat 0 1px; */
    line-height: 12px;
    margin: 0 0 0 0;
}
.location {
	text-align: right;
	font: 12px/160% Dotum,'돋움',sans-serif;
    color: #101010;
}
.lnbArea .lnbMenu>.tit {
	margin: 0 0 29px 0;
	height: 53px;
	display: block;
	text-indent: -9999%;
	overflow: hidden;
}

.lnbMenu {
	float: left;
	width: 216px;
	border: #ede5d8 solid 1px;
	background: #f1e3c4;
	padding: 23px;
	margin: 0 0 30px 0;
}

h2 {
	margin: 0 0 0 0;
}

.contents .headTit {
    position: relative;
    padding: 0px;
    margin: 0 0 0px 0;
    z-index: 8;
    height: 47px;
    border-bottom: #432c10 solid 5px;
    width: 866px;
}

.tit {
    margin-top: 0px;
    margin-bottom: 0px;
}
</style>
<body>
	<c:import url="/WEB-INF/common/top.jsp"></c:import>
	<c:import url="/WEB-INF/common/menu.jsp"></c:import>
	<div class="contain">
		<div class="container">
		<c:import url="/WEB-INF/view/facilities/facilitiesSideMenu.jsp"></c:import>
			<div class="contents" id="contents">
				<div class="subWrap subWrapJeju">
					<div class="ctnRetreat">
						<div class="location">
							<p class="list">
								<span class="crPosit"><img src="${pageContext.request.contextPath}/images/locaton.gif"></span> &gt; 편의시설 &gt; <strong>라운지</strong>
							</p>
						</div>
						<div class="headTit">
							<h4 class="tit">
								<img alt="라운지"
									src="<%=request.getContextPath()%>/images/facilities/R0000000A7BR_KR.jpg">
							</h4>
						</div>
						
						<div class="photoBox">
							<img alt="라운지 사진" src="<%=request.getContextPath()%>/images/facilities/lounge_main.jpg"
								width="866" height="374">
						</div>

						<div class="sdTxt">
							<div class="hidden">
								<h3>BOOK & TEA와 함께 여유로운 휴식</h3>
								<p>라이브러리 콘셉트의 프라이빗 공간 'Lounge'는 여행 그 안에서의 쉼을 선사합니다.</p>
								<p>천 여권의 시집과 다양한 장르의 도서를 비치하고 있으며 프리미엄 티와 함께 여유로운 시간을 선사합니다.</p>
							</div>
						</div>
						<div>
							<img alt="라운지 설명" src="<%=request.getContextPath()%>/images/facilities/business_text.png">
						</div>
						<p>&nbsp;</p>
						<div class="box1">
							<h3>라운지 서비스</h3>
							<h4>All Day Tea & Snack Service</h4>
							<div class="photo">
								<img alt="라운지서비스 사진" src="<%=request.getContextPath()%>/images/facilities/loungeservice.jpg">
							</div> 
						<div class="photo">&nbsp;</div> 
						<div class="txt">
							<img alt="라운지서비스 설명" src="<%=request.getContextPath()%>/images/facilities/loungesTxt1.gif"> 
							<p>&nbsp;</p>
							<p>&nbsp;</p>
							<p>&nbsp;</p>
						</div>
						</div>
					</div>
					</div>
				</div>
			</div>
		</div>
	<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</body>
</html>