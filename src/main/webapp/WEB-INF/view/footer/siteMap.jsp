<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.0.min.js"></script>

<title>사이트 맵</title>
<style type="text/css">
#contain{
	height:600px;
	
}
#wrap {
    position: relative;
    padding: 0px;
    margin: 50px auto 0 auto;
    z-index: 8;
    height: 47px;
    border-bottom: #432c10 solid 5px;
    width: 866px;
}
#topForm {
	text-align: right;
	relative;
    padding: 0px;
    margin: 0 0 0px 0;
    z-index: 8;
    height: 47px;
    border-bottom: #432c10 solid 5px;
    width: 866px;
}
h5{
    font-size: 100%;
    font-weight: normal;
    margin: 0;
    padding: 0;
}
.siteMap .smBox h4 {
	margin : 10px 0 15px 0;
    padding: 5px 0 5px 15px;
    height: 33px;
    border-bottom: 2px solid #b79d86;
}
.siteMap .smBox .smBoxin h5 {
    font-weight: bold;
    font-family: dotum;
    font-size: 12px;
    margin-bottom: 5px;
    line-height: 100%;
    font: 12px/160% Dotum,'돋움',sans-serif;
    color: #101010;
    padding: 0;
}
.siteMap .smBox .smBoxin h5 a{
    font-weight: bold;
    color: #633e10;
    font-family: dotum;
    font-size: 12px;
    margin-bottom: 10px;
}
.siteMap .smBox {
    width: 176px;
    float: left;
    border-top: 1px solid #f4eee3;
    margin-right: 20px;
    margin-left: 20px;
    padding-bottom: 30px;
}

#topForm {
    margin-bottom: 30px;
}
.siteMap .smBox .smBoxin {
	text-align : left;
    padding: 5px 0 0 15px;
}
a:link {
	color: black;
	text-decoration: none;
}
	</style>


</head>
<body>

<c:import url="/WEB-INF/common/top.jsp"></c:import>
<c:import url="/WEB-INF/common/menu.jsp"></c:import>

<div id="contain">
<div id ="wrap">
<div id="topForm">
	<h2 align="left">사이트 맵</h2>
</div>
<div class = "siteMap">
	<div class = "smBox">
		<h4>소개</h4>	
	<div class = "smBoxin">
	<h5>
		<a href = "${pageContext.request.contextPath}/info/info?check=info">리조트소개</a>
	</h5>
	<h5>
		<a href = "${pageContext.request.contextPath}/info/map?check=map">오시는 길</a>
	</h5>
	<h5>
		<a href = "${pageContext.request.contextPath}/info/blockPlan?check=blockPlan">리조트 배치도</a>
	</h5>
	<h5>
		<a href = "${pageContext.request.contextPath}/info/tour?check=tour">주변관광지 소개</a>
	</h5>
	</div>
	</div>
	<div class = "smBox">
		<h4 align="left">객실</h4>	
	<div class = "smBoxin">
	<h5>
		<a href = "${pageContext.request.contextPath}/room/standard/standard?check=standard">스탠다드</a>
	</h5>
	<h5>
		<a href = "${pageContext.request.contextPath}/room/premier/premier?check=premier">프리미어</a>
	</h5>
	<h5>
		<a href = "${pageContext.request.contextPath}/room/suite/norSuite?check=norSuite">스위트</a>
	</h5>
	</div>
	</div>
	<div class = "smBox">
		<h4 align="left">서비스</h4>	
	<div class = "smBoxin">
	<h5>
		<a href = "${pageContext.request.contextPath}/reservationStep01">예약</a>
	</h5>
	</div>
	</div>
	<div class = "smBox">
		<h4 align="left">커뮤니티</h4>	
	<div class = "smBoxin">
	<h5>
		<a href = "${pageContext.request.contextPath}/review/list">후기</a>
	</h5>
	<h5>
		<a href = "${pageContext.request.contextPath}/suggest/list">건의사항</a>
	</h5>
	<h5>
		<a href = "${pageContext.request.contextPath}/qna/list">QnA</a>
	</h5>
	<h5>
		<a href = "${pageContext.request.contextPath}/notice/list">공지사항</a>
	</h5>
	<h5>
		<a href = "${pageContext.request.contextPath}/event/list">이벤트</a>
	</h5>
	</div>
	</div>
	<div class = "smBox">
		<h4 align="left">휴식시설</h4>	
	<div class = "smBoxin">
	<h5>
		<a href = "${pageContext.request.contextPath}/spa?check=spa">스파</a>
	</h5>
	<h5>
		<a href = "${pageContext.request.contextPath}/lounge?check=lounge">라운지</a>
	</h5>
	<h5>
		<a href = "${pageContext.request.contextPath}/gallery?check=gallery">럭셔리갤러리</a>
	</h5>
	<h5>
		<a href = "${pageContext.request.contextPath}/business?check=business">비지니스센터</a>
	</h5>
	</div>
	</div>
	<div class = "smBox">
		<h4 align="left">액티비티</h4>	
	<div class = "smBoxin">
	<h5>
		<a href = "${pageContext.request.contextPath}/activity/camp?check=camp">글램핑&캠핑</a>
	</h5>
	<h5>
		<a href = "${pageContext.request.contextPath}/activity/fitness?check=fitness">피트니스</a>
	</h5>
	<h5>
		<a href = "${pageContext.request.contextPath}/activity/winebar?check=winebar">와인파티</a>
	</h5>
	<h5>
		<a href = "${pageContext.request.contextPath}/activity/gamezone?check=gamezone">게임존</a>
	</h5>
	</div>
	</div> 
</div>

</div>
</div>


<c:import url="/WEB-INF/common/footer.jsp"></c:import>

</body>
</html>