<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="top_bg">
<div id="top">
	<div id="title"><h1><a href="<%=request.getContextPath()%>/main.jsp">
	<img src="<%=request.getContextPath()%>/images/main/choongang.png"></a></h1></div>
	<u:isLogin>
	<div id="login">
		<ul class="top_Menu">
			<li class="menu_li"><a href="${pageContext.request.contextPath}/logout" class="top_menu_a">Logout</a></li>
			<li style="width:3px;height:30px;margin:0;float:left;">|</li>
			<c:if test="${sessionScope.authGrade=='관리자'}">
			<li class="menu_li"><a href="${pageContext.request.contextPath}/management" class="top_menu_a">MasterPage</a>
			</li>
			<li style="width:3px;height:30px;margin:0;float:left;">|</li>
			</c:if>
			<li class="menu_li"><a href="${pageContext.request.contextPath}/myPageInfo" class="top_menu_a">MyPage</a>
				<ul class="myPageMenu">
					<li class="myPageSub"><a href="${pageContext.request.contextPath}/myPageInfo" class="subMenu_a">내정보 확인/수정</a></li>
					<li class="myPageSub"><a href="${pageContext.request.contextPath}/changePwd" class="subMenu_a">비밀번호변경</a></li>
					<li class="myPageSub"><a href="${pageContext.request.contextPath}/info_reservation" class="subMenu_a">예약정보확인</a></li>
				</ul>
			</li>
			<li style="width:3px;height:30px;margin:0;float:left;">|</li>
			<li class="menu_li"><a href="${pageContext.request.contextPath}/reservationStep01" class="top_menu_a">Reservation</a></li>
		</ul>
	</div>
	</u:isLogin>
	<u:notLogin>
		<div id="login">
		<ul class="top_Menu">
			<li class="menu_li"><a href="${pageContext.request.contextPath}/login" class="top_menu_a">Login</a></li>
			<li style="width:3px;height:30px;margin:0;float:left;">|</li>
			<li class="menu_li"><a href="${pageContext.request.contextPath}/agree" class="top_menu_a">Join</a></li>
			<li style="width:3px;height:30px;margin:0;float:left;">|</li>
			<li class="menu_li"><a href="${pageContext.request.contextPath}/login" class="top_menu_a">MyPage</a>
			<u:isLogin>
				<ul>
					<li class="masterSub"><a href="${pageContext.request.contextPath}/myPageInfo" class="subMenu_a">내정보 확인/수정</a></li>
					<li class="masterSub"><a href="${pageContext.request.contextPath}/changePwd" class="subMenu_a">비밀번호변경</a></li>
					<li class="masterSub"><a href="#" class="subMenu_a">예약정보확인</a></li>
				</ul>
			</u:isLogin>
			</li>
			<li style="width:3px;height:30px;margin:0;float:left;">|</li>
			<li class="menu_li"><a href="${pageContext.request.contextPath}/reservationStep01" class="top_menu_a">&nbsp;Reservation</a></li>
		</ul>
	</div>
	</u:notLogin>
</div>
</div>
