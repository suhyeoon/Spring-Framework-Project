<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <div id="Menu_outline">
	<div id="Menu">
		<ul class="MenuUl">
			<li class="MenuLi"><a class="menuLink" href="${pageContext.request.contextPath}/info/info?check=info">소개</a>
				<ul class="submenu">
					<li><a href="${pageContext.request.contextPath}/info/info?check=info" class="submenuLink longLink">리조트소개</a></li>
					<li><a href="${pageContext.request.contextPath}/info/map?check=map" class="submenuLink longLink">오시는길</a></li>
					<li><a href="${pageContext.request.contextPath}/info/blockPlan?check=blockPlan" class="submenuLink longLink">리조트배치도</a></li>
					<li><a href="${pageContext.request.contextPath}/info/tour?check=tour" class="submenuLink longLink">주변관광지소개</a></li>
				</ul>
			</li>
			<li style="width:4px;">|</li>
			<li class="MenuLi">
			<a class="menuLink" href="${pageContext.request.contextPath}/room/standard/standard?check=standard">객실</a>
				<ul class="submenu sub2">
					<li><a href="${pageContext.request.contextPath}/room/standard/standard?check=standard" class="submenuLink longLink">스탠다드</a></li>
					<li><a href="${pageContext.request.contextPath}/room/premier/premier?check=premier" class="submenuLink longLink">프리미어</a></li>
					<li><a href="${pageContext.request.contextPath}/room/suite/norSuite?check=norSuite" class="submenuLink longLink">스위트</a></li>
				</ul>
			</li>
			<li style="width:4px;">|</li>
			<li class="MenuLi"><a class="menuLink" href="${pageContext.request.contextPath}/reservationStep01">예약</a>
			</li>
			<li style="width:4px;">|</li>
			<li class="MenuLi"><a class="menuLink" href="${pageContext.request.contextPath}/review/list">커뮤니티</a>
				<ul class="submenu sub4">
					<li><a href="${pageContext.request.contextPath}/review/list" class="submenuLink longLink">후기</a></li>
					<li><a href="${pageContext.request.contextPath}/suggest/list" class="submenuLink longLink">건의사항</a></li>
					<li><a href="${pageContext.request.contextPath}/qna/list" class="submenuLink longLink">Q&A</a></li>
					<li><a href="${pageContext.request.contextPath}/notice/list" class="submenuLink longLink">공지</a></li>
					<li><a href="${pageContext.request.contextPath}/event/list" class="submenuLink longLink">이벤트</a></li>
				</ul>
			</li>
			<li style="width:4px;">|</li>
			<li class="MenuLi"><a class="menuLink" href="${pageContext.request.contextPath}/spa?check=spa">휴식시설</a>
				<ul class="submenu sub5">
					<li><a href="${pageContext.request.contextPath}/spa?check=spa" class="submenuLink">스파</a></li>
					<li><a href="${pageContext.request.contextPath}/lounge?check=lounge" class="submenuLink">라운지</a></li>
					<li><a href="${pageContext.request.contextPath}/gallery?check=gallery" class="submenuLink">럭셔리갤러리</a></li>
					<li><a href="${pageContext.request.contextPath}/business?check=business" class="submenuLink">비지니스센터</a></li>
				</ul></li>
			<li style="width:4px;">|</li>
			<li class="MenuLi"><a class="menuLink" href="${pageContext.request.contextPath}/activity/camp?check=camp">액티비티</a>
				<ul class="submenu sub6">
					<li><a href="${pageContext.request.contextPath}/activity/camp?check=camp" class="submenuLink longLink">글램핑&캠핑</a></li>
					<li><a href="${pageContext.request.contextPath}/activity/fitness?check=fitness" class="submenuLink longLink">피트니스</a></li>
					<li><a href="${pageContext.request.contextPath}/activity/winebar?check=winebar" class="submenuLink longLink">와인파티</a></li>
					<li><a href="${pageContext.request.contextPath}/activity/gamezone?check=gamezone" class="submenuLink longLink">게임존</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>
<div id="sub_outline">

</div>
