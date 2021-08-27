<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/room/main.css" rel="stylesheet"type="text/css">
<link href="<%=request.getContextPath()%>/css/room/base.css" rel="stylesheet"type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/standard/accommodation.css"rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/roomSideMenu.css" rel="stylesheet"/>

<title>All Rooms</title>

</head>
<style type="text/css">
th img{
	float: none;
}
th {
	background: white;
	border-bottom: 1px solid #ffffff;
	border-right: 1px solid black;
	width: 150px;
	height: 40px;
	text-align: center;
}

.contents .location .list {
	display: block;
	font-size: 11px;
	background: url(../images/locaton.gif) no-repeat 0 1px;
	line-height: 12px;
}

.location {
	text-align: right;
	font: 12px/160% Dotum, '돋움', sans-serif;
	color: #101010;
}

</style>

<body>
	<center>
		<c:import url="/WEB-INF/common/top.jsp"></c:import>
		<c:import url="/WEB-INF/common/menu.jsp"></c:import>
				<div class="demo" style="height:800px;">
					<c:import url="/WEB-INF/view/room/roomSideMenu.jsp"></c:import>
					<!-- 본문 -->
					<div class="contents" id="contents">
				
<script>
$(document).ready(function() { 
	
	$(".gnbMenu .m2 .s4>a").addClass("on").parent().parent().parent().children("a").addClass("on").next().show();
}); 
</script>

				<div class="ctnAcmd ctnallRooms">
					
	<div class="location">
		<p class="list"><span class="crPosit">현재 페이지 위치 : </span> &gt; 객실 &gt; 전체 객실 보기 &gt; <strong>전체 객실 보기</strong></p>
	</div>
	
	
										
					<div class="headTit">
						<h4 class="tit">

<img alt="전체 객실 보기" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/R00000009U3D_KR.gif">

</h4>
					</div>
					
					<div class="keepArea">
						

<div class="keepArea">
	<a id="printBtn" href="/jeju/accommodation/allRoom.do" onclick="window.print();  return false;" class="print">인쇄하기</a>
</div>

	<!-- 이메일 보내기 -->		
<div id="email" style="display:none"></div>
					</div>

					<table class="tableTypeC tableAllRooms" summary="Standard의 각 객실별 객실 수, 크기,View,Bed로 구성된 테이블입니다."> 
<caption>Standard의 각 객실의 객실정보 소개</caption> 
<colgroup> 
<col width="20%" class="col1"> 
<col width="20%" class="col2"> 
<col width="20%" class="col3"> 
<col width="20%" class="col4"> 
<col width="*" class="col5"> 
</colgroup> 
<thead> 
<tr class="first"> 
<th class="bdL pe_qK" scope="col" align="center"><img alt="Standard" align="center" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/tandardTbTita.gif"></th> 
<th class="pe_qK" scope="col"><img alt="객실 수" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/allRoomsTbTitb.gif"></th> 
<th class="pe_qK" scope="col"><img alt="크기" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/allRoomsTbTitd.gif"></th> 
<th class="pe_qK" scope="col"><img alt="View" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/allRoomsTbTite.gif"></th> 
<th class="pe_qK" scope="col"><img alt="Bed" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/allRoomsTbTitf.gif"></th> 
</tr> 
</thead> 
<tbody> 
<tr> 
<th class="pe_qK" scope="row"><img alt="Standard" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/TbTitsa.gif"></th> 
<td>더블 - 74, 트윈 - 52</td> 
<td>39㎡</td> 
<td>산&nbsp;또는&nbsp;정원</td> 
<td>더블, 트윈</td> 
</tr> 
<tr> 
<th class="pe_qK" scope="row"><img alt="Deluxe" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/TbTitsb.gif"></th> 
<td>더블 - 58, 트윈 - 76</td> 
<td>39㎡</td> 
<td>산&nbsp;또는&nbsp;바다</td> 
<td>더블, 트윈</td> 
</tr> 
<tr> 
<th class="pe_qK" scope="row"><img alt="Terrace" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/TbTitse.gif"></th> 
<td>더블 - 26, 트윈 - 25</td> 
<td>39㎡</td> 
<td>정원</td> 
<td>더블, 더블+싱글</td> 
</tr> 
</tbody> 
</table> 
<table class="tableTypeC tableAllRooms" summary="Premier의 각 객실별 객실수 크기,View,Bed로 구성된 테이블입니다."> 
<caption>Premier의 각 객실의 객실정보 소개</caption> 
<colgroup> 
<col width="20%" class="col1"> 
<col width="20%" class="col2"> 
<col width="20%" class="col3"> 
<col width="20%" class="col4"> 
<col width="*" class="col5"> 
</colgroup> 
<thead> 
<tr class="first"> 
<th class="bdL pe_qK" scope="col"><img alt="Premier" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/tandardTbTitb.gif"></th> 
<th class="pe_qK" scope="col"><img alt="객실 수" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/allRoomsTbTitb.gif"></th> 
<th class="pe_qK" scope="col"><img alt="크기" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/allRoomsTbTitd.gif"></th> 
<th class="pe_qK" scope="col"><img alt="View" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/allRoomsTbTite.gif"></th> 
<th class="pe_qK" scope="col"><img alt="Bed" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/allRoomsTbTitf.gif"></th> 
</tr> 
</thead> 
<tbody> 
<tr> 
<th class="pe_qK" scope="row"><img alt="Premier" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/TbTitsg.gif"></th> 
<td>더블 - 44, 트윈 - 19</td> 
<td>46㎡</td> 
<td>산&nbsp;또는&nbsp;바다</td> 
<td>더블, 트윈</td> 
</tr> 
<tr> 
<th class="pe_qK" scope="row"><img alt="Premier Terrace" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/TbTitsi.gif"></th> 
<td>더블 - 17</td> 
<td>46㎡</td> 
<td>정원</td> 
<td>더블</td> 
</tr> 
</tbody> 
</table> 
<table class="tableTypeC tableAllRooms mgt10" summary="Suite의 각 객실별 객실수, 크기,View,Bed로 구성된 테이블입니다."> 
<caption>Suite의 각 객실의 객실정보 소개</caption> 
<colgroup> 
<col width="20%" class="col1"> 
<col width="20%" class="col2"> 
<col width="20%" class="col3"> 
<col width="20%" class="col4"> 
<col width="*" class="col5"> 
</colgroup> 
<thead> 
<tr class="first" > 
<th class="bdL pe_qK" scope="col"><img alt="Suite" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/suiteTbTita.gif" ></th> 
<th class="pe_qK" scope="col"><img alt="객실 수" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/allRoomsTbTitb.gif"></th> 
<th class="pe_qK" scope="col"><img alt="크기" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/allRoomsTbTitd.gif"></th> 
<th class="pe_qK" scope="col"><img alt="View" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/allRoomsTbTite.gif"></th> 
<th class="pe_qK" scope="col"><img alt="Bed" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/allRoomsTbTitf.gif"></th> 
</tr> 
</thead> 
<tbody> 
<tr> 
<th class="pe_qK" scope="row"><img alt="Corner" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/TbTitsj.gif"></th> 
<td>10</td> 
<td>66㎡</td> 
<td>산, 정원, 바다</td> 
<td>더블</td> 
</tr> 
<tr> 
<th class="pe_qK" scope="row"><img alt="Pacific Deluxe" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/TbTitsk.gif"></th> 
<td>10</td> 
<td>72㎡</td> 
<td>정원, 바다</td> 
<td>더블</td> 
</tr> 
<tr> 
<th class="pe_qK" scope="row"><img alt="Premier" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/TbTitsl.gif"></th> 
<td>6</td> 
<td>79㎡</td> 
<td>정원 ,바다</td> 
<td>더블</td> 
</tr> 
<tr> 
<th class="pe_qK" scope="row"><img alt="Superior" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/TbTitsm.gif"></th> 
<td>8</td> 
<td>79㎡</td> 
<td>산&nbsp;또는&nbsp;바다</td> 
<td>더블</td> 
</tr> 
<tr> 
<th class="pe_qK" scope="row"><img alt="Royal" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/TbTitsn.gif"></th> 
<td>2</td> 
<td>158㎡</td> 
<td>바다 </td> 
<td>더블</td> 
</tr> 
<tr class="last"> 
<th class="pe_qK" scope="row"><img alt="Presidential(WestWing)" src="<%=request.getContextPath()%>/images/accommodation/all_rooms/TbTitso.gif"></th> 
<td>2</td> 
<td>264㎡, 277㎡</td> 
<td>&nbsp;바다 </td> 
<td>더블</td> 
</tr> 
</tbody> 
</table>

					<!-- 여기임 -->

				</div>
				
				



<ul class="snsList">
	<li class="first"><a title="twitter - popup" href="http://www.shilla.net:80/jeju/accommodation/allRoom.do" onclick="openSNS('twitter','http://www.shilla.net:80/jeju/accommodation/allRoom.do', 'Accommodation | All Rooms | 제주신라호텔'); return false;" class="Twitter"><span>twitter</span></a></li>
	<li class="last"><a title="Facebook - popup" href="http://www.shilla.net:80/jeju/accommodation/allRoom.do" onclick="openSNS('facebook','http://www.shilla.net:80/jeju/accommodation/allRoom.do', 'Accommodation | All Rooms | 제주신라호텔'); return false;" class="Facebook"><span>Facebook</span></a></li>
</ul>


			</div>
				</div>
		<c:import url="/WEB-INF/common/footer.jsp"></c:import>
	</center>
</body>
</html>