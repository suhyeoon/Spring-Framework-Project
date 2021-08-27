<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/facilitiesSideMenu.css" rel="stylesheet"/>
<title>비지니스 센터</title>
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
    background: url(../images/locaton.gif) no-repeat 0 1px;
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
	<div class="contain" style="height: 900px;">
		<div class="container">
			<c:import url="/WEB-INF/view/facilities/facilitiesSideMenu.jsp"></c:import>
			<div class="contents" id="contents">
				<div class="subWrap subWrapJeju">
					<div class="ctnRetreat">
						<div class="location">
							<p class="list">
								<span class="crPosit"><img src="${pageContext.request.contextPath}/images/locaton.gif"></span> &gt; 편의시설 &gt; <strong>비지니스 센터</strong>
							</p>
						</div>
						<div class="headTit">
							<h4 class="tit">
								<img alt="비지니스센터"
									src="<%=request.getContextPath()%>/images/facilities/subTitBizCenter.gif">
							</h4>
						</div>

						<div class="photoBox">
							<img alt="비지니스센터 사진" src="<%=request.getContextPath()%>/images/facilities/businesscenter.jpg"
								width="866" height="374">
						</div>

						<div class="sdTxt">
							<div class="hidden">
								<h3>메일과 인터넷 연락이 필요하다면, 6층의 비지니스 센터를 찾아주세요</h3>
								<p>라운지 내에 있는 컴퓨터, 복사기, 팩스, 프린터는 24시간 자유롭게 이용하실 수 있습니다.</p>
								
								<p>또한 오전 7:00부터 22:00까지 운영되는 컨시어지 라운지에서는 
									호텔 내외 각종 예약과 제주여행에 즐거움을 더할 수 있는 정보안내를 받으실 수 있습니다.</p>
								<p>(일부 서비스 이용 시 비용이 청구됩니다.)</p>	
								
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