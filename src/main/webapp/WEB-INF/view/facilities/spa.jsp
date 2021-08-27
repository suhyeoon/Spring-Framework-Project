<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/facilitiesSideMenu.css" rel="stylesheet"/>
<title>스파</title>
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
   /*  background: url(../images/locaton.gif) no-repeat 0 1px;*/
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
		<div class="contain">
		<div class="container">
			<c:import url="/WEB-INF/view/facilities/facilitiesSideMenu.jsp"></c:import>
			<div class="contents" id="contents">
				<div class="subWrap subWrapJeju">
					<div class="ctnRetreat">
						<div class="location">
							<p class="list">
								<span class="crPosit"><img src="${pageContext.request.contextPath}/images/locaton.gif"></span> &gt; 편의시설 &gt; <strong>스파</strong>
							</p>
						</div>
						<div class="headTit">
							<h4 class="tit">
								<img alt="스파"
									src="<%=request.getContextPath()%>/images/facilities/R0000000A7CJ_KR.jpg">
							</h4>
						</div>

						<div class="photoBox">
							<img alt="Spa 사진"
								src="<%=request.getContextPath()%>/images/facilities/spa_main.jpg" width="866" height="374">
						</div>

						<div class="sdTxt">
							<div class="hidden">
								<h3>프랑스 명품 코스메틱의 기술과 호텔의 품격이 만나 최고의 서비스를 제공하는 데스티네이션 스파</h3>
								<p>185년 전통의 파리 겔랑 본사 노하우를 전수받은 10여명의 전문 스파 전문가들이 고객의 취향과 심신
									상태를 고려하여 최적화된 고객 맞춤형 프로그램을 추천, 진정한 휴식을 제공하는 지상 최고의 서비스를 제공합니다.</p>
								<p>아름다운 자연의 정취를 느낄 수 있는 제주도에 위치한 겔랑 스파는 8개의 트리트먼트 룸과 11개의 풋
									바스 라운지, 하이드로 테라피 룸 등의 시설을 갖추어 최고의 휴식을 제공하며 테라피와 뷰티를 동시에 해결해
									드립니다.</p>

								<img alt="표"
									src="<%=request.getContextPath()%>/images/facilities/spa_table.png">
								<p>&nbsp;</p>
							</div>
						</div>

						<div class="box box1">
							<div class="hidden">
								<h4>맞춤형 관리</h4>
								<p>효과적인 노하우와 미적 기술의 완벽한 조합을 갖춘 뷰티 전문가들은 고객 개개인의 아름다움을 위해
									체계적인 분석과 정확한 피부 진단으로 시작합니다. 고객의 필요와 기대에 맞춰드리는 최고의 미적 기술과 최대의
									효율성을 제공하고 있습니다.</p>
								<p>&nbsp;</p>
								<h4>겔랑 스파만의 스페셜 명품 서비스</h4>
								<ul>
									<li class="first">겔랑 전통의 조향사가 만들어 내는 겔랑 명품 향수를 이용한 향기 서비스</li>
									<li>겔랑의 노하우를 가진 전문 뷰티션의 고객 상담 및 고객 처방 프로그램에 의한 맞춤 서비스</li>
									<li class="last">명품 차와 함께 풋 바스 라운지에서의 15분간 풋 케어 서비스</li>
								</ul>
							</div>
						</div>

					</div>
					<div class="box box2">
						<h5 class="tit">&nbsp;</h5>
						<div class="photo">
							<h4>TREATMENT ROOM</h4>
							<p>
								<span class="img"> <img alt="Guerlain Spa 외부 사진"
									src="<%=request.getContextPath()%>/images/facilities/spa_external.jpg">
								</span> <span class="img"> <img alt="Guerlain Spa 내부 사진"
									src="<%=request.getContextPath()%>/images/facilities/spa_internal.jpg">
								</span>
							</p>
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