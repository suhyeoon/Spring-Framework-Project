<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/facilitiesSideMenu.css" rel="stylesheet"/>
<title>럭셔리 갤러리</title>
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
    /* background: url(../../images/ko/jeju/main/locaton.gif) no-repeat 0 1px; */
    line-height: 12px;
    margin: 0 0 0 0;
}
.location {
	text-align: right;
	font: 12px/160% Dotum,'돋움',sans-serif;
    color: #101010;
}

.lnbArea .ln	bMenu>.tit {
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
	<div class="contain" style="height:900px;">
		<div class="container">
			<c:import url="/WEB-INF/view/facilities/facilitiesSideMenu.jsp"></c:import>
			<div class="contents" id="contents">
				<div class="subWrap subWrapJeju">
					<div class="ctnRetreat">
						<div class="location">
							<p class="list">
								<span class="crPosit"><img src="${pageContext.request.contextPath}/images/locaton.gif"></span> &gt; 편의시설 &gt; <strong>럭셔리 갤러리</strong>
							</p>
						</div>
						<div class="headTit">
							<h4 class="tit">
								<img alt="럭셔리 갤러리"
									src="<%=request.getContextPath()%>/images/facilities/gallery_title.png">
							</h4>
						</div>

						<div class="photoBox">
							<img alt="비지니스센터 사진" src="<%=request.getContextPath()%>/images/facilities/luxury.jpg"
								width="866" height="374">
						</div>

						<div class="sdTxt">
							<div class="hidden">
								<h3>중앙리조트에서 만나는 면세점식 명품쇼핑 특구 - 럭셔리 갤러리</h3>
								<p>구찌, 버버리, 지방시 등 20여개의 명품 브랜드를 합리적으로 만나보실 수 있는 쇼핑공간으로,
									해외 바이어들이 셀렉한 신상품을 5% ~ 20% 항시 할인 받으실 수 있습니다.</p>
								<p>&nbsp;</p>
							</div>
						</div>
						<div>
							<img alt="비지니스센터 설명" src="<%=request.getContextPath()%>/images/facilities/business_text.png">
							<p>&nbsp;</p>
							<p>&nbsp;</p>
							<p>&nbsp;</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</body>
</html>