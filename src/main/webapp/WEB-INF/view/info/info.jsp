<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/menu_common/infoSideMenu.css" rel="stylesheet" type="text/css">
<title>소개</title>

<style type="text/css">
th {
	background: #f1e3c4;
	border-bottom: 1px solid #000000;
	border-right: 1px solid black;
	border-left: 0.1px solid black; width : 150px;
	height: 40px;
	width: 150px;
}

td {
	text-indent: 30px;
	border-bottom: 1px solid #000000;
	border-right: 0.1px solid black;
}

table {
	border-top: 2px solid #000000;
	border-bottom: 2px solid #000000;
}
.contain{
	height: 1100px;
}
</style>

</head>
<body>
	<c:import url="/WEB-INF/common/top.jsp"></c:import>
	<c:import url="/WEB-INF/common/menu.jsp"></c:import>
	<div class="subBody mypageBody">
		<div class="contain">
			<div class="container">
				<c:import url="/WEB-INF/view/info/infoSideMenu.jsp"></c:import>
				<div class="contents" id="contents">

					<div class="ctnIntroduction ctnAboutSevenstar">
						<div class="ctnAcmd ctnDeluxe">

							<div class="headTit">
								<h2 class="tit">CHOONGANG Resort</h2>
							</div>

							<!-- content start -->
							<br> <br>
							<!-- Right Cont// -->
							<div class="right_cont">
								<p>
									<img src="<%=request.getContextPath()%>/images/1.jpg"
										width="800" height="400" />
								</p>
								<!-- 20160427 텍스트화 변경작업 // -->
								<div>
									<div>
										<h3>
											<span class="titleEn">LUXURY ALL-INCLUSIVE </span><span
												class="txtBar">/</span><br />럭셔리 라이프를 즐길 수 있는 천상의 휴양지
										</h3>
										<!--p class="subTxt01">켄싱턴 제주호텔에서만 만날 수 있는 특별한 기프트 아이템 - 기프트 샵</p-->
										<p class="subTxt02 ma_t5">
											<!-- 20160527 텍스트 수정 -->
											평생 잊을 수 없는 천상의 휴양, 럭셔리 올인클루시브형 리조트을 선보이는 중앙리조트에서는 휴양지에서의 <br />럭셔리
											라이프를 선보입니다. <br /> 국내.외 유명작가 갤러리를 통한 명작의 감동, 최정상 셰프의 손끝을 통한
											미각 감동, 루프탑 스카이피니티 풀, <br /> 사계절 모을정원을 통한 힐링의 감동까지. 최고의 시설에
											최상의 서비스로 품격을 더했습니다.
										</p>
									</div>
									<!-- //subTxtBox -->

									<br> <br>
									<table cellpadding="0" cellspacing="0" class="tableST01">
										<tbody>
											<tr>
												<th>개관일</th>
												<td colspan="3">2016. 12. 30</td>
											</tr>
											<tr>
												<th>이메일</th>
												<td colspan="3">ChoongangResort@google.com</a></td>
											</tr>
											<tr>
												<th>부지면적</th>
												<td>33,000㎡</td>
											</tr>
											<tr>
												<th>객실수</th>
												<td>221</td>
											<tr>
												<th>레스토랑&amp;바</th>
												<td colspan="3">7개</td>
											</tr>
											<tr>
												<th>부대시설</th>
												<td colspan="3">루프탑 수영장, 실내 &amp; 실외 수영장, 사우나, 피트니스 클럽,
													스파 등</td>
											</tr>
										</tbody>
									</table>

								</div>
								<!-- // 20160427 텍스트화 변경작업  -->

							</div>
							<!-- //Right Cont -->

						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</body>
</html>